qemu:

    - to be placed on: /etc/libvirt/hooks/qemu
    - first argument is vm name, second and thirds are steps of boot / unboot

hookvmprepare:

    - place for cgroup shielding, passing devices to vfio-pci..

hookvmstart:

    - place for screen management

hookvmstarted:

    - quite useless one, but, in case of...

hookvmstopped:

    - detaching usb / screen management

hookvmrelease:

    - unallocating resources, breaking shield, back to raw linux
