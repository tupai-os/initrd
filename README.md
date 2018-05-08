# Initrd

---

Tupai's initial ramdisk

## Building

**NOTE: The initrd is designed to be built from the root repository. The following instructions may be outdated.**

To build the initrd, run the following command in the root directory of the repository:

```
make all TARGET=<target>
```

where `<target>` is one of `x64`, `i386` or `rpi2`.
