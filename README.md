<div align="center">

**鲲鹏Tensorflow Serving**
===============================

</div>

鲲鹏Tensorflow Serving是配套鲲鹏Tensorflow的高性能Serving，作为端到端推理benchmark系统的一部分，是推理服务端组件，它的主要职责是：

* 角色定位：作为推理服务后端，负责加载、管理并执行Tensorflow模型。
* 接口能力：提供gRPC/REST接口，接受客户端（如Tritonserver-client）发出的推理请求。
* 系统集成：内部基于鲲鹏Tensorflow执行模型，包括Executor、Kernel、XLA等优化机制。
* 性能测试：是端到端评估的关键对象，通过对其运行性能进行监控，可以分析模型延迟、吞吐量、线程调度效率及资源利用率。


## 安装

### 硬件要求

鲲鹏Tensorflow Serving提供对鲲鹏CPU的支持。

### 软件依赖

鲲鹏Tensorflow。

### 安装方式:

#### 源码构建

1、拉取代码
~~~
git clone -b {serving_tag} https://gitcode.com/boostkit/tensorflow-serving.git
~~~
其中，serving_tag需要替换为release版本的tag点。

2、环境准备

（1）硬件环境

鲲鹏920系列处理器

（2）操作系统

openEuler 22.03 LTS SP3，Kernel=5.10.0

（3）软件要求

GCC/G++：10.3.1

Bazel：6.5.0

Python 3.9

3、编译

~~~
sh compile_serving.sh
~~~

如果在编译过程中遇到任何问题，可参考以下文档：

[TensorFlow Serving推理部署框架 移植指南](https://www.hikunpeng.com/document/detail/zh/SRA/ecosystemEnable/TensorFlowServing/kunpengtfserving_02_0001.html)

### 支持的版本

| Kunpeng Tensorflow Serving  | Kunpeng TensorFlow |
| -------                     | -----------        |
| v2.15.1                     | v2.15.0            |


#### 版本兼容性
v2.15

## 支持
如果使用过程中有任何问题，或者需要反馈特性需求和bug报告，可以提交[isssues](https://gitcode.com/BoostKit/tensorflow/issues)联系我们。

## 许可协议
[Apache License 2.0](LICENSE)
通过下载并使用此源码及其附带的软件，您即同意遵守软件许可协议中的条款和条件。
