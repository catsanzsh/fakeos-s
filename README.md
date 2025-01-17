# fakeos-s
1.0
# FakeOS-S

Welcome to **FakeOS-S**, a minimalistic operating system designed to experiment with OS concepts and architecture. This repository is part of an open-source initiative to develop a functional, lightweight operating system for educational and experimental purposes.

---

## Features

- **Basic Kernel Functions**: Includes fundamental OS kernel operations.
- **Lightweight Architecture**: Designed to run efficiently on limited hardware.
- **Customizable**: Modular structure for easy extensions and modifications.
- **Bootloader**: Implements a simple bootloader for system startup.
- **File Management**: Experimental file system operations (read/write).
- **User Interaction**: Basic shell or CLI for interacting with the system.

---

## Requirements

- **Toolchain**: GCC or Clang with cross-compilation support for x86/x64.
- **Development Environment**: Unix/Linux preferred.
- **Emulator**: QEMU or equivalent for testing.
- **Assembler**: NASM or equivalent.

---

## Getting Started

### Clone the Repository

```bash
$ git clone https://github.com/catsanzsh/fakeos-s.git
$ cd fakeos-s
```

### Build the OS

1. Ensure you have a working cross-compiler toolchain.
2. Run the provided build script or Makefile.

```bash
$ make
```

### Test the OS

1. Launch using QEMU:

```bash
$ qemu-system-x86_64 -drive format=raw,file=fakeos.img
```

2. Alternatively, test on real hardware (use at your own risk).

---

## Folder Structure

- **`/src`**: Core source code for the OS.
- **`/boot`**: Bootloader and initial setup files.
- **`/docs`**: Documentation and design notes.
- **`/build`**: Compiled binaries and temporary build artifacts.
- **`/tools`**: Utility scripts and helper programs.

---

## Contribution

Contributions are welcome! If you would like to contribute, follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Submit a pull request for review.

---

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute it as per the license terms.

---

## Acknowledgments

- Inspired by various OS development tutorials and projects.
- Special thanks to the open-source community for tools and resources.

---

## Contact

For questions or feedback, open an issue or reach out via GitHub.
