# 最佳实践

## 系统级优化

jemalloc（Jason Evans malloc） 是一个高性能、通用的内存分配器， 为提升TensorFlow Serving在高并发推理场景下的性能，鲲鹏TensorFlow Serving引入jemalloc内存分配器，以更高效地管理内存，减少线程间锁竞争和碎片，从而降低内存占用波动，提高推理请求的吞吐与稳定性。

1. 获取jemalloc源码并解压。

    ```bash
    wget https://github.com/jemalloc/jemalloc/archive/refs/tags/5.3.0.tar.gz --no-check-certificate
    tar zxvf 5.3.0.tar.gz
    ```

2. 进入安装目录。

    ```bash
    cd jemalloc-5.3.0/
    ```

3. 编译安装jemalloc。

    ```bash
    ./autogen.sh
    ./configure
    make -j
    make install
    ```

4. 安装验证。

    ```bash
    ll /usr/local/lib/libjemalloc*
    ```

    回显如下则安装成功：

    ![](figures/jemalloc.png)

5. 可通过设置"LD\_PRELOAD"环境变量使能jemalloc，并使用"MALLOC\_CONF"环境变量配置内存管理器行为，本文提供使能命令及针对鲲鹏平台的最优配置建议。

    ```bash
    export LD_PRELOAD="/usr/local/lib/libjemalloc.so"
    export MALLOC_CONF="background_thread:true,metadata_thp:auto,dirty_decay_ms:20000,muzzy_decay_ms:20000"
    ```

## 集成KDNN

KDNN（Kunpeng Deep Neural Network Library，鲲鹏DNN库）是华为提供的基于鲲鹏平台优化的高性能AI算子库，其中MatMul、FusedMatMul、SparseMatMul算子已经适配TensorFlow。集成KDNN可以降低NN类算子的时延，大幅增强模型推理性能。本节提供用户集成KDNN到Benchmark框架的方法。

1. 获取GCC版本的[KDNN软件包](https://gitcode.com/boostkit/boostsra/releases/download/v1.1.0/BoostKit-boostcore-kdnn_3.0.0.zip)，用户解压zip文件后可获取RPM安装包。
2. 安装KDNN。

    ```bash
    rpm -ivh boostcore-kdnn-3.0.0.1.aarch64.rpm
    ```

    头文件安装目录为“/usr/local/kdnn/include“，库文件安装目录为“/usr/local/kdnn/lib/threadpool“、“/usr/local/kdnn/lib/omp“。

3. 将KDNN头文件和静态库安装到“/path/to/tensorflow/third\_party/KDNN“目录。

    ```bash
    export TF_PATH=/path/to/tensorflow
    mkdir -p $TF_PATH/third_party/KDNN/src
    cp -r /usr/local/kdnn/include $TF_PATH/third_party/KDNN
    cp -r /usr/local/kdnn/lib/threadpool/libkdnn.a $TF_PATH/third_party/KDNN/src
    ```

4. 进入KDNN目录合入头文件补丁，解决TensorFlow不支持exception机制问题。

    ```bash
    cd $TF_PATH/third_party/KDNN
    patch -p0 < $TF_PATH/third_party/KDNN/tensorflow_kdnn_include_adapter.patch
    ```

5. 执行构建脚本编译。

    ```bash
    cd /path/to/serving
    sh compile_serving.sh --tensorflow_dir /path/to/tensorflow --features gcc12,kdnn
    ```

6. 集成后验证。
    1. 启动服务端。

        ```bash
        numactl -N 0 /path/to/serving/bazel-bin/tensorflow_serving/model_servers/tensorflow_model_server --port=8889 --model_name=deepfm --model_base_path=/path/to/model_zoo/models/deepfm --tensorflow_intra_op_parallelism=1 --tensorflow_inter_op_parallelism=-1 --xla_cpu_compilation_enabled=true
        ```

        >![](public_sys-resources/icon-note.gif) **说明：** 
        >**numactl -N 0**表示将程序绑定到第0个NUMA节点上运行。

    2. 启动客户端性能测试。

        ```bash
        docker run -it --rm --cpuset-cpus="$(cat /sys/devices/system/node/node0/cpulist)" --cpuset-mems="0" --net host  nvcr.io/nvidia/tritonserver:24.05-py3-sdk perf_analyzer --concurrency-range 28:28:1 -p 8000 -f perf.csv -m deepfm --service-kind tfserving -i grpc --request-distribution poisson -b 128  -u localhost:8889 --percentile 99 --input-data=random
        ```

        >![](public_sys-resources/icon-note.gif) **说明：** 
        >--cpuset-cpus：设置容器绑定的CPU核编号；
        >--cpuset-mems：设置容器绑定的NUMA内存节点。

        性能测试启动后，服务端打印“KDNN custom operations are on. You may see slightly different numerical results due to floating-point round-off errors from different computation orders. To turn them off, set the environment variable \`TF\_ENABLE\_KDNN\_OPTS=0\`”即表示使能成功。

        KDNN默认使能，可以通过设置环境变量TF\_ENABLE\_KDNN\_OPTS=0关闭KDNN。

        ![](figures/1_zh-cn_image_0000002504453619.png)
