pimpmyi3.sh 

  This script is for a 1 shot 1 and done run to setup i3 window manager
  (i3-gaps actually) And all related base components to a fully functional 
  and pre-configured working system from 1 script. 

  This was built as nothing more than an ease of convenience. 

  Several have requested this script and that it be made publicly available on github. So here it is! Have fun! 

  - BlindPenTester (BPT)
    -  The final results of pimpmy-i3.sh were recently featured on the BlindPentesters Twitch Stream (Sar2HTML Vulnhub box).
  https://www.twitch.tv/blindpentester BPT is also the creator of 'the_essentials.sh' script which will be called at the 
  end of pimpmy-i3.sh via pimpmykali.sh --bpt command line option. A huge shoutout to BlindPenTester!
  
  It is suggested this be used only on a fresh imported kali vm 
  although should work on already existing installs, warning your mileage 
  may vary on pre-installed systems.
    
What pimpmy-i3.sh is going to do: 
  
- PC Speaker Beep turned off ( i3_shutup_pcbeep function )
  - function adds blacklist pcspkr to /etc/modprobe.d/nobeep.conf 

- Sets User and Root i3 background 
  - uses $url variable in script to download background from Internet
    - a few additional backgrounds have been included in the script 
    - uncomment ONE url=  statments at the top of the script 
    - or change it to to the url of an image of your choice! 
  
- Pre-configured ~/.config/i3/config 
  - set $modkey Mod1    (alt key)
  - modkey can be changed after installation 
    - default: set $modkey Mod1 (alt key)
    - to set windows key change to : set $modkey Mod4     
  - I prefer the alt key if you want the windows key, change it 
  
- Pre-configured /etc/i3status.conf 
  - symlinked from /etc/i3status.conf to ~/.config/i3/i3status.conf 
  - wifi has been commented out 
  - tun0 listed as VPN: in the status bar 
    - when connected to a vpn, the VPN: Down will change to tun0 ip 
  - eth0 listed as E: in the status bar 

- Pre-configured ~/.config/rofi/config 
  - theme can be changed via rofi-theme-selector 

- Pre-configured /usr/bin/i3-alt-tab.py 
  - required for modkey+tab and modkey+shfit+tab in i3 
    - modkey(alt)+tab tabs between open windows on 1 virtual desktop 
    - modkey(win)+shift+tab tabs between all open windows on all open virutal desktops
  - symlink from /usr/bin/i3-alt-tab.py to ~/.config/i3/i3-alt-tab.py 

- Pre-configured ~/.config/terminator/config 
  - Dont like my font choice? Pick a new one! 
  - Want a different color scheme? Pick a new one! 
  - Remember I wrote this for my choices not yours. 

- Modification /etc/lightdm/lightdm.conf 
  - autologin-user=     set for auto login by that user or root 
  - autologin-session=  set to i3 

- Pre-configured :
  - ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml
  - turn off that silly xfce power management 

- Modification ~/.bashrc 
  - backup existing .bashrc to ~/.bashrc-backup-$backupdate 
  - generate a new .bashrc from /etc/skel/.bashrc 
  - added /sbin and /usr/sbin to path 

- Pre-configured ~/.zshrc 
  - backup existing .zshrc to ~/.zshrc-backup-$backupdate 
  - extract new ~/.zshrc from base64 encode 
    - remove that silly skull and circle-K in the PS1 prompt
    - has /sbin and /usr/sbin in the path 

- Change Default Shell 
  - chsh --shell /bin/zsh 

- Root 
  - attempt to make dirs if they dont already exist 
  - copies  * from /home/$finduser to /root 
  - copies .* from /home/$finduser to /root 
  - sets symlink from /mnt/shared to ~/shared for virtualbox shared folder

- Apt 
  - i3-gaps compton feh flameshot numlockx rofi terminator kali-root-login 

- i3_adbobe_source_code_pro_font function 
  - Adobe Source-Code-Pro font 
    - installs adobe source-code-pro font in /opt/source-code-pro 
    - copies .otf fonts to /usr/share/fonts 
    - updates font cache:  fc-cache -fsv 

- get_uber_pimped function     
  - Pimpmykali.sh 
    - git clone https://github.com/Dewalt-arch/pimpmykali
    - executes pimpmykali.sh at end of pimpmy-i3 with --all switch 
  - The_Essentials.sh - BlindPenTester 
    - git clone https://github.com/blindpentester/the-essentials
    - executed from pimpmykali.sh --bpt  switch 
