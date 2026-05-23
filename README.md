# APB PROTOCOL

The Advanced Peripheral Bus (APB) is a low cost interface that is part of the AMBA (Advanced Microcontroller Bus Architecture) family. It is optimized for minimal power consumption and reduced interface complexity, making it suitable for connecting low-bandwidth peripheral devices such as UARTs, GPIOs, timers, and sensors.

---

## Key Characteristics

- Simple and synchronous protocol  
- Non-pipelined architecture (each transfer requires at least two clock cycles)  
- Separate read and write operations  
- Handshake based communication mechanism  
- Typically supports 32-bit wide data buses  

---

## System Use & Architecture

The APB protocol is not designed for high performance burst transfers.  
It is mainly used for accessing control and status registers of peripheral devices.

APB peripherals are generally connected to high-performance memory systems using a bridge such as an AXI-to-APB bridge.

- The bridge acts as the **Requester (Master)**
- The peripheral acts as the **Completer (Slave)**

---

## Roles in APB Communication

### Requester
Initiates the APB transfer transaction.

### Completer
Responds to the transfer request and provides/read data.

---

## Purpose of APB

- Connects low bandwidth peripherals to high performance processors or memory systems  
- Simplifies peripheral interface design using a straightforward protocol  
- Reduces dynamic power consumption, making it suitable for SoC and embedded system applications  
