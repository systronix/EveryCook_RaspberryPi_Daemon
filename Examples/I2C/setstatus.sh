#!/bin/bash

i2cset -y 1 0x40 0x00 0x00  #reset
# we are connected on /dev/i2c-1 (-y 1) and use the i2c address 0x40

i2cset -y 1 0x40 0x00 0x11  #disable oscillator on address 0x00 setting it to 0x11
i2cset -y 1 0x40 0xFE 0x79  #setdivider to 50 Hz
i2cset -y 1 0x40 0x00 0x01  #enable oscillator

#set all channels 
#on
i2cset -y 1 0x40 0xfa 0x00
i2cset -y 1 0x40 0xfb 0x00
#off
#low high
#off FF 00 =50%
echo "right limit"
#off FF 09 left limit 
i2cset -y 1 0x40 0xfc 0x02
i2cset -y 1 0x40 0xfd 0x01

sleep 1

echo "left limit"
#off 05 00 right limit 
i2cset -y 1 0x40 0xfc 0xFF
i2cset -y 1 0x40 0xfd 0x01

sleep 1

echo "middle"
#off FF 00 mid 
#i2cset -y 1 0x40 0xfc 0xFF
#i2cset -y 1 0x40 0xfd 0x00


sleep 1
echo "off"
#off 00 00 off 
i2cset -y 1 0x40 0xfc 0x00
i2cset -y 1 0x40 0xfd 0x00

