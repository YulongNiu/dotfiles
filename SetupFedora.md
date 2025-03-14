## 1. Install and updates

```
# echo "Yulong ALL=(ALL)  ALL" >> /etc/sudoers

$ sudo dnf update -y

## rpmfusion
$ sudo dnf install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

## install chrome
$ sudo dnf install fedora-workstation-repositories
$ sudo dnf config-manager --set-enabled google-chrome
$ sudo dnf install google-chrome-stable -y

## pandoc and rmarkdown
$ sudo dnf install pandoc pandoc-citeproc texlive-titling texlive-framed texlive-nowidow texlive-parnotes \
       texlive-preprint texlive-marginfix texlive-xstring

$ sudo dnf install -y adobe-source-code-pro-fonts zsh \
       fcitx-{ui-light,qt{4,5},table,gtk{2,3},table-{extra,other,chinese},configtool} \
       gperftools-devel
```

## 2. Zsh

```
## 'candy' theme is accommonded
$ sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

## powerline10k
$ git clone https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
$ echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
$ git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

$ cat >>  ~/.bashrc <<END
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_DISABLE_RPROMPT=true
END
```

## 3. Emacs

```
$ git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
$ wget -O ~/.spacemacs https://raw.githubusercontent.com/YulongNiu/dotfiles/master/spacemacsConfig
```

## 4. GitHub

```
$ git config --global user.name "Yulong Niu"
$ git config --global user.email yulong.niu@hotmail.com
$ git config --global core.editor emacs
$ git config --global merge.tool vimdiff
$ git config --global color.ui true

$ ssh-keygen -t rsa -C 'yulong.niu@hotmail.com'
$ cat /home/Yulong/.ssh/id_rsa.pub ## add it to GitHub SSH keys
```

## 5. R

```
## install R packages
$ sudo R
> install.packages(c('xml2', 'tidyverse', 'BiocManager', 'RcppArmadillo', 'RcppParallel', 'devtools', 'foreach', 'doParallel', 'testthat', 'roxygen2', 'e1071', 'gplots', 'dendextend', 'dynamicTreeCut', 'ape', 'magrittr', 'bigmemory', 'knitr', 'rmarkdown', 'tinytex', 'rvcheck'))
> BiocManager::install(c('edgeR', 'DESeq2', 'tximport', 'rhdf5', 'BiocStyle', 'goseq', 'Biostrings', 'Rsamtools'))
> tinytex::install_tinytex()
```

## 6. Accesories

* Enlarge fonds

* double click

* [WPS](https://www.wps.com/linux)

```
## https://linux.wps.com/

## Missing fonts for WPS: https://github.com/IamDH4/ttf-wps-fonts
```

* [GoldenDict](https://github.com/goldendict/goldendict)

```
$ sudo dnf install bzip2-devel gcc-c++ git hunspell-devel \
       libvorbis-devel libXtst-devel phonon-devel \
       qt-devel qtwebkit ffmpeg ffmpeg-devel \
       lzo lzo-devel eb eb-devel libao libao-devel \
       qtwebkit-devel libtiff-devel lzma opencc-devel

$ git clone git://github.com/goldendict/goldendict.git
$ cd goldendict
$ qmake-qt4 "CONFIG+=zim_support" "CONFIG+=chinese_conversion_support" && make
# make install
```
