## 1. Install and updates

### 1.1 Install

Use archinstall:

```
## choose KDE desktop
# archinstall
```

after installment, update system as:

```
$ sudo pacman -Syyu
```

Install yay:

```
$ sudo pacman -S git base-devel
$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg -si
```

```
yay
```

Install paru:

```
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

```
paru
```

### 1.2 Recommend packages

```
## basic development
$ sudo pacman -S git base-devel gcc-fortran cmake gdal gsl imagemagick jdk-openjdk parallel

## system monitor
$ sudo pacman -S htop neofetch
$ yay -S hardinfo2

## disk management
$ sudo pacman -S ntfs-3g gparted

## text editor
$ sudo pacman -S vim emacs

## hardinfo2 stress test
$ sudo pacman -S s-tui

## zip archive
$ sudo pacman -S ark p7zip unrar unarchiver lzop lrzip pigz

## accessoires
$ sudo pacman -S less exa
```


### 1.3 Chinese input

```
## fonts
$ sudo pacman -S adobe-source-han-serif-cn-fonts adobe-source-code-pro-fonts \
       wqy-zenhei \
       noto-fonts-cjk noto-fonts-emoji noto-fonts-extra

## fcitx5
$ sudo pacman -S fcitx5 fcitx5-gtk fcitx5-qt fcitx5-im fcitx5-chinese-addons fcitx5-configtool fcitx5-material-color fcitx5-pinyin-zhwiki fcitx5-rime librime

## gui-dependent
$ sudo pacman -S kwindowsystem kguiaddons

## baike Chinese wiki
$ yay -S fcitx5-pinyin-moegirl

## skin
$ yay -S fcitx5-skin-adwaita-dark
```

Add following lines in `/etc/environment`

```
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
```

Reboot and add pinyin on the input method list.

### 1.3 Blue tooth

```
## works even after reboot
$ sudo systemctl enable --now bluetooth.service

$ sudo systemctl start bluetooth.service
```

### 1.4 Nvidia driver

```
## check nvidia driver status
$ nvidia-smi
```

```
## install NVIDIA driver, reboot after installment
$ sudo pacman -S nvidia nvidia-utils
```

```
## NIVIDA top
$ nvidia-detect
```

### 1.5 Spacemacs

```
$ git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

$ wget -O ~/.spacemacs https://raw.githubusercontent.com/YulongNiu/dotfiles/master/spacemacsConfig
```

### 1.6 ssh

```
$ sudo pacman -S openssh

$ sudo systemctl enable --now sshd.service
$ sudo systemctl start sshd.service
```

## 2. Cloudflare tunnel

### 2.1 Install Docker
```
## install and enable docker
$ sudo pacman -S docker docker-compose

$ sudo systemctl enable --now docker

## list running docker images
$ sudo docker ps
```

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

```
## docker image uses the host port directly
$ sudo docker run --rm --name cloudflared \
    --network=host \
    cloudflare/cloudflared:latest tunnel --no-autoupdate \
    run --token MyToken
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
$ sudo pacman -S R

$ yay -S rstudio-server-bin
$ sudo systemctl start rstudio-server
$ sudo systemctl enable rstudio-server
```

```
## install BioConductor
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(version = "3.20")

curPkgsPath <- .libPaths()[1]
curPkgs <- unname(installed.packages()[, "Package"])

prePkgs <- as.character(read.csv("Downloads/tmp1.csv")[, 1])

## install pkgs fron CRAN
insPkgs <- prePkgs[!(prePkgs %in% curPkgs)]

install.packages(insPkgs)
BiocManager::install(insPkgs)

install.packages("spDataLarge", repos = "https://geocompr.r-universe.dev")
```

## 4. Bioinformatics toolkits

### 4.1 SRA tools

```
$ yay -S sra-tools
```


## References

1. [Arch Linux 安装使用教程](https://archlinuxstudio.github.io/ArchLinuxTutoria)

2. [Install yay](https://github.com/Jguer/yay)

3. [Fcitx 最佳配置实践 (附带语言大模型) 2024-12-17](https://manateelazycat.github.io/2024/12/17/fcitx-best-config/)

4. [archlinux 简明指南包含安装、配置、维护等，帮助新手快速上手](https://arch.icekylin.online/)
