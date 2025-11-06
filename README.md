# 项目介绍<a name="ZH-CN_TOPIC_0000002442690522"></a>

鲲鹏Tensorflow Serving是配套鲲鹏Tensorflow的高性能Serving，作为端到端推理benchmark系统的一部分，是推理服务端组件，它的主要职责是：

-   角色定位：作为推理服务后端，负责加载、管理并执行Tensorflow模型。
-   接口能力：提供gRPC/REST接口，接受客户端（如Tritonserver-client）发出的推理请求。
-   系统集成：内部基于鲲鹏Tensorflow执行模型，包括Executor、Kernel、XLA等优化机制。
-   性能测试：是端到端评估的关键对象，通过对其运行性能进行监控，可以分析模型延迟、吞吐量、线程调度效率及资源利用率。

# 版本说明<a name="ZH-CN_TOPIC_0000002476066673"></a>

<a name="table476019753714"></a>
<table><thead align="left"><tr id="row127711783716"><th class="cellrowborder" valign="top" width="50%" id="mcps1.1.3.1.1"><p id="p177117753719"><a name="p177117753719"></a><a name="p177117753719"></a>Kunpeng Tensorflow Serving</p>
</th>
<th class="cellrowborder" valign="top" width="50%" id="mcps1.1.3.1.2"><p id="p127711772374"><a name="p127711772374"></a><a name="p127711772374"></a>Kunpeng TensorFlow</p>
</th>
</tr>
</thead>
<tbody><tr id="row177718717372"><td class="cellrowborder" valign="top" width="50%" headers="mcps1.1.3.1.1 "><p id="p167716717372"><a name="p167716717372"></a><a name="p167716717372"></a>v2.15.1</p>
</td>
<td class="cellrowborder" valign="top" width="50%" headers="mcps1.1.3.1.2 "><p id="p577117733720"><a name="p577117733720"></a><a name="p577117733720"></a>v2.15.0</p>
</td>
</tr>
</tbody>
</table>

# 环境部署<a name="ZH-CN_TOPIC_0000002476146473"></a>

**硬件要求<a name="section19905171013614"></a>**

鲲鹏Tensorflow Serving提供对鲲鹏CPU的支持。

**软件依赖<a name="section2088201912369"></a>**

鲲鹏Tensorflow。

**安装方式<a name="section14505103219363"></a>**

1、拉取代码
1) 开源tensorflow-serving代码
```
git clone -b 2.15.1 https://github.com/tensorflow/serving.git open-serving
```
2) 搜推广优化patch
```
git clone -b master https://gitcode.com/boostkit/tensorflow-serving.git sra-serving
```

3) 将patch打到开源serving代码仓
```
cp sra-serving/0001-boostsra-tensorflow-serving.patch open-serving
cd open-serving
patch -p1 < 0001-boostsra-tensorflow-serving.patch 
```

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

```
sh compile_serving.sh 
```

如果在编译过程中遇到任何问题，可参考以下文档：

[TensorFlow Serving推理部署框架 移植指南](https://www.hikunpeng.com/document/detail/zh/SRA/ecosystemEnable/TensorFlowServing/kunpengtfserving_02_0001.html)

# 快速上手<a name="ZH-CN_TOPIC_0000002442866560"></a>

参考[搜推排序模型推理Benchmark](https://www.hikunpeng.com/document/detail/zh/SRA/perfEval/benchmarksra/kunpengmodelzoo_06_0001.html)。

# 贡献指南<a name="ZH-CN_TOPIC_0000002442706668"></a>

如果使用过程中有任何问题，或者需要反馈特性需求和bug报告，可以提交isssues联系我们，具体贡献方法可参考[这里](https://gitcode.com/boostkit/community/blob/master/docs/contributor/contributing.md)。

# 免责声明<a name="ZH-CN_TOPIC_0000002476066677"></a>

此代码仓计划参与Tensorflow-Serving社区开源，编码风格遵照原生开源软件，继承原生开源软件安全设计，不破坏原生开源软件设计及编码风格和方式，软件的任何漏洞与安全问题，均由相应的上游社区根据其漏洞和安全响应机制解决。请密切关注上游社区发布的通知和版本更新。鲲鹏计算社区对软件的漏洞及安全问题不承担任何责任。

# 许可证书<a name="ZH-CN_TOPIC_0000002476146477"></a>

[Apache License 2.0](https://gitcode.com/boostkit/tensorflow-serving/blob/master/LICENSE)  通过下载并使用此源码及其附带的软件，您即同意遵守软件许可协议中的条款和条件。

