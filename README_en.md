# Introduction to Kunpeng TensorFlow Serving

## Latest Updates

- [2025.09.30]: Added the TensorFlow ANNC for graph compilation optimization feature, providing optimizations including computational graph optimization, and generation and integration of high-performance fused operators.
- [2025.06.30]: Released the TensorFlow Serving thread scheduling optimization feature for the first time.

## Overview

Kunpeng TensorFlow Serving is a high-performance inference service component optimized for Kunpeng TensorFlow. As an inference server component within the end-to-end inference benchmark system, its main responsibilities are as follows:

- Role: As part of the end-to-end inference benchmark system, it is responsible for loading, managing, and executing TensorFlow models.
- Interface: Provides gRPC/REST interfaces to receive inference requests from clients (such as Triton server-client).
- System integration: Internally, TensorFlow Serving executes models based on Kunpeng TensorFlow, leveraging its underlying optimization mechanisms across the Executor, Kernel, and XLA.
- Performance test: It is a key object for end-to-end evaluation. By monitoring the running performance of TensorFlow Serving, you can analyze the model latency, throughput, thread scheduling efficiency, and resource utilization.

Kunpeng TensorFlow Serving's ranking inference library is an optimized acceleration framework for high performance. It provides the following features:

- Thread scheduling optimization

    In high-concurrency environments, sharing an inter-operator thread pool across multiple sessions often leads to resource contention. The TensorFlow Serving thread scheduling optimization feature resolves this by restructuring thread allocation, significantly boosting overall graph execution efficiency. Optimized operator scheduling and thread management ensure superior model inference throughput for high-concurrency environments.

- ANNC graph compilation optimization

    ANNC is a compiler dedicated to accelerating neural network computing. It focuses on technologies including computational graph optimization, generation and integration of high-performance fused operators, and efficient code generation. These capabilities significantly improve inference performance in recommendation scenarios.

For details about the Kunpeng TensorFlow Serving features, see [Kunpeng TensorFlow Serving Feature Introduction](./docs/en/feature_introduction.md).

## Directory Structure

The full directory structure of the TensorFlow Serving open-source repository is as follows:

```text
TensorFlow Serving
├── 0001-boostsra-tensorflow-serving.patch   // TensorFlow Serving patch file
├── LICENSE                                   // License file
├── README_en.md                                 // Open-source repository introduction
└── docs                                      // Documentation
```

## Version Description

For details about the version updates of Kunpeng TensorFlow Serving, see [Release Notes](./docs/en/release_notes.md).

## Documents

<table>
<thead align="left">
<tr id="row1291816372202">
<th class="cellrowborder" valign="top" width="9.780978097809781%" id="mcps1.1.4.1.1"><p id="p291823714205">Resource Type</p></th>
<th class="cellrowborder" valign="top" width="17.64176417641764%" id="mcps1.1.4.1.2"><p id="p13918183762016">Resource Name</p></th>
<th class="cellrowborder" valign="top" width="72.57725772577258%" id="mcps1.1.4.1.3"><p id="p89181437152019">Resource Description</p></th>
</tr>
</thead>
<tbody>
<tr id="row179181137112015">
<td class="cellrowborder" valign="top" width="9.780978097809781%" headers="mcps1.1.4.1.1"><p id="p1918123710208">Document</p></td>
<td class="cellrowborder" valign="top" width="17.64176417641764%" headers="mcps1.1.4.1.2"><p id="p2091893722011"><a href="./docs/en/release_notes.md">Release Notes</a></p></td>
<td class="cellrowborder" valign="top" width="72.57725772577258%" headers="mcps1.1.4.1.3"><p id="p491893752010">Provides basic information and feature updates of each Kunpeng TensorFlow Serving release.</p></td>
</tr>
<tr id="row179181137112015">
<td class="cellrowborder" valign="top" width="9.780978097809781%" headers="mcps1.1.4.1.1"><p id="p1918123710208">Document</p></td>
<td class="cellrowborder" valign="top" width="17.64176417641764%" headers="mcps1.1.4.1.2"><p id="p2091893722011"><a href="./docs/en/feature_introduction.md">Feature Introduction</a></p></td>
<td class="cellrowborder" valign="top" width="72.57725772577258%" headers="mcps1.1.4.1.3"><p id="p491893752010">Describes the Kunpeng TensorFlow Serving features.</p></td>
</tr>
<tr id="row939116371143">
<td class="cellrowborder" valign="top" width="9.780978097809781%" headers="mcps1.1.4.1.1"><p id="p1039163711413">Document</p></td>
<td class="cellrowborder" valign="top" width="17.64176417641764%" headers="mcps1.1.4.1.2"><p id="p03913372046"><a href="./docs/en/quick_start.md">Quick Start</a></p></td>
<td class="cellrowborder" valign="top" width="72.57725772577258%" headers="mcps1.1.4.1.3"><p id="p1139217371746">Provides guidance for getting started with Kunpeng TensorFlow Serving.</p></td>
</tr>
<tr id="row2918153732017">
<td class="cellrowborder" valign="top" width="9.780978097809781%" headers="mcps1.1.4.1.1"><p id="p598512211214">Document</p></td>
<td class="cellrowborder" valign="top" width="17.64176417641764%" headers="mcps1.1.4.1.2"><p id="p17918337172020"><a href="./docs/en/installation_guide.md">Installation Guide</a></p></td>
<td class="cellrowborder" valign="top" width="72.57725772577258%" headers="mcps1.1.4.1.3"><p id="p15918183742018">Describes how to compile and install Kunpeng TensorFlow Serving.</p></td>
</tr>
<tr id="row10576182811217">
<td class="cellrowborder" valign="top" width="9.780978097809781%" headers="mcps1.1.4.1.1"><p id="p25773281625">Document</p></td>
<td class="cellrowborder" valign="top" width="17.64176417641764%" headers="mcps1.1.4.1.2"><p id="p55779281524"><a href="./docs/en/best_practices.md">Best Practices</a></p></td>
<td class="cellrowborder" valign="top" width="72.57725772577258%" headers="mcps1.1.4.1.3"><p id="p1657712287211">Provides best practices of using Kunpeng TensorFlow Serving.</p></td>
</tr>
</tbody>
</table>

## Disclaimer

This code repository contributes to the TensorFlow Serving community. It strictly adheres to the coding style and methods, as well as security design of the native open-source software. Any vulnerability and security issues of the software shall be resolved by the corresponding upstream communities according to their response mechanisms. Please pay attention to the notifications and version updates released by the upstream communities. The Kunpeng computing community does not assume any responsibility for software vulnerabilities and security issues.

## License

This project is licensed under Apache License 2.0. For details, see the <a href="./LICENSE">LICENSE</a> file.

This project document is licensed under CC-BY 4.0. For details, see the <a href="./docs/en/LICENSE">LICENSE</a> file.

## Contribution Statement

We welcome your contributions to the community. If you have any questions/suggestions or want to provide feedback on feature requirements and bug reports, you can submit [issues](https://gitcode.com/boostkit/community/blob/master/docs/contributor/issue-submit.md). For details, see the [contribution guideline](https://gitcode.com/boostkit/community/blob/master/docs/contributor/contributing.md). You are also welcome to share insights in [Discussions](https://gitcode.com/boostkit/community/discussions). Thank you for your support.

## Acknowledgments

TensorFlow Serving is jointly developed by the following Huawei department:

- Kunpeng Computing BoostKit Development Dept

Thank you to everyone in the community for your PRs. We warmly welcome contributions to TensorFlow Serving!
