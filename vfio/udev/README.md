80-usb-libvirt.rules:

    - udev rule to detect new usb devices

vmusbautoadd:

    - Create a xml file for [attach/detach]-device
    - some logs on /tmp/plugenv
    - if vm is started
      - if steam controller
        - kill steam (or you passed through device will stay on linux, or crash)
      - Attach to vm