bindallusb:

    - simple script looking lsusb and call a sub-script (vmusb)
    - bindallusb win10 attach ==> attach devices to dom win10 while it is off
    - bindallusb win10 attach instant ==> attach devices to dom win10 while it is on

vmusb:

    - search if the device is in conf (example below)
    - if it is a steam controller, kill steam (steam retry to take sub-devices)
    - bind to vm depending of call of bindallusb

    EXAMPLE OF CONF FILE:

    name idVendor idProduct
    mouse-dongle 046d c531
    mouse-cord 046d c07c
    kbd-microsoft 045e 0768
    steam-controller 28de 1142

shieldbuild:

    - create a cgroup shield, and put all actual programs to be used by cores 0,4
    - leave 1-3,5-7 to qemu

shieldbreak:

    - linux get back all cores