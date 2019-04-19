# Hardware_HeadControlled_PanTilt_Camera
Super simple project I made while working at MUSE Headband to learn OSC

<p align="center" style="vertical-align: top; position: relative" >
  <img align="top" style="vertical-align:top;position: relative" src="https://raw.githubusercontent.com/aziddy/Hardware_HeadControlled_PanTilt_Camera/master/media/left-right.gif" width="400"/>
   
   <img align="top" style="vertical-align:top;position: relative" src="https://raw.githubusercontent.com/aziddy/Hardware_HeadControlled_PanTilt_Camera/master/media/updown.gif" width="400"/>
    
</p>

## Part List

| Name | 
| ------------- |
| MUSE Headband |
| Logitech c170 |
| ~~~~ |


## Wiring



## Communication Pipeline

MUSE Headband -> Bluetooth Dongle -> Windows PC -> MuseLab (makes local OSC server on the pc) -> OSC server -> Processing (Using OSC lib) -> Serial -> Arduino
