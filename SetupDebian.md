## 1. Install and updates

### 1.1 Add `sudo` group

```
$ su -
# apt-get install sudo
# usermod -aG sudo UserName
```

### 1.2 Add source

Use `nano` to replace source lines in `/etc/apt/sources.list` with:

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

### 1.3 Recommended packages

```
## basic development
$ sudo apt-get install git build-essential gfortran cmake gdal-bin libgdal-dev libgsl-dev imagemagick default-jdk parallel

## system monitor
$ sudo apt-get install htop btop neofetch hardinfo

## disk management
$ sudo apt-get install ntfs-3g gparted

## text editor
$ sudo apt-get install vim emacs

## hardinfo2 stress test
$ sudo apt-get install s-tui

## zip archive
$ sudo apt-get install ark p7zip-full unrar unar lzop lrzip pigz

## accessoires
$ sudo apt-get install less exa
```

### 1.2 Nvidia driver

```
## reboot after installation
$ sudo apt-get install nvidia-detect nvidia-smi
```

```
## check nvidia driver format
$ nvidia-detect

## check nvidia driver status
$ nvidia-smi
```

## 2. Cloudflare tunnel

### 2.1 Install Docker

Install [Docker in Debian](https://docs.docker.com/engine/install/debian/#install-using-the-repository).

### 2.2 Setup Cloudflare
Setup on Cloudflare left pannel,

```
Zero Trust --> Networks --> Tunnels --> Select Cloudflared

Name your tunnel: randomly pick a name

## run the docker image on host
Install and run connectors: Docker

Public Hostnames:
Subdomain xxx
Domain yyy
Type SSH
URL localhost:22
```

Run docker automatically when start up:

```
$ sudo docker run -d \
         --restart unless-stopped \
         --name cloudflared \
         --network=host \
         cloudflare/cloudflared:latest tunnel --no-autoupdate \
         run --token MyToken
```

### 2.3 client

```
$ ssh -o ProxyCommand="/usr/local/bin/cloudflared access ssh --hostname Subdomain.Domain" Usrname@Subdomain.Domain

$ sftp -o ProxyCommand="/usr/local/bin/cloudflared access ssh --hostname Subdomain.Domain" Usrname@Subdomain.Domain

## login without password
$ ssh-copy-id -o ProxyCommand="/usr/local/bin/cloudflared access ssh --hostname Subdomain.Domain" Usrname@Subdomain.Domain
```

## 3. R

```
## install R
sudo apt install r-base r-base-dev
```



https://posit.co/download/rstudio-server/



## References

1. [Debian source list](https://wiki.debian.org/SourcesList)

2. [Debian install Docker](https://docs.docker.com/engine/install/debian/#install-using-the-repository)
