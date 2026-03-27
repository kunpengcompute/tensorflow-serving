# 鲲鹏TensorFlow Serving介绍

## 最新消息

- \[2025.09.30\]：新增TensorFlow ANNC图编译优化特性提供计算图优化，高性能融合算子生成与对接等优化技术。
- \[2025.06.30\]：TensorFlow Serving线程调度优化特性首次发布。

## 项目介绍

鲲鹏TensorFlow Serving是专为鲲鹏TensorFlow优化的高性能推理服务组件，作为端到端推理benchmark系统的一部分，是推理服务端组件，它的主要职责是：

- 角色定位：作为端到端推理benchmark系统的一部分，负责加载、管理并执行TensorFlow模型。
- 接口能力：提供gRPC/REST接口，接受客户端（如Tritonserver-client）发出的推理请求。
- 系统集成：TensorFlow Serving内部基于鲲鹏TensorFlow执行模型，包括Executor、Kernel、XLA等优化机制。
- 性能测试：是端到端评估的关键对象，通过对其运行性能进行监控，可以分析模型延迟、吞吐量、线程调度效率及资源利用率。

鲲鹏TensorFlow Serving排序推理加速库是华为提供的基于鲲鹏平台优化的排序推理加速库，主要包括如下两个特性：

- 线程调度优化

    TensorFlow Serving线程调度优化特性是鲲鹏针对高并发场景下，TensorFlow多Session共享算子间线程池严重降低整图计算效率问题提出的优化方案。通过改进算子调度算法，并加入了线程管理优化，有效提升高并发场景下的模型推理吞吐量。

- ANNC图编译优化

    ANNC 是专注于加速神经网络计算的编译器，聚焦于通过计算图优化，高性能融合算子生成和对接技术，高效代码生成和优化能力，加速推荐的推理性能。

关于鲲鹏TensorFlow Serving特性的详细介绍请参见[《鲲鹏TensorFlow Serving特性介绍》](./docs/feature_introduction.md)。

## 目录结构

TensorFlow Serving开源仓项目全量目录层级介绍如下：

```text
TensorFlow Serving
├── 0001-boostsra-tensorflow-serving.patch    // TensorFlow Serving补丁文件
├── LICENSE                                   // License文件
├── README.md                                 // 开源仓介绍
└── docs                                      // 文档
```

## 版本说明

关于鲲鹏TensorFlow Serving的版本更新情况请参见[《鲲鹏TensorFlow Serving版本说明书》](./docs/release_notes.md)。

## 学习文档

<table>
<thead align="left">
<tr id="row1291816372202">
<th class="cellrowborder" valign="top" width="9.780978097809781%" id="mcps1.1.4.1.1"><p id="p291823714205">学习资源类别</p></th>
<th class="cellrowborder" valign="top" width="17.64176417641764%" id="mcps1.1.4.1.2"><p id="p13918183762016">学习资源名称</p></th>
<th class="cellrowborder" valign="top" width="72.57725772577258%" id="mcps1.1.4.1.3"><p id="p89181437152019">学习资源简介</p></th>
</tr>
</thead>
<tbody>
<tr id="row179181137112015">
<td class="cellrowborder" valign="top" width="9.780978097809781%" headers="mcps1.1.4.1.1"><p id="p1918123710208">文档</p></td>
<td class="cellrowborder" valign="top" width="17.64176417641764%" headers="mcps1.1.4.1.2"><p id="p2091893722011"><a href="./docs/release_notes.md">版本说明书</a></p></td>
<td class="cellrowborder" valign="top" width="72.57725772577258%" headers="mcps1.1.4.1.3"><p id="p491893752010">提供鲲鹏TensorFlow Serving每个发布版本的基础信息和特性更新信息。</p></td>
</tr>
<tr id="row179181137112015">
<td class="cellrowborder" valign="top" width="9.780978097809781%" headers="mcps1.1.4.1.1"><p id="p1918123710208">文档</p></td>
<td class="cellrowborder" valign="top" width="17.64176417641764%" headers="mcps1.1.4.1.2"><p id="p2091893722011"><a href="./docs/feature_introduction.md">特性介绍</a></p></td>
<td class="cellrowborder" valign="top" width="72.57725772577258%" headers="mcps1.1.4.1.3"><p id="p491893752010">提供鲲鹏TensorFlow Serving特性介绍。</p></td>
</tr>
<tr id="row939116371143">
<td class="cellrowborder" valign="top" width="9.780978097809781%" headers="mcps1.1.4.1.1"><p id="p1039163711413">文档</p></td>
<td class="cellrowborder" valign="top" width="17.64176417641764%" headers="mcps1.1.4.1.2"><p id="p03913372046"><a href="./docs/quick_start.md">快速入门</a></p></td>
<td class="cellrowborder" valign="top" width="72.57725772577258%" headers="mcps1.1.4.1.3"><p id="p1139217371746">提供鲲鹏TensorFlow Serving快速入门指导。</p></td>
</tr>
<tr id="row2918153732017">
<td class="cellrowborder" valign="top" width="9.780978097809781%" headers="mcps1.1.4.1.1"><p id="p598512211214">文档</p></td>
<td class="cellrowborder" valign="top" width="17.64176417641764%" headers="mcps1.1.4.1.2"><p id="p17918337172020"><a href="./docs/installation_guide.md">安装指南</a></p></td>
<td class="cellrowborder" valign="top" width="72.57725772577258%" headers="mcps1.1.4.1.3"><p id="p15918183742018">提供鲲鹏TensorFlow Serving编译安装方法指导。</p></td>
</tr>
<tr id="row10576182811217">
<td class="cellrowborder" valign="top" width="9.780978097809781%" headers="mcps1.1.4.1.1"><p id="p25773281625">文档</p></td>
<td class="cellrowborder" valign="top" width="17.64176417641764%" headers="mcps1.1.4.1.2"><p id="p55779281524"><a href="./docs/best_practices.md">最佳实践</a></p></td>
<td class="cellrowborder" valign="top" width="72.57725772577258%" headers="mcps1.1.4.1.3"><p id="p1657712287211">提供鲲鹏TensorFlow Serving的使用实践案例。</p></td>
</tr>
</tbody>
</table>

## 免责声明

此代码仓计划参与TensorFlow Serving社区开源，编码风格遵照原生开源软件，继承原生开源软件安全设计，不破坏原生开源软件设计及编码风格和方式，软件的任何漏洞与安全问题，均由相应的上游社区根据其漏洞和安全响应机制解决。请密切关注上游社区发布的通知和版本更新。鲲鹏计算社区对软件的漏洞及安全问题不承担任何责任。

## License

本项目采用Apache License 2.0许可证。详见<a href="./LICENSE">LICENSE</a>文件

本项目文档适用CC-BY 4.0许可证，具体请参见<a href="./docs/LICENSE">LICENSE</a>文件。

## 贡献声明

欢迎大家为社区做贡献，如果使用过程中有任何问题/建议，或者需要反馈特性需求和bug报告，可以提交[Issues](https://gitcode.com/boostkit/community/blob/master/docs/contributor/issue-submit.md)联系我们，具体贡献方法可参考[这里](https://gitcode.com/boostkit/community/blob/master/docs/contributor/contributing.md)。同时也欢迎大家在[讨论专区](https://gitcode.com/boostkit/community/discussions)展开讨论交流。感谢您的支持。

## 致谢
 
TensorFlow Serving由华为公司的下列部门联合贡献：

- 鲲鹏计算Boostkit开发部

感谢来自社区的每一个PR，欢迎贡献TensorFlow Serving！
