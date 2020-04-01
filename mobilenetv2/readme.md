CNN accelerator based on FPGA
===
  This folder contains the VHDL code for MobileNetV2 on FPGA.
## Model
  The reference model is mobilenet_v2_1.0_128, refer more information on [MobileNet](https://github.com/tensorflow/models/tree/master/research/slim/nets/mobilenet).
## Framework
  This is the framework of our accelerator.
  ![](https://github.com/eda-lab/CNNAF-CNN-Accelerator/raw/master/mobilenetv2/frame.png)
## Platform
  Hardware platform is C5P FPGA of Terasic, Cyclone V 5CGXFC9D6F27C7.<br>
  IP version is based on quartus17.1.
## Other information
  The shortcut module and top level module are still in building.
