# FAQs<a name="ZH-CN_TOPIC_0000002550251133"></a>

## FAQs About Installation<a name="ZH-CN_TOPIC_0000002549759469"></a>

- If the message "unable to find valid certification path to requested target" is displayed, you can fix it by following the instructions in [Failed to Verify the Certificate When Compiling TensorFlow 2.13.0 Source Code](https://www.hikunpeng.com/document/detail/en/SRA/ecosystemEnable/TensorFlow/kunpengtensorflow_02_0012.html) in the _TensorFlow Porting Guide_.
- If the message "Error in download_and_extract" is displayed, you can fix it by following the instructions in [Failed to Download the TF-Serving Source Code Dependency](https://www.hikunpeng.com/document/detail/en/SRA/ecosystemEnable/TensorFlowServing/kunpengtfserving_06_0014.html) in the _TensorFlow Serving Porting Guide_. The directory specified by `--distdir` is `/path/to/tensorflow-serving/download`.

- If the system displays a message indicating that the `org_boost` dependency library fails to be pulled, you can fix it by following the instructions in [Failed to Obtain the Dependency of the org_boost Sub-repository](https://www.hikunpeng.com/document/detail/en/SRA/ecosystemEnable/TensorFlowServing/kunpengtfserving_06_0015.html) in the _TensorFlow Serving Porting Guide_.

- If the system displays a message indicating that the Golang website certificate is unavailable, you can fix it by following the instructions in [No Golang Website Certificate](https://www.hikunpeng.com/document/detail/en/SRA/ecosystemEnable/TensorFlowServing/kunpengtfserving_06_0016.html) in the _TensorFlow Serving Porting Guide_.

- If the system displays a message indicating that the Golang download fails during ANNC compilation, you can fix it by following the instructions in [Failed to Download the TF-Serving Source Code Dependency](https://www.hikunpeng.com/document/detail/en/SRA/ecosystemEnable/TensorFlowServing/kunpengtfserving_06_0014.html) in the _TensorFlow Serving Porting Guide_. The directory specified by `--distdir` can be specified in the `build.sh` script.

- If the system displays a message indicating that the `upb.c` file fails to be compiled, you can fix it by following the instructions in [Syntax Error Reported During upb.c Compilation](https://www.hikunpeng.com/document/detail/en/SRA/ecosystemEnable/TensorFlowServing/kunpengtfserving_06_0017.html) in the _TensorFlow Serving Porting Guide_.
