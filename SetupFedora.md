## 1. Install and updates

```
# echo "Yulong ALL=(ALL)  ALL" >> /etc/sudoers

$ sudo dnf update -y

$ sudo dnf install fedora-workstation-repositories
$ sudo dnf config-manager --set-enabled google-chrome
$ sudo dnf install google-chrome-stable -y

$ sudo dnf install -y adobe-source-code-pro-fonts zsh
```

## 2. Zsh

```
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
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
'xml2', 'tidyverse'
```

## . Accesories

* Enlarge fonds

* double click

