*.service:

    - systemd unit files used to correct optimus behavior on some laptops
      (in my case a acer aspire V7-582PG)

wakeup-acer.sh:

    - put the graphic card to ON at sleep

sleep-acer.sh:

    - put the graphic card to OFF after wakeup


SPECIAL NOTE:

    - some laptop have problems with optimus cards, in my case,
      the bbswitch suspend hook is too fast for the firmware of
      the laptop (at least, it is what i guess).
      The bbswich hook freezes the laptop, or let the card at
      D3cold state after wakeup (and it cannot be started back)
      For these hook to work, the callback NEED to be TOTALLY
      disabled in bbswitch.c (a good return on first line is enough).
      I won't post this dirty hack here, if your laptop is broken, or
      become a giant robot murduring kittens, it is your fault, not mine.
