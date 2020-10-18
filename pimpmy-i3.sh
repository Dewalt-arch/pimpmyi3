#!/bin/bash
#
# pimpmy-i3.sh
# Author : Dewalt
# git clone https://github.com/Dewalt-arch/pimpmyi3
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
revision="1.0.1"

# -- wget loud or quiet
quiet=""
# quiet="-q"
# ---

# Configuration files moved to online storage
  # ~/.bashrc
  raw_basrc="https://raw.githubusercontent.com/Dewalt-arch/pimpmyi3-config/main/bash/bashrc"
  # ~/.config/i3/
  raw_i3config="https://raw.githubusercontent.com/Dewalt-arch/pimpmyi3-config/main/i3/config"
  raw_i3alttab="https://raw.githubusercontent.com/Dewalt-arch/pimpmyi3-config/main/i3/i3-alt-tab.py"
  raw_i3status="https://raw.githubusercontent.com/Dewalt-arch/pimpmyi3-config/main/i3/i3status.conf"
  # /etc/lightdm/lightdm.conf
  raw_lightdm="https://raw.githubusercontent.com/Dewalt-arch/pimpmyi3-config/main/lightdm/lightdm.conf"
  # ~/.config/rofi/config
  raw_rofi="https://raw.githubusercontent.com/Dewalt-arch/pimpmyi3-config/main/rofi/config"
  # ~/.config/terminator/config
  raw_terminator="https://raw.githubusercontent.com/Dewalt-arch/pimpmyi3-config/main/terminator/config"
  # ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml
  raw_xfce="https://raw.githubusercontent.com/Dewalt-arch/pimpmyi3-config/main/xfce4/xfce4-power-manager.xml"
  # ~/.zshrc
  raw_zshrc="https://raw.githubusercontent.com/Dewalt-arch/pimpmyi3-config/main/zsh/zshrc"
  # bpt bash_profile
  raw_bpt_bash_profile="https://raw.githubusercontent.com/blindpentester/bash_profile/main/bash_profile"

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

