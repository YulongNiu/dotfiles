## 1. Install and updates

```
# echo "Yulong ALL=(ALL)  ALL" >> /etc/sudoers

$ sudo dnf update -y

## install chrome
$ sudo dnf install fedora-workstation-repositories
$ sudo dnf config-manager --set-enabled google-chrome
$ sudo dnf install google-chrome-stable -y

## fzug Chinese
$ sudo dnf install https://mirrors.tuna.tsinghua.edu.cn/fzug/free/29/x86_64/fzug-release-29-0.1.noarch.rpm

$ sudo dnf install -y adobe-source-code-pro-fonts zsh sogoupinyin \ 
       fcitx-{ui-light,qt{4,5},table,gtk{2,3},table-{extra,other,chinese},configtool} \
```

## 2. Zsh

```
## 'candy' theme is accommonded
$ sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
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
> install.packages(c('xml2', 'tidyverse', 'BiocManager', 'RcppArmadillo', 'RcppParallel', 'devtools'))
> BiocManager::install(c('edgeR', 'DESeq2', 'tximport'))
```

## . Accesories

* Enlarge fonds

* double click

* WPS

```
wget http://kdl.cc.ksosoft.com/wps-community/download/8372/wps-office-11.1.0.8372-1.x86_64.rpm
sudo rpm -ivh wps-office-11.1.0.8372-1.x86_64.rpm
```

