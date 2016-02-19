99-hdmi_sound.rules:

    - udev rule
    - We try to detect any modification on the card0 of the computer

hdmi_sound_toogle.service:

    - Unit file used by the udev rule to toggle hdmi
    - also run at boot

hdmi_toggle_acer.sh:

    - completely dependant of my laptop
    - if a screen is connected to the HDMI port
      we can believe it is a tv to play a movie or stuff
      like this.
      => hdmi set to default, all current program are
         switch to this one.
      => else, we go back to speakers