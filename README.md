APB PROTOCOL
The Advanced Peripheral Bus (APB) is a low-cost interface that is part of the AMBA (Advanced Microcontroller Bus Architecture) family. It is optimized for minimal power consumption and reduced interface complexity, making it suitable for connecting low-bandwidth peripheral devices such as UARTs, GPIOs, timers, and sensors.

Key Characteristics:
Simple, Synchronous Protocol
Non-pipelined: Every transfer takes at least two clock cycles
Read and Write Operations are separated
Handshake-based communication
Typically 32-bit wide data buses
System Use & Architecture:
The APB is not intended for high-performance burst transfers.
It is mainly used to access control/status registers of peripheral devices.
APB peripherals are usually connected to main memory systems via a bridge, such as an AXI-to-APB bridge.
This bridge acts as a master, called a Requester, while the peripheral is called a Completer.
Roles:
Requester: Initiates the APB transfer (usually the APB bridge)
Completer: Responds to the request (typically the peripheral)
Purpose:
Connects low-bandwidth peripherals to high-performance cores or memory subsystems
Simplifies peripheral design through its straightforward protocol
Reduces dynamic power usage, ideal for SoCs and embedded systems
