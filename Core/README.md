# iOS-Roadmap-Demos
Learning demos and practice projects following iOS development roadmap.

# Core Concepts

1. Core OS
2. Core Services
3. Cocoa Touch 

![Core_](https://github.com/user-attachments/assets/f624e91e-7c82-4e01-8795-007300a5561b)


## Topics Covered 

**🔹 1. Core OS Layer**

Foundation of iOS – **low-level system services & security.** 

* Kernel & Drivers
    * Darwin OS (Mach + BSD + I/O Kit)
    * Manages memory, CPU, processes, and hardware communication

* Security Frameworks
    * Secure Enclave – Manages biometric and encryption data
    * Keychain Services – Securely stores passwords, keys, etc.

* File System
    * APFS – Optimized for SSD, supports encryption & snapshots

* Concurrency & Power
    * Grand Central Dispatch (GCD) – Efficient task execution (queues, groups, semaphores)
    * Power & Memory Management – Optimizes battery and resource use

* System Communication
    * XPC – Lightweight interprocess communication (IPC)
    * System Configuration – Access and manage network settings

**🔹 2. Core Services Layer**

Provides essential services like **data storage, networking, location, and motion.**

🛠 Key Functional Areas:

* Data Management
    * Core Data – Object graph, persistence, undo/redo, change tracking
    * SQLite – Lightweight embedded database

* Networking
    * CFNetwork – Low-level networking (sockets, DNS, FTP, HTTPS)
    * URLSession – High-level HTTP networking

* Location & Motion
    * Core Location – GPS, geofencing, beacon detection, heading
    * Core Motion – Access to accelerometer, gyroscope, magnetometer

* Web Integration
    * WebKit – Render web content using WKWebView, JavaScript execution

* Core Foundation
    * Low-level C-based utilities: strings, dates, run loops (base for Foundation)

**🔹 3. Cocoa Touch Layer**

High-level frameworks for **UI, interaction, multimedia, and app experience.** 

🎨 UI & User Interaction:
* UIKit – Main UI framework: views, buttons, animations, touch handling
* Foundation – Shared layer with Core Services for data, dates,localization
* Multimedia & Advanced Features:
* Core Motion – Motion data from sensors 
* AVFoundation – Audio/video recording and playback
* GameKit – Leaderboards, multiplayer, achievements
* MapKit – Embed Apple Maps and location data
* MessageUI – In-app email and messaging
* EventKit – Calendar events and reminders