# pimpmy-i3 asciiart
asciiart=$(base64 -d <<< "H4sIAAAAAAAAA41QMQoDMQzb8wqNnc4fOG4o94CuhYApNFuhUA
6OQh5f2Ymb61YngyVLCk7CqEkV/xWVUUAypoOqWlsfDAaka/pGUJm7IrcIh8iVM8EgOG5wNpffeM
yAnkwztwhjdMHi3ZWH5mAa9MQK8QTBeIyziGC+2CJ2CeXAODRrPS4isaukzoyxBbsXl+deXuVOmA
Xn98+HrmW/PTaTIn0AuTB/NpMBAAA=" | gunzip)

option3=$(base64 -d <<< "H4sIAAAAAAAAA5VSTWvDMAy951eoN+mwmPUPjMFg7LLBbgODSLf
ShoW4rCmjoB8/+St1mlCY4yR2/J6enhSApcFXo1pEGEDwE4DibRegBhPKYziAKRHsFRYxvvxZDkv
5g85qCjb+hNNhADHp0qvRDJ+yQKZRKDFrRNZ3rZsyecw5R4ejheS1jkqlSCoG5sgY/GLIqs4c//n
CwQk62aAgozum7LzQSRSb9NWR34awOTcKMbDklJkpIxJ4rDGOtb7WufQuSlES4CjFOPWT7YwFhlH
FUzho+0Bl3Vg7oCf+gUFSooheTMT+1ieXFMVS3lgr0nWddCLGmEsHrRLnP27IyqAZPZOdtrHEQc5
HYjo3oAYFfFBKmdMcmH9v1MEo3hzlZs+Cpr9OxKIoVozIIhLzQlF+kkhC3rAFxojReinaWrDLgY3
68fVUqPFBFQkBbCH04u6/Qzkf7gQ/26brzjDs3Wm3H+AFfpsj7Fzb72Bw0G0HOCuq7Y+D4pTjDkP
reriHx9cnWMPGDfvVwwoqPXp2sGk+v6Hpv+DQ6mLEvr3n9bqua6j+AFXx/5noBAAA" | gunzip )

# ~/.config/i3/config  modkey is ALT change to Mod4 for Windows Key
# set $modkey Mod1    is for the ALT key
# set $modkey Mod4    is for the Widnows Key

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
  apt -y --fix-broken install $silent
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
  # This symlink is more for me than anyone else, I may just remove it
  # eval ln -sf /mnt/shared /home/"$finduser"
  # echo -e "\n  $greenplus symlink /mnt/shared /home/$finduser"

  # start making things sexy!! configs
  # Turn that damn xfce powermanagement OFF!!
  eval wget $quiet $raw_xfce -O /home/$finduser/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml
  echo -e "\n  $greenplus turned off xfce power management"

  # BPT bash_profile saved to .zsh_profile
  eval wget $quiet $raw_bpt_bash_profile -O /home/$finduser/.zsh_profile

  # ~/.config/i3/config and ~/.config/rofi/config
  eval wget $quiet $raw_i3config -O /home/$finduser/.config/i3/config
  echo -e "\n  $greenplus creating /home/$finduser/.config/i3/config"

  # ~/.config/rofi/config
  eval wget $quiet $raw_rofi -O /home/$finduser/.config/rofi/config
  echo -e "\n  $greenplus creating /home/$finduser/.config/rofi/config"

  # /etc/i3status.conf
  eval wget $quiet $raw_i3status -O /etc/i3status.conf
  echo -e "\n  $greenplus creating /etc/i3status.conf"

  # symlink /etc/i3status.conf ~/.config/i3/i3status
  ln -sf /etc/i3status.conf /home/$finduser/.config/i3/i3status.conf
  echo -e "\n  $greenplus symlink /home/$finduser/.config/i3/i3status.conf"

  # ~/.config/terminator/config
  eval wget $quiet $raw_terminator -O /home/$finduser/.config/terminator/config
  echo -e "\n  $greenplus creating /home/$finduser/.config/terminator/config"

  # ~/.config/i3/i3-alt-tab.py
  # needed for i3's alt+tab and metakey+tab
  eval wget $quiet $raw_i3alttab -O /usr/bin/i3-alt-tab.py
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
  eval wget $quiet $raw_lightdm -O /tmp/tmp_lightdm.conf
  eval cat /tmp/tmp_lightdm.conf | sed 's/#autologin-user=/autologin-user='$finduser'/' > /tmp/lightdm.conf
  cp -f /tmp/lightdm.conf /etc/lightdm/lightdm.conf
  echo -e "\n  $greenplus lightdm autologin-user=$finduser"
  eval cat /etc/lightdm/lightdm.conf | sed 's/#autologin-session=/autologin-session=i3/' > /tmp/lightdm.conf
  echo -e "\n  $greenplus lightdm autologin-session=i3"
  cp -f /tmp/lightdm.conf /etc/lightdm/lightdm.conf
  echo -e "\n  $greenplus new lightdm.conf created /etc/lightdm/lightdm.conf"

  # backup existing .bashrc and generate new .bashrc with path statement
  # -- .bashrc backed up so no one looses their alias's and function's
  #
  # no wget $quiet $raw_bashrc -O /home/$finduser/.bashrc needed here
  #
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
  eval wget $quiet $raw_zshrc -O /home/$finduser/.zshrc
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
  apt -y --fix-broken install $silent
  echo -e "\n  $greenplus apt updated"
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

  # copy /home/kali/* and /home/kali/.* to /root/
  cp -Rvf /home/kali/*  /root
  echo -e "\n  $greenplus cp -Rvf /home/kali/*  /root"
  cp -Rvf /home/kali/.* /root
  echo -e "\n  $greenplus cp -Rvf /home/kali/.* /root"

  # BPT bash_profile saved to .zsh_profile
  eval wget $quiet $raw_bpt_bash_profile -O /$runner/.zsh_profile

  # start making things sexy!! config files
  eval wget $quiet $raw_xfce -O  /$runner/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml
  echo -e "\n  $greenplus turned off xfce power management"

  eval wget $quiet $raw_i3config -O /$runner/.config/i3/config
  echo -e "\n  $greenplus creating /$runner/.config/i3/config"

  eval wget $quiet $raw_rofi -O /$runner/.config/rofi/config
  echo -e "\n  $greenplus creating /$runner/.config/rofi/config"

  eval wget $quiet $raw_i3status -O /etc/i3status.conf
  echo -e "\n  $greenplus creating /etc/i3status.conf"

  ln -sf /etc/i3status.conf      /$runner/.config/i3/i3status.conf
  echo -e "\n  $greenplus symlink /$runner/.config/i3/i3status.conf"

  eval wget $quiet $raw_terminator -O /$runner/.config/terminator/config
  echo -e "\n  $greenplus creating /$runner/.config/terminator/config"

  eval wget $quiet $raw_i3alttab -O /usr/bin/i3-alt-tab.py
  echo -e "\n  $greenplus creating /usr/bin/i3-alt-tab.py"
  chmod 755 /usr/bin/i3-alt-tab.py
  echo -e "\n  $greenplus chmod 755 /usr/bin/i3-alt-tab.py"
  ln -sf /usr/bin/i3-alt-tab.py /$runner/.config/i3/i3-alt-tab.py
  echo -e "\n  $greenplus symlink /$runner/.config/i3/i3-alt-tab.py"

  #virtualbox shared folder shortcut in home dir
  # eval ln -sf /mnt/shared /"$runner"
  # echo -e "\n  $greenplus symlink /mnt/shared /$runner"

  # backup .bashrc and generate new .bashrc with path statement
  #
  # no eval wget $quiet $raw_bashrc -O /$runner/.bashrc  needed here
  #
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
  eval wget $quiet $raw_zshrc -O /$runner/.zshrc
  echo -e "\n  $greenplus new .zshrc created in /$runner/.zshrc"

  cp /etc/lightdm/lightdm.conf /etc/lightdm/.lightdm.conf_$backupdate
  echo -e "\n  $greenplus creating backup /etc/lightdm/.lightdm.conf_$backupdate"

  eval wget $quiet $raw_lightdm -O /tmp/tmp_lightdm.conf
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
  # Could change this to a driect WGET of the OTF Font and drop them in the right place..
  # save all this mucking about
  git clone https://github.com/adobe-fonts/source-code-pro /opt/source-code-pro
  cp -f /opt/source-code-pro/OTF/*  /usr/share/fonts/opentype/font-adobe-source-code-pro
  fc-cache -fsv
  echo -e "\n  $greenplus fonts cache updated"
  }

i3_shutup_pcbeep () {
  echo -e "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
  echo -e "\n  $greenplus Shut up pcspkr! /etc/modprobe.d/nobeep.conf "
  # apt bad hash fix
  mkdir -p /etc/gcrypt
  echo -e "all" > /etc/gcrypt/hwf.deny
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
  eval wget $quiet $url -O $root_background
  pimpmykali_all_your_upgrades_belong_to_me
  exit_screen
  }

run_i3_root_only (){
  i3_shutup_pcbeep
  i3_adbobe_source_code_pro_font
  i3_fix_root     # all functions for root are in this function
  eval wget $quiet $url -O $root_background
  exit_screen
}

run_i3_user () {
  i3_shutup_pcbeep
  i3_adbobe_source_code_pro_font
  i3_fix_user     # all functions for user are in this function
  eval wget $quiet $url -O $user_background
  pimpmykali_all_your_upgrades_belong_to_me
  exit_screen
  }

run_i3_user_only () {
  i3_shutup_pcbeep
  i3_adbobe_source_code_pro_font
  i3_fix_user     # all functions for user are in this function
  eval wget $quiet $url -O $user_background
  exit_screen
  }


pimpmyi3_menu () {
  clear
  echo -e "$asciiart"
  echo -e "\n    Select an option from menu:                      Rev:$revision"
  echo -e "\n    1 - pimpmy-i3 for user $runner and run as $runner all the time"
  echo -e "        i3-gaps compton feh flameshot numlockx rofi terminator kali-root-login"
  echo -e "        + lightdm autologin-user=$runner lightdm autologin-session=i3"
  echo -e "        + all default base configs included in pimpmy-i3"
  echo -e "        + pimpmykali --all and --bpt (bpt the_essentials)\n"
  #
  echo -e "    2 - pimpmy-i3 for user $finduser (NOT FOR ROOT) and run as $finduser all the time"
  echo -e "        i3-gaps compton feh flameshot numlockx rofi terminator"
  echo -e "        + lightdm autologin-user=$finduser lightdm autologin-session=i3"
  echo -e "        + all default base configs included in pimpmy-i3"
  echo -e "        + pimpmykali --all and --bpt (bpt the_essentials)"
  echo -e "        #2 DO NOT USE FOR ROOT! if this says root your already root use #1!!\n"
  # menu option 3 is hearby dedicated to : BlindPenTester and shall remain for all time
  echo -e "    3 - Im nuts! Give me both 1 + 2 and side order of fries! *voids warranty*"
  echo -e "        - Whatever you get you get Dewalt is NOT sorting it out!"
  echo -e "        - BlindPentester will provide 100% free in person technical support!"
  echo -e "        - everything listed above - Have fun! (you have been warned) \n"
  echo -e "    4 - pimpmy-i3 for user $runner without pimpmykali.sh --all or --bpt"
  echo -e "        only runs pimpmy-i3.sh for user $runner with no additional upgrades\n"
  echo -e "    5 - pimpmy-i3 for user $finduser without pimpmyakli.sh --all or --bpt"
  echo -e "        only runs pimpmy-i3.sh for user $finduser with no additional upgrades"
  echo -e "        #5 DO NOT USE FOR ROOT! if this says root your already root use #4!!\n"
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
