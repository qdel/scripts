win10.xml:

    # - Use cores 1,2,3 without hyperthreading. Leaving HT thread to emulator
    - use cores 1,2,3,5,6 let 7 to emulator
    - pass vga r9 290
    - pass ssd: nvme 950 pro
    - pass sata controller
    - pass pcie ethernet card
    - pass usb3 controller
    - use 3 screens, 1 binded to linux only, 2 other switching dynamically, synergy between both OS
    - can redirect usb devices using scripts

scripts:

    - management of cgroups
    - binding usb devices

systemd:

    - managing suspend / resume with guest never shut down

udev:

    - managing new usb devices connected to the host (i want them to be passed to guest)

hooks:

    - some hooks at start / stop of vm
