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
$ sudo apt-get install git build-essential gfortran cmake gdal-bin libgdal-dev libgsl-dev imagemagick default-jdk parallel gpg gdebi-core libpoppler-cpp-dev libfontconfig1-dev libcairo2-dev libharfbuzz-dev libfribidi-dev libmagick++-dev ninja-build lowdown poppler-utils bc rsync


## system monitor
$ sudo apt-get install htop btop neofetch hardinfo lm-sensors fancontrol smartmontools nload

## sensors
$ sudo sensors-detect
$ sensors

## disk management
$ sudo apt-get install ntfs-3g gparted exfatprogs udisks2

## text editor
$ sudo apt-get install vim emacs

## hardinfo2 stress test
$ sudo apt-get install s-tui

## zip archive
$ sudo apt-get install ark p7zip-full unrar unar lzop lrzip pigz

## accessoires
$ sudo apt-get install less eza
```

### 1.4 Nvidia driver

```
## reboot after installation
$ sudo apt-get install nvidia-detect nvidia-smi nvidia-cuda-toolkit nvtop
```

```
## check nvidia driver format
$ nvidia-detect

## check nvidia driver status
$ nvidia-smi
```

### 1.5 ssh

```
$ sudo systemctl enable --now sshd.service
$ sudo systemctl start sshd.service
```

## 2. Cloudflare tunnel

### 2.1 Install Docker

Install [Docker in Debian](https://docs.docker.com/engine/install/debian/#install-using-the-repository).

```
## run docker when start up
$ sudo systemctl enable docker

## add docker to users group
$ sudo usermod -aG docker $USER
$ newgrp docker
```

```
## list docker images
$ docker images

## list running docker images
$ docker ps
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

### 3.1 install R
```
## install latest R from https://community.hetzner.com/tutorials/how-to-install-r-on-debian
```

```
## install R/Bioconductor packages
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(version = "3.21")

curPkgsPath <- .libPaths()[1]
curPkgs <- unname(installed.packages()[, "Package"])

prePkgs <- as.character(read.csv("Downloads/Rpkgs.csv")[, 1])
insPkgs <- prePkgs[!(prePkgs %in% curPkgs)]

## install pkgs
install.packages(insPkgs)
BiocManager::install(insPkgs)

## install manually
install.packages("spDataLarge", repos = "https://geocompr.r-universe.dev")
BiocManager::install("plger/scDblFinder")
remotes::install_github('chris-mcginnis-ucsf/DoubletFinder', force = TRUE)
remotes::install_github("zqfang/MuDataSeurat", force = TRUE)
devtools::install_github('satijalab/seurat-data')
devtools::install_github("immunogenomics/presto")
remotes::install_github('satijalab/azimuth', ref = 'master')
remotes::install_github('satijalab/seurat-wrappers')
```


### 3.2 install R studio

```
## download libssl1.1 from https://snapshot.debian.org/package/openssl/1.1.1w-0%2Bdeb11u3/#libssl1.1_1.1.1w-0:2b:deb11u3
$ sudo dpkg -i libssl1.1_1.1.1w-0+deb11u3_amd64.deb

## download rstudio server from https://posit.co/download/rstudio-server/
$ sudo gdebi rstudio-server-2025.05.0-496-amd64.deb

$ sudo systemctl enable rstudio-server
```

## 4. Load disks

### 4.1 Mount external disks

```
## list external disk
$ lsblk

## mount
$ udisksctl mount -b /dev/SDE1

## unmount
$ udisksctl unmount -b /dev/SDE1
$ udisksctl power-off -b /dev/SDE
```

### 4.2 Format USB stake

```
## list usb stake
$ lsblk

$ sudo mkfs.exfat -n MYUSB /dev/SDE

$ sudo umount /dev/SDE
$ sudo udisksctl power-off -b /dev/SDE
```

## 5. Bioinformatics

### 5.1 Install Miniconductor

Follow [Miniconda install](https://www.anaconda.com/docs/getting-started/miniconda/system-requirements).

### 5.2 Single cell analysis

```
## scrublet for doublet detection
$ conda create -n SCscrublet python=3.9 scrublet
$ pip3 install igraph
$ pip3 install scanpy

## SCVI for integration
$ conda create -n SCscvi python=3.12
$ pip3 install -U scvi-tools[cuda]
$ pip3 install ipython scanpy scikit-image scikit-misc igraph adjustText

## SCVI with GPU umap
$ conda create -n SCscvi_umapGPU -y \
    -c rapidsai -c nvidia -c conda-forge -c pytorch \
    python=3.10 \
    cuml=25.08 \
    cupy \
    pytorch=2.4.* pytorch-cuda=12.1 torchvision torchaudio \
    pytorch-lightning=2.3.* \
    torchmetrics=1.4.* \
    scvi-tools=1.2.* \
    pdf2image \
    scikit-misc \
    umap-learn \
    numpy \
    python-igraph \
    scanpy \
    scikit-learn

$ conda activate SCscvi_umapGPU

## test
python - <<'PY'
import torch, scvi
from cuml.manifold import UMAP as cuUMAP
import cupy as cp

print("Torch:", torch.__version__, "CUDA available:", torch.cuda.is_available())
print("scvi-tools:", scvi.__version__)

X = cp.random.rand(500, 20, dtype=cp.float32)
emb = cuUMAP().fit_transform(X)
print("cuML UMAP embedding:", emb.shape)
PY
```

## 6. Jupyter nootbook

Install JupterLab

```
$ conda create -n Jupyter python=3.13 -y
$ conda activate Jupyter
$ conda install jupyterlab ipykernel nootbook -y

## set password
$ python -c "from jupyter_server.auth import passwd; print(passwd())"
$ emacs ~/.jupyter/jupyter_lab_config.py
```

## 7. Mics

```
## list enabled programs
$ systemctl list-unit-files --type=service | grep enabled

## real memory usage
$ ps aux --sort=-%mem | awk 'NR>1 {sum += $6} END {printf "Total RSS: %.2f GB\n", sum/1024/1024}'

## check disk
$ sudo smartctl -a /dev/nvme2n1
```


## References

1. [Debian source list](https://wiki.debian.org/SourcesList)

2. [Debian install Docker](https://docs.docker.com/engine/install/debian/#install-using-the-repository)

3. [libssh1.1](https://snapshot.debian.org/package/openssl/1.1.1w-0%2Bdeb11u3/#libssl1.1_1.1.1w-0:2b:deb11u3)

4. [Debian install latest R](https://community.hetzner.com/tutorials/how-to-install-r-on-debian)

5. [Miniconda install](https://www.anaconda.com/docs/getting-started/miniconda/system-requirements)
