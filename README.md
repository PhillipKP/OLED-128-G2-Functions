# OLED-128-G2-Functions

In my spectral unmixing project I used two seperate displays to create a spectral mixed object spectral datacube. One of the displays was a OLED from 4D Systems called the uOLED-128-G2. It has 128 by 128 resolution.

This code can be used to display images as well as control the "brightness" from the OLED display.



MATLAB Code to communicate and control a uOLED 128 G2 Display:

oled_script.m: The main MATLAB script for connecting with the OLED and sending images to it.

oled_open.m: MATLAB function for communicated opening a connection to the OLED and returns the handle for the OLED connection

fullscreen_oled.m: MATLAB function for sending pictures to the OLED.

