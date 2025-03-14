## 1. Install and updates

### 1.1 Install

Use archinstall:

```
# archinstall
```

after installment, update system as:

```
$ sudo pacman -Syyu
```

### 1.2 Recommend packages

```
$ sudo packman -S htop neofetch \
       fdisk gparted \
       vim emacs \
```

### 1.3 Chinese input

```
$ sudo packman -S adobe-source-han-serif-cn-fonts wqy-zenhei noto-fonts-cjk noto-fonts-emoji noto-fonts-extra

$ sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwik fcitx5-material-color

$ sudo packman -S kwindowsystem kguiaddons
```

Reboot and add pinyin on the input method list.

### 1.3 Blue tooth

```
$ sudo pacman -S bluez bluez-utils bluez-obex blueman

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

Download

## References

1. [Arch Linux 安装使用教程](https://archlinuxstudio.github.io/ArchLinuxTutoria)

2. 
