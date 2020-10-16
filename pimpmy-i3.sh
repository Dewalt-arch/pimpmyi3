#!/bin/bash
#
# pimpmy-i3.sh
# Author : Dewalt
#
# I didnt write this for you I wrote this for me,
# If you dont like it! DONT COMPLAIN ABOUT IT!
#
# i3 Desktop Background is ~/Pictures/background.jpg
# place desktop background in that dir and that filename
#
# WARNING: THIS WILL OVERWRITE ANY EXISTING CONFIGURATIONS!
# ~/.config/i3/config /etc/i3status.conf ~/.config/rofi/config
# /etc/i3status.conf and /usr/bin/i3-alt-tab.py
# i3-gaps terminator rofi numlockx flameshot compton feh
#
# See README.md for full details
# Standard Disclaimer : Author assumes no liability for any damages

# Some desktop backgrounds found online... Mileage may vary
# ONLY UNCOMMENT ONE URL= statement
# -------Desktop Backgrounds
# kali matrix blue
  # url="https://www.hdwallpaper.nu/wp-content/uploads/2017/04/linux-19.jpg"
# really bright kali with binary
  # url="https://www.zastavki.com/pictures/originals/2015/Backgrounds_Digital_background_Kali_Linux_108405_.jpg"
# red kali matrix (small)
  # url="https://cdn.wallpapersafari.com/22/84/wMsI06.png"
# bright kali techno
  # url="http://getwallpapers.com/wallpaper/full/c/3/5/49158.jpg"
# hacktheplanet grid background
  url="https://cdn.wallpapersafari.com/58/71/89CoIb.jpg"
# -------End Desktop Backgrounds

# --- script vars do not change
# Variables required in the script
finduser=$(logname)
runner=$(whoami)
user_background="/home/$finduser/Pictures/background.jpg"
root_background="/$runner/Pictures/background.jpg"
backupdate=$(date +%s)
revision="ALPHA"
# ---

# since were going whole hog here
# unicorn puke:
    red=$'\e[1;31m'
    green=$'\e[1;32m'
    blue=$'\e[1;34m'
    magenta=$'\e[1;35m'
    cyan=$'\e[1;36m'
    yellow=$'\e[1;93m'
    white=$'\e[0m'
    bold=$'\e[1m'
    norm=$'\e[21m'
# ---

# status indicators
    greenplus='\e[1;33m[++]\e[0m'
    greenminus='\e[1;33m[--]\e[0m'
    redminus='\e[1;31m[--]\e[0m'
    redexclaim='\e[1;31m[!!]\e[0m'
    redstar='\e[1;31m[**]\e[0m'
    blinkexclaim='\e[1;31m[\e[5;31m!!\e[0m\e[1;31m]\e[0m'
    fourblinkexclaim='\e[1;31m[\e[5;31m!!!!\e[0m\e[1;31m]\e[0m'
# ---

# Debating the whole base64 thing and just putting the config files on github
# maybe in rev0.2 ill move the config files to github
# ~/.config/i3/config  modkey is ALT change to Mod4 for Windows Key
# set $modkey Mod1    is for the ALT key
# set $modkey Mod4    is for the Widnows Key
i3config=$(base64 -d <<< "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" | gunzip)

