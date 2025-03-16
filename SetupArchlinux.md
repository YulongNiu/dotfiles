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

### 1.2 Recommend packages

```
## basic development
$ sudo pacman -S git base-devel

## system monitor
$ sudo pacman -S htop neofetch

## disk management
$ sudo pacman -S ntfs-3g gparted

## text editor
$ sudo pacman -S vim emacs

## hardinfo2 stress test
$ sudo pacman -S s-tui

## zip archive
$ sudo pacman -S ark p7zip unrar unarchiver lzop lrzip
```

Install yay:

```
$ sudo pacman -S --needed git base-devel
$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg -si
```

```
yay
```

### 1.3 Chinese input

```
## fonts
$ sudo pacman -S adobe-source-han-serif-cn-fonts adobe-source-code-pro-fonts \
       wqy-zenhei \
       noto-fonts-cjk noto-fonts-emoji noto-fonts-extra

## fcitx5
$ sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-configtool fcitx5-material-color fcitx5-pinyin-zhwiki

## gui-dependent
$ sudo pacman -S kwindowsystem kguiaddons

$ yay -S fcitx5-pinyin-moegirl
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
$ sudo systemctl enable bluetooth.service

$ sudo systemctl start bluetooth.service
```

### 1.4 Nvidia driver

```
$ sudo apt-get install nvidia-detect
```

```
## check nvidia driver format
$ nvidia-detect

## check nvidia driver status
$ nvidia-smi
```

### 1.5 Spacemacs

```
$ git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

$ wget -O ~/.spacemacs https://raw.githubusercontent.com/YulongNiu/dotfiles/master/spacemacsConfig
```

### 1.6 ssh

```
$ sudo pacman -S openssh

$ sudo systemctl enable sshd.service
$ sudo systemctl start sshd.service

```

## References

1. [Arch Linux 安装使用教程](https://archlinuxstudio.github.io/ArchLinuxTutoria)

2. [Install yay](https://github.com/Jguer/yay)
