# VGA-Image_procesing-FPGA
 VGA Controller with Image Processing – – Designed a VGA controller using Verilog HDL to generate synchronization signals and implemented basic image processing logic for real-time pixel manipulation on FPGA.
# VGA Controller with Image Processing (Verilog)

##  Overview
This project implements a VGA controller using Verilog HDL to drive a 640×480 @ 60Hz display. It generates the required synchronization signals and performs real-time image processing for pixel-level manipulation on an FPGA.

##  Features
- VGA timing generation (HSYNC, VSYNC)
- 640×480 @ 60Hz resolution support
- Pixel coordinate generation (x, y)
- Real-time image processing (color inversion)
- RGB test pattern generation (color bars)

##  Architecture
The design is divided into three main modules:
- **vga_controller.v** – Generates synchronization signals and pixel coordinates
- **image_processing.v** – Applies pixel-level transformations
- **top.v** – Integrates VGA control and image processing

##  Requirements
- FPGA development board (e.g., Basys 3, Nexys A7)
- 25 MHz clock input
- VGA monitor
- Verilog-supported synthesis tool (Vivado/Quartus)

##  Output
- Displays RGB color bars on a VGA monitor
- Applies real-time color inversion to pixels

##  How It Works
1. VGA controller generates horizontal and vertical sync signals.
2. Pixel coordinates are used to create a test pattern.
3. Image processing module modifies pixel data in real time.
4. Processed RGB signals are sent to the VGA display.

##  Project Structure
vga-controller-image-processing-verilog/ │── vga_controller.v │── image_processing.v │── top.v │── README.md