# wifi is commented out of i3status.conf
# tun0 is shown as VPN: in i3status.conf
i3status_conf=$(base64 -d <<< "H4sIAAAAAAAAA3VTzW4TMRA+s08xuLJEBWmpEAhF5Bh+D
gEEhaqnaLKeJBZee7FnU1LgWXgYXozxpqROmu5hJY+/n/nzEdhniZG7BHXwc7voIrINHubW0Ul1B
IkIVIN+i1MwDxFMqLuGPPfgk0qA7xhsAtu0ITJ6Bl5i/kksS+U7MpbJACb4cv568DKrny9J5JwLV
9YvwFlPkJahcyZnw2g9oAQwtpCGAv/7JxvNRZYAZ2FFG4po+8BCiZFqdmswNrUO12SeiPkPWIcu9
u6S+NzGxA+rakGeIjr4WcHNVwcXYoIRcOxoG7WeKa4EOILn1W8pNERDER6PQNl29UJVt2eStKInq
brzT1WJvLKRHKUE095+epC1vSuIM2SxXwM6V3Kkvm9wWkZcQFOeG2pCXJcRvmbbSMNCjaJV7SQrX
XggU22Qp10rlaqvH98PQdsWHunUEpljtQWYcOW3kHxQuS37FRZ93RG+GIrk9w6dZamKQQvHmuPsp
fYZ/50uCp/9bt3nM95P/x7tcaFdNPuObMbqm4eiW4p13v0FgY7UyJrK9vYS/WDUqTrMxxVa1+Pyu
A5jzhq7yWYzwcOgLsk7+gUbQZw5uq2Pl5HkCTkzNbSIaAQojLM3dztQXE/Gkw+fLuHVjqLkUO7M4
UwuB7oZaAP67VBPhvpzpv0D51U5iFQEAAA=" | gunzip )

# base rofi menu config
# change theme with rofi-theme-selector
rofi_config=$(base64 -d <<< "H4sIAAAAAAAAAyvKT8vUK8lIzU21UtAvLS7SL85ILErVLwI
K64OFi/UT81KK8jNT4vPySzLTMpMTSzLz8/SKEoszuQCRyr3ZPQAAAA==" | gunzip)

# /usr/bin/i3-alt-tab.py
# modkey+alt tabs windows on a single virtual desktop
# modkey+shift+alt tabs windows on all virtual desktops in sequence
i3_alt_tab_py=$(base64 -d <<< "H4sIAAAAAAAAA7VWS4/bNhC+61ewbgNJiB/Z+BZABXpob
+0lQXsQBJkWaZtZmRRIyl6j6H/vDEm9bHW3SFEdvN55zzffjPX9d5vW6M1eyA2XF9Lc7EnJbRQtF
otIbFe0titL9+vmRlarKPqJMWJPnBxUXaurkEdSC8kNsYrcVKvJbrcW202l5EEcd7tPUfT5Kmx1I
krWN/ggVas1l5ZclX42Da241ySMH2hb2zTa7XYRgcdwS34QW1tCASUUQMLTUHvaWLWZliYffcxJH
ILnvE/jfKBvZm5n8qtiT++/gDV/4RXI3Z9xAY/WnzGD87mz7lO7bjoIaF0TQIypqyHf2iYG+ZZWe
7//v13kTSTOjdKWmHbfaFVxYzrJV6MkqI9SaV5KeuYkI3lclmIbF53Y3hovZqp6pppTUEVRVVNjy
B8ewETtv/LKpp9cmUAeAiGksGWZGF4fgtwDVR/WgHhG/vxrKgQqloKB4jcl+aPqakJ5Tt3noYy5F
EviDZZEKsZHCcUhaIiQXfZBOyop92bFmjYNlyxxcXpDXhv+qhsihC7FODMK8vigqtZwFhczAfquv
akAq3mjvn//ZUCgodrwgIHVnHdITDFATR6jPC4QidHIp1VpblstH12RBRNXFLzlGmNXJkYvjEKoZ
KTmMgnVOGWRTqMclHZgdE693dRsgnAoLstI3F+y+NEenx5H7+kRebB0sHtk0a7H9BU+9Ej5o4JYG
UhiHWEfa3EZkL0db9E5hcXCmYIS1qn0kYAfSThUS8D4wqGq8gxVZb9QqGLZHfGyb73EI5590W1HA
qht3mioy+1kSONoHb4O3PMoTRt3XvmAHw7vgpMbIq0vtG65Se7GDJ7vM3Lpyhv3NQ6/DookDXcWg
eHM7UG+evKZx5QZb3fPD1wrZMe4KcGmBe3hsj2P706XCEM4ued3rxomHaZ2pkImVB8vGY489Kta2
7QWwgzHd12dePVcek0C1W1XZ3OMlyReWfw8cjjfwAZYDRfCrU7mbvW6VpTBuXWuqT8CUAVOoTvFa
S8MBPZHIdZK2Ti4YJElLCK44Triv2locRgDKJFCTj7PnrEFYN1H/TEjHwdwqzOiiMr8qYAGrlwn6
XhGYJB/8Nsr4/uTMl+PZ+LUt3nd1y3LK/urqTCc/I5k/VlrpZPYNLwShxvc9YK/WAIky5sCosbpX
Mfb2Y4/vtVxdVf120jP9U7/bZT/gEJVhJdFBIIWdd3hgM3OXay7c/VPhypw8mE/KnhJmmxHLli2e
McWBXG/qDF5RxLB0gKvpsBXDrxSZekAKUvcxrIMuHQvQDfjc93Mmr8ImwwriyK3B2n0N/Ab4bSDC
wAA" | gunzip)

# base ~/.config/terminator/config
# dont like settings or font choices - change them!
# font changed to Source-Code-Pro-Italic not Light Italic
terminator_config=$(base64 -d <<< "H4sIAAAAAAAAA22RTU/DMAyG7/yKaNxRx4UTJyQkb
khM4hBNUZq4rVUvrpxEU/89XlsEG+SUvI9fxx+2J249ucCpw/54Z0eYW0wRU5/1NQl3SKBXY6yN0
PlK5Xh5GdP6MPbCNUUXvYwJcjbPpnl4uqVlnkBJEZ/y5AVSWSJClcziWsI0Kn71lOE3yINffJoCR
IOuYGBiUbi798vZLbDjVFT84CoBzAtHMO/C5q14wmD2j1uQwFbZT5am6bqmWbPkgc+uYCFovVxVl
oMwkapu4owFOSkeMEZIVzyMDnWeCculgYPU1V4zuDznAie3VbqmtuRnruXfKVtrz7oPPjfHTTFmG
+jnom/aOthLL7tvXxiQ4v6P7QBywuTp1rh9o0un2mPSar4AHUIwHB0CAAA=" | gunzip)

# base ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml
# turn off the silly xfce power management
xfce_power_config=$(base64 -d <<< "H4sIAAAAAAAAA53SQU7DMBAF0H1OEXk/pEgsWCTpj
hOUA4ydSWJ1MrZsp2luT2gJqIIC7XJkvf89lsvtceD8QCFaJ5V6fNionMS4xkpXqdfdCzyrbZ1lp
elRhDgXHKhSx9bQE3g3UYABBTsK6jKlzvK89MF5Cmn+TaXZL0c0+DSf0Hd2BnpMyQmgSUvHJSt+d
rF3E3hcbg2Mmvj/KAWcwZqvHu3cwg/I4zK0yJGueXZmD9EEIoE4Rk/SQG81BcFE98R19j0BpWECt
g3EySbT356kGWUPpxdcsZX0aTfXXOOHeGYQmciveLxVu7a9w5KgZmr+2rcsVlxnZfHxWevsDQrIA
tLfAgAA" | gunzip)

# pimpmy-i3 asciiart
asciiart=$(base64 -d <<< "H4sIAAAAAAAAA41QMQoDMQzb8wqNnc4fOG4o94CuhYApNFuhUA
6OQh5f2Ymb61YngyVLCk7CqEkV/xWVUUAypoOqWlsfDAaka/pGUJm7IrcIh8iVM8EgOG5wNpffeM
yAnkwztwhjdMHi3ZWH5mAa9MQK8QTBeIyziGC+2CJ2CeXAODRrPS4isaukzoyxBbsXl+deXuVOmA
Xn98+HrmW/PTaTIn0AuTB/NpMBAAA=" | gunzip)

# base ~/.zshrc
# skull and circle-k have been replaced with @
# /sbin and /usr/sbin added to PATH=
dot_zshrc=$(base64 -d <<< "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" | gunzip)

option3=$(base64 -d <<< "H4sIAAAAAAAAA5VSTWvDMAy951eoN+mwmPUPjMFg7LLBbgODSLf
ShoW4rCmjoB8/+St1mlCY4yR2/J6enhSApcFXo1pEGEDwE4DibRegBhPKYziAKRHsFRYxvvxZDkv
5g85qCjb+hNNhADHp0qvRDJ+yQKZRKDFrRNZ3rZsyecw5R4ejheS1jkqlSCoG5sgY/GLIqs4c//n
CwQk62aAgozum7LzQSRSb9NWR34awOTcKMbDklJkpIxJ4rDGOtb7WufQuSlES4CjFOPWT7YwFhlH
FUzho+0Bl3Vg7oCf+gUFSooheTMT+1ieXFMVS3lgr0nWddCLGmEsHrRLnP27IyqAZPZOdtrHEQc5
HYjo3oAYFfFBKmdMcmH9v1MEo3hzlZs+Cpr9OxKIoVozIIhLzQlF+kkhC3rAFxojReinaWrDLgY3
68fVUqPFBFQkBbCH04u6/Qzkf7gQ/26brzjDs3Wm3H+AFfpsj7Fzb72Bw0G0HOCuq7Y+D4pTjDkP
reriHx9cnWMPGDfvVwwoqPXp2sGk+v6Hpv+DQ6mLEvr3n9bqua6j+AFXx/5noBAAA" | gunzip )

lightdm_conf=$(base64 -d <<< "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
66Y/Lv4H8kTgoVQbAAA=" | gunzip )

check_for_root () {
  if [ "$EUID" -ne 0 ]
    then echo -e "\n\n Script must be run with sudo ./pimpmy-i3.sh or as root \n"
    exit_screen
  fi
  }

check_distro() {
  distro=$(uname -a | grep -i -c "kali") # distro check
  if [ $distro -ne 1 ]
     then echo -e "\n $blinkexclaim Sorry I only work on Kali Linux $blinkexclaim \n"; exit_screen  # false
  fi
  }

i3_fix_user () {
  # /home/username/.config
  apt update $silent
  echo -e "\n  $greenplus apt updated "
  apt install -y i3-gaps compton feh flameshot numlockx rofi terminator $silent
  echo -e "\n  $greenplus installed: i3-gaps compton feh flameshot numlockx rofi terminator"

  # make dirs - should already be there but if not make them
  mkdir -p /home/$finduser/.config
  echo -e "\n  $greenplus mkdir /home/$finduser/.config"
  mkdir -p /home/$finduser/.config/i3
  echo -e "\n  $greenplus mkdir /home/$finduser/.config/i3"
  mkdir -p /home/$finduser/.config/rofi
  echo -e "\n  $greenplus mkdir /home/$finduser/.config/rofi"
  mkdir -p /home/$finduser/.config/terminator
  echo -e "\n  $greenplus mkdir /home/$finduser/.config/terminator"

  # virtualbox shared folder symlink
  eval ln -sf /mnt/shared /home/"$finduser"
  echo -e "\n  $greenplus symlink /mnt/shared /home/$finduser"

  # start making things sexy!! configs
  # Turn that damn xfce powermanagement OFF!!
  echo -e "$xfce_power_config" > /home/$finduser/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml
  echo -e "\n  $greenplus turned off xfce power management"

  # ~/.config/i3/config and ~/.config/rofi/config
  echo -e "$i3config"          > /home/$finduser/.config/i3/config
  echo -e "\n  $greenplus creating /home/$finduser/.config/i3/config"
  echo -e "$rofi_config"       > /home/$finduser/.config/rofi/config
  echo -e "\n  $greenplus creating /home/$finduser/.config/rofi/config"

  # /etc/i3status.conf
  echo -e "$i3status_conf"     > /etc/i3status.conf
  echo -e "\n  $greenplus creating /etc/i3status.conf"

  ln -sf /etc/i3status.conf      /home/$finduser/.config/i3/i3status.conf
  echo -e "\n  $greenplus symlink /home/$finduser/.config/i3/i3status.conf"

  # ~/.config/terminator/config
  echo -e "$terminator_config" > /home/$finduser/.config/terminator/config
  echo -e "\n  $greenplus creating /home/$finduser/.config/terminator/config"

  # ~/.config/i3/i3-alt-tab.py
  # needed for i3's alt+tab and metakey+tab
  echo -e "$i3_alt_tab_py"      > /usr/bin/i3-alt-tab.py
  echo -e "\n  $greenplus creating /usr/bin/i3-alt-tab.py"
  chmod 755 /usr/bin/i3-alt-tab.py
  echo -e "\n  $greenplus chmod 755 /usr/bin/i3-alt-tab.py"
  ln -sf /usr/bin/i3-alt-tab.py /home/$finduser/.config/i3/i3-alt-tab.py
  echo -e "\n  $greenplus symlink /home/$finduser/.config/i3/i3-alt-tab.py"
  chown -R $finduser:$finduser /home/$finduser
  echo -e "\n  $greenplus chown -R $finduser:$finduser /home/$finduser"

  # /etc/lightdm/lightdm.conf # enable lightdm autologin for user and set autologin session to i3
  # its a pentesting distro not a daily driver, bypass login screen and get on with it
  # sets autologin-user=$finduser (probably kali in most cases)
  # sets autologin-session=i3
  # -- note if this is already set its going to file, preform check here for already exsting values?
  cp /etc/lightdm/lightdm.conf /etc/lightdm/.lightdm.conf_$backupdate
  echo -e "\n  $greenplus creating backup /etc/lightdm/.lightdm.conf_$backupdate"
  echo -e "$lightdm_conf" > /tmp/tmp_lightdm.conf
  eval cat /tmp/tmp_lightdm.conf | sed 's/#autologin-user=/autologin-user='$finduser'/' > /tmp/lightdm.conf
  cp -f /tmp/lightdm.conf /etc/lightdm/lightdm.conf
  echo -e "\n  $greenplus lightdm autologin-user=$finduser"
  eval cat /etc/lightdm/lightdm.conf | sed 's/#autologin-session=/autologin-session=i3/' > /tmp/lightdm.conf
  echo -e "\n  $greenplus lightdm autologin-session=i3"
  cp -f /tmp/lightdm.conf /etc/lightdm/lightdm.conf
  echo -e "\n  $greenplus new lightdm.conf created /etc/lightdm/lightdm.conf"

  # backup existing .bashrc and generate new .bashrc with path statement
  # -- .bashrc backed up so no one looses their alias's and function's
  cp /home/$finduser/.bashrc /home/$finduser/.bashrc-backup-$backupdate
  echo -e "\n  $greenplus backup .bashrc created in /home/$finduser/.bashrc-backup-$backdate"
  eval echo -e "export PATH=$PATH:/sbin:/usr/sbin" > /tmp/path_export
  cat /tmp/path_export /etc/skel/.bashrc  > /home/$finduser/.bashrc
  source /home/$finduser/.bashrc
  echo -e "\n  $greenplus new .bashrc created in /home/$finduser/.bashrc"

  # backup existing .zshrc and generate new custom .zshrc from base64 encoded
  # dont have that stupid skull on root or circle-k on user
  # export PATH=$PATH:/sbin:/usr/sbin already included in base64 encoded file
  echo -e "\n  $greenplus backup .zshrc created in /home/$finduser/.zshrc-backup-$backdate"
  cp /home/$finduser/.zshrc  /home/$finduser/.zshrc-backup-$backupdate
  echo -e "$dot_zshrc" > /home/$finduser/.zshrc
  echo -e "\n  $greenplus new .zshrc created in /home/$finduser/.zshrc"

  # change shell from bash to zsh - may get prompted for a password here as user
  echo -e "\n  $greenplus changing shell to zsh enter $finduser password:"
  sudo -u $finduser chsh --shell /bin/zsh
  echo -e "\n  $greenplus shell changed to zsh for $finduser"

  # cleanup
  rm -f /tmp/tmp_lightdm.conf /tmp/path_export /tmp/lightdm.conf
  echo -e "\n  $greenplus cleanup rm -f /tmp/tmp_lightdm.conf /tmp/path_export /tmp/lightdm.conf"
  }

i3_fix_root () {
# /root/.config
  # put checks in here for already existing dirs if exist do not create and do not copy
  apt update $silent
  echo -e "\n  $greenplus apt updated "
  apt install -y i3-gaps compton feh flameshot numlockx rofi terminator kali-root-login $silent
  echo -e "\n  $greenplus installed: i3-gaps compton feh flameshot numlockx rofi terminator kali-root-login"

  # kali-root-login is also installed by pimpmykali.sh - not needed here - debate this
  echo -e "\n Kali-Root-Login was installed enter password for root : "
  passwd root

  # make dirs
  mkdir -p /$runner/.config
  echo -e "\n  $greenplus mkdir /$runner/.config"
  mkdir -p /$runner/.config/i3
  echo -e "\n  $greenplus mkdir /$runner/.config/i3"
  mkdir -p /$runner/.config/rofi
  echo -e "\n  $greenplus mkdir /$runner/.config/rofi"
  mkdir -p /$runner/.config/terminator
  echo -e "\n  $greenplus mkdir /$runner/.config/terminator"

  # copy /home/kali/* and /home/kali/.* to /root
  cp -Rvf /home/kali/*  /root
  echo -e "\n  $greenplus cp -Rvf /home/kali/*  /root"
  cp -Rvf /home/kali/.* /root
  echo -e "\n  $greenplus cp -Rvf /home/kali/.* /root"

  # start making things sexy!! config files
  echo -e "$xfce_power_config"  > /$runner/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml
  echo -e "\n  $greenplus turned off xfce power management"

  echo -e "$i3config"           > /$runner/.config/i3/config
  echo -e "\n  $greenplus creating /$runner/.config/i3/config"

  echo -e "$rofi_config"        > /$runner/.config/rofi/config
  echo -e "\n  $greenplus creating /$runner/.config/rofi/config"

  echo -e "$i3status_conf"     > /etc/i3status.conf
  echo -e "\n  $greenplus creating /etc/i3status.conf"

  ln -sf /etc/i3status.conf      /$runner/.config/i3/i3status.conf
  echo -e "\n  $greenplus symlink /$runner/.config/i3/i3status.conf"

  echo -e "$terminator_config"  > /$runner/.config/terminator/config
  echo -e "\n  $greenplus creating /$runner/.config/terminator/config"

  echo -e "$i3_alt_tab_py"      > /usr/bin/i3-alt-tab.py
  echo -e "\n  $greenplus creating /usr/bin/i3-alt-tab.py"

  chmod 755 /usr/bin/i3-alt-tab.py
  echo -e "\n  $greenplus chmod 755 /usr/bin/i3-alt-tab.py"

  ln -sf /usr/bin/i3-alt-tab.py /$runner/.config/i3/i3-alt-tab.py
  echo -e "\n  $greenplus symlink /$runner/.config/i3/i3-alt-tab.py"

  #virtualbox shared folder shortcut in home dir
  eval ln -sf /mnt/shared /"$runner"
  echo -e "\n  $greenplus symlink /mnt/shared /$runner"

  # backup .bashrc and generate new .bashrc with path statement
  cp /$runner/.bashrc /$runner/.bashrc-backup-$backupdate
  echo -e "\n  $greenplus backup .bashrc created in /$runner/.bashrc-backup-$backupdate"

  eval echo -e "export PATH=$PATH:/sbin:/usr/sbin" > /tmp/path_export
  cat /tmp/path_export /etc/skel/.bashrc  > ~/.bashrc
  source /$runner/.bashrc
  echo -e "\n  $greenplus new .bashrc created in /$runner/.bashrc"

  # backup .zshrc and generate new custom .zshrc from base64 encoded
  # dosent have that stupid skull on root or that circle-k on kali user
  # export PATH=$PATH:/sbin:/usr/sbin already included in base64 encoded file

  cp /$runner/.zshrc  /$runner/.zshrc-backup-$backupdate
  echo -e "\n  $greenplus backup .bashrc created in /$runner/.zshrc-backup-$backupdate"
  echo -e "$dot_zshrc" > /$runner/.zshrc
  echo -e "\n  $greenplus new .zshrc created in /$runner/.zshrc"

  cp /etc/lightdm/lightdm.conf /etc/lightdm/.lightdm.conf_$backupdate
  echo -e "\n  $greenplus creating backup /etc/lightdm/.lightdm.conf_$backupdate"
  echo -e "$lightdm_conf" > /tmp/tmp_lightdm.conf
  eval cat /tmp/tmp_lightdm.conf | sed 's/#autologin-user=/autologin-user='$runner'/' > /tmp/lightdm.conf
  cp -f /tmp/lightdm.conf /etc/lightdm/lightdm.conf
  echo -e "\n  $greenplus lightdm autologin-user=$runner"
  cat /etc/lightdm/lightdm.conf | sed 's/#autologin-session=/autologin-session=i3/' > /tmp/lightdm.conf
  echo -e "\n  $greenplus lightdm autologin-session=i3"
  cp -f /tmp/lightdm.conf /etc/lightdm/lightdm.conf
  echo -e "\n  $greenplus new lightdm.conf created /etc/lightdm/lightdm.conf"

  # change shell to zsh for root
  echo -e "\n Changing default shell to /bin/zsh enter $runner password:"
  sudo -u $runner chsh --shell /bin/zsh
  echo -e "\n  $greenplus shell changed to zsh for $runner"

  # cleanup (this could be made a function nothing specific here)
  rm -f /tmp/tmp_lightdm.conf /tmp/path_export /tmp/lightdm.conf
  echo -e "\n  $greenplus cleanup rm -f /tmp/tmp_lightdm.conf /tmp/path_export /tmp/lightdm.conf"
  }

i3_adbobe_source_code_pro_font (){    # Might use this function in pimpmykali.sh
  echo -e "\n  $greenplus install source-code-pro fonts"
  rm -rf /opt/source-code-pro
  mkdir -p /usr/share/fonts/opentype/font-adobe-source-code-pro
  git clone https://github.com/adobe-fonts/source-code-pro /opt/source-code-pro
  cp -f /opt/source-code-pro/OTF/*  /usr/share/fonts/opentype/font-adobe-source-code-pro
  fc-cache -fsv
  echo -e "\n  $greenplus fonts cache updated"
  }

i3_shutup_pcbeep () {
  echo -e "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
  echo -e "\n  $greenplus Shut up pcspkr! /etc/modprobe.d/nobeep.conf "
}

pimpmykali_all () {
  echo -e "\n  $greenplus executing pimpmykali.sh --all "
  rm -rf /opt/pimpmykali
  git clone https://github.com/Dewalt-arch/pimpmykali /opt/pimpmykali
  sh -c '/opt/pimpmykali/pimpmykali.sh --all'
  exit_screen
  }

pimpmykali_bpt () {
  echo -e "\n  $greenplus executing pimpmykali.sh --bpt "
  rm -rf /opt/pimpmykali
  git clone https://github.com/Dewalt-arch/pimpmykali /opt/pimpmykali
  sh -c '/opt/pimpmykali/pimpmykali.sh --bpt'
  exit_screen
  }

pimpmykali_all_your_upgrades_belong_to_me () {
  rm -rf /opt/pimpmykali
  git clone https://github.com/Dewalt-arch/pimpmykali /opt/pimpmykali
  echo -e "\n  $greenplus executing pimpmykali.sh --all "
  sh -c '/opt/pimpmykali/pimpmykali.sh --all'
  echo -e "\n  $greenplus executing pimpmykali.sh --bpt "
  sh -c '/opt/pimpmykali/pimpmykali.sh --bpt'
  exit_screen
}

run_far_far_away () {
  clear
  echo -e "\n\n\n  You thought I was kidding?? Last Chance Buddy... I am NOT Sorting this out!"
  read -n1 -p "  Are you really really sure you want to do this? (Y/N): " lookout_thisisgoingtobeugly
  case $lookout_thisisgoingtobeugly in
    y|Y) clear; echo -e "$red$option3$green\n\n  pimpmy-i3.sh -- system halted "; exit_screen ;;
    n|N) echo -e "\n\n  Chicken... No guts no glory!"; exit_screen ;;
      *) run_far_far_away ;;
  esac
  }

run_i3_root () {
  i3_shutup_pcbeep
  i3_adbobe_source_code_pro_font
  i3_fix_root     # all functions for root are in this function
  wget $url -O $root_background
  pimpmykali_all_your_upgrades_belong_to_me
  exit_screen
  }

run_i3_root_only (){
  i3_shutup_pcbeep
  i3_adbobe_source_code_pro_font
  i3_fix_root     # all functions for root are in this function
  wget $url -O $root_background
  exit_screen
}

run_i3_user () {
  i3_shutup_pcbeep
  i3_adbobe_source_code_pro_font
  i3_fix_user     # all functions for user are in this function
  wget $url -O $user_background
  pimpmykali_all_your_upgrades_belong_to_me
  exit_screen
  }

run_i3_user_only () {
  i3_shutup_pcbeep
  i3_adbobe_source_code_pro_font
  i3_fix_user     # all functions for user are in this function
  wget $url -O $user_background
  exit_screen
  }


pimpmyi3_menu () {
  clear
  echo -e "$asciiart"
  echo -e "\n    Select an option from menu:                      Rev:$revision"
  echo -e "\n    1 - pimpmy-i3 for $runner and run as $runner all the time"
  echo -e "        i3-gaps compton feh flameshot numlockx rofi terminator kali-root-login"
  echo -e "        + lightdm autologin-user=$runner lightdm autologin-session=i3"
  echo -e "        + all default base configs included in pimpmy-i3"
  echo -e "        + pimpmykali --all and --bpt (bpt the_essentials)\n"
  #
  echo -e "    2 - pimpmy-i3 for $finduser (NOT FOR ROOT) and run as $finduser all the time"
  echo -e "        i3-gaps compton feh flameshot numlockx rofi terminator"
  echo -e "        + lightdm autologin-user=$finduser lightdm autologin-session=i3"
  echo -e "        + all default base configs included in pimpmy-i3"
  echo -e "        + pimpmykali --all and --bpt (bpt the_essentials)"
  echo -e "        DO NOT USE FOR ROOT! if this says root your already root!!\n"
  # menu option 3 is hearby dedicated to : BlindPenTester and shall remain for all time
  echo -e "    3 - Im nuts! Give me both 1 + 2 and side order of fries! *voids warranty*"
  echo -e "        Whatever you get you get Dewalt is NOT sorting it out!"
  echo -e "        - BlindPentester will provide 100% free in person technical support!"
  echo -e "        - everything listed above - Have fun! (you have been warned) \n"
  echo -e "    4 - pimpmy-i3 for user $runner   without pimpmykali.sh --all or --bpt"
  echo -e "        only runs pimpmy-i3.sh for user $runner with no additional upgrades\n"
  echo -e "    5 - pimpmy-i3 for user $finduser without pimpmyakli.sh --all or --bpt"
  echo -e "        only runs pimpmy-i3.sh for user $finduser with no additional upgrades"
  echo -e "        (if #5 says root.. you are already root - do not run for root user!)\n"
  echo -e "    -- Upgrade Only Options -- \n"
  echo -e "    P - Only pimpmykali --all"
  echo -e "    B - Only BlindPenTester the_essentials (pimpmykali --bpt)"
  echo -e "    A - All your upgrades belong to me! both pimpmykali --all and --bpt\n\n"
  read -n1 -p "    Enter option or press X to exit: " menuinput

  case $menuinput in
    1) run_i3_root ;;
    2) run_i3_user ;;
    3) run_far_far_away ;;
    4) run_i3_root_only ;;
    5) run_i3_user_only ;;
  p|P) pimpmykali_all ;;
  b|B) pimpmykali_bpt ;;
  a|A) pimpmykali_all_your_upgrades_belong_to_me ;; # What you thought I was kidding?
  x|X) echo -e "\n\n Exiting pimpmy-i3.sh - Happy Hacking! \n"; exit;;
    *) pimpmyi3_menu ;;
  esac
  }

check_arg () {
    if [ "$1" == "" ]
      then pimpmyi3_menu
     else
      case $1 in
      --root) run_i3_root      ;; # run_i3_root
      --user) run_i3_user      ;; # run_i3_user
      --both) run_far_far_away ;; # run_far_far_away
    --pmkall) pimpmykali_all   ;; # pimpmykali_all
    --pmkbpt) pimpmykali_bpt   ;; # pimpmykali_bpt
      --help) echo -e "\n\n Not providing any help"; exit ;;
           *) exit 0  ;;
         esac
       fi
    }

exit_screen () {
    #echo -e "$asciiart"
    #echo -e "\n\n    All Done! Happy Hacking! \n"
    exit
    }

# -- MAIN --
check_for_root
check_distro
check_arg "$1"
exit_screen
