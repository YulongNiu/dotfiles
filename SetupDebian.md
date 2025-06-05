## 1. Install and updates

### 1.1 Add source

```
$ sudo apt-get install vim htop
```

Replace source lines in `/etc/apt/sources.list` with:

```
deb https://deb.debian.org/debian bookworm main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian bookworm main contrib non-free non-free-firmware

deb https://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
deb-src https://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware

deb https://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware
```

```
## update system packages
$ sudo apt-get update
$ sudo apt-get upgrade
```

### 1.2 Nvidia driver

```
$ sudo apt-get install nvidia-detect
```

```
## check nvidia driver format
$ nvidia-detect

## check nvidia driver status
$ nvidia-smi
```

Download

### 1.3 Additional tools

```
$ sudo apt-get install htop btop neofetch \
       

```

## References

1. [Debian source list](https://wiki.debian.org/SourcesList)

2.
