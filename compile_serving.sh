#/bin/bash
set -x

TENSORFLOW_DIR=""
ENABLE_GCC12=false
ENABLE_KTFOP=false
ENABLE_ANNC=false
KTFOP_OPTIONS=""

usage() {
    echo "Usage: $0 --tensorflow_dir <path> [--features <feature1,feature2>]"
    echo "Example: $0 --tensorflow_dir /path/to/tensorflow --features gcc12,annc"
    exit 1
}

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --tensorflow_dir)
            TENSORFLOW_DIR="$2"
            shift 2
            ;;
        --features)
            if [[ -z "$2" ]]; then
                echo "Error: --features requires a value"
                usage
            fi
            IFS=',' read -ra features_array <<< "$2"
            for feature in "${features_array[@]}"; do
                case "$feature" in
                    "gcc12") ENABLE_GCC12=true ;;
                    "ktfop") ENABLE_KTFOP=true ;;
                    "annc") ENABLE_ANNC=true ;;
                    *) 
                        echo "Warning: Unknown feature '$feature', ignoring"
                        ;;
                esac
            done
            shift 2
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo "Unknown parameter: $1"
            usage
            ;;
    esac
done

if [[ -z "$TENSORFLOW_DIR" ]]; then
    echo "Error: --tensorflow_dir is required"
    usage
fi

if [[ ! -d "$TENSORFLOW_DIR" ]]; then
    echo "Error: TensorFlow directory does not exist: $TENSORFLOW_DIR"
    exit 1
fi
TF_SERVING_COMPILE_ROOT=$(pwd)
DIST_DIR=$TF_SERVING_COMPILE_ROOT/download
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin

export PATH=$BAZEL_PATH:$PATH
DIST_DIR="${DISTDIR:-$DIST_DIR}"
BAZEL_COMPILE_CACHE=$TF_SERVING_COMPILE_ROOT/output

if ! command -v bazel &> /dev/null; then
    echo "Error: Bazel is not installed. Please install Bazel and try again."
    exit 1
fi

bazel version

FEATURES=$3
IFS=',' read -ra features_array <<< "$FEATURES"
for feature in "${features_array[@]}"; do
    case "$feature" in
        "gcc12")
            ENABLE_GCC12=true
            ;;
        "ktfop")
            ENABLE_KTFOP=true
            ;;
        "annc")
            ENABLE_ANNC=true
            ;;
        *)
            echo "未识别的特性: $feature"
            ;;
    esac
done

if [ "$ENABLE_GCC12" == true ]; then
    PATH=/opt/openEuler/gcc-toolset-12/root/usr/bin/:$PATH
    LD_LIBRARY_PATH=/opt/openEuler/gcc-toolset-12/root/usr/lib64
    GCC_VERSION=$(gcc -dumpversion | cut -d. -f1)
    if [[ "$GCC_VERSION" != "12" ]]; then
        echo "Error: GCC version is $GCC_VERSION. Please install GCC 12. Consider use command: yum install gcc-toolset-12-gcc*"
        exit 1
    fi
fi

if [ "$ENABLE_KTFOP" == true ]; then
    KTFOP_OPTIONS="--config=ktfop"
fi

if [ "$ENABLE_ANNC" == true ]; then
    ANNC_OPTIONS="--config=fused_embedding --define tflite_with_xnnpack=false"
fi

gcc --version
cd $TF_SERVING_COMPILE_ROOT && \
PATH=$PATH \
LD_LIBRARY_PATH=$LD_LIBRARY_PATH \
bazel --output_user_root=$BAZEL_COMPILE_CACHE build -c opt --distdir=$DIST_DIR \
--override_repository=org_tensorflow=$TENSORFLOW_DIR \
--copt=-march=armv8.3-a+crc --copt=-O3 --copt=-fprefetch-loop-arrays \
--copt=-Wno-error=maybe-uninitialized --copt=-Werror=stringop-overflow=0 \
$KTFOP_OPTIONS \
$ANNC_OPTIONS \
tensorflow_serving/model_servers:tensorflow_model_server
