win10.xml:


    - Use cores 1,2,3 with hyperthreading
    # - Use cores 1,2,3 without hyperthreading. Leaving HT thread to emulator
    - use core 7 to emulator
    - pass vga r9 290
    - pass ssd: nvme 950 pro
    - pass sata controller
    - pass pcie ethernet card
    - pass usb controller
    - use 3 screens, 1 binded to linux all time, synergy between both OS
        - can switch from 1 linux / 2 windows to 2 linux / 1 windows at runtime using xrandr

scripts:

    - management of cgroups

systemd:

    - managing suspend / resume with guest never shut down
        -> Broken in last version, powering off

hooks:

    - some hooks at start / stop of vm
