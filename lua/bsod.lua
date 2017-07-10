--"Blue Screen Of Death" code for the ComputerCraft mod--
--You may use this code freely--

--Best results are achieved by using a 8x5 Advanced Monitor setup--
--If nothing shows up on the monitors, adjust the first line of code according to to your setup and reboot the computer-- 

 
--Initializing--
m = peripheral.wrap("right")
m.setBackgroundColor(2048)
m.clear()
m.setTextColor(1)
m.setCursorPos(1,1)

--Writing Contents--
m.write("A problem has been detected and CraftOS has been")
m.setCursorPos(1, 2)
m.write("shut down to prevent damage to your computer.")
m.setCursorPos(1, 4)

m.write("PFN_LIST_CORRUPT")
m.setCursorPos(1, 6)

m.write("If this is the first time you've seen this Stop")
m.setCursorPos(1, 7)
m.write("error screen, restart your computer. If this")
m.setCursorPos(1, 8)
m.write("screen appears again, follow these steps:")
m.setCursorPos(1, 10)

m.write("Check to make sure any new hardware or software")
m.setCursorPos(1, 11)
m.write("is properly installed. If this is a new installation,")
m.setCursorPos(1, 12)
m.write("ask your hardware or software manufacturer for")
m.setCursorPos(1, 14)
m.write("any CraftOS updates you might need.")

m.write("If problems continue, disable or remove any newly")
m.setCursorPos(1, 15)
m.write("installed hardware or software. Disable BIOS memory")
m.setCursorPos(1, 16)
m.write("options such as caching or shadowing. If you need ")
m.setCursorPos(1, 17)
m.write("to use Safe Mode to remove or disable components, restart")
m.setCursorPos(1, 18)
m.write("your computer, press F8 to select Advanced Startup")
m.setCursorPos(1, 20)
m.write("Options, and then select Safe Mode.")

m.write("Technical information:")
m.setCursorPos(1, 21)
m.write("*** STOP: 0x0f00004e (0x000a0099, 0x0c18d373, 0x060e07b0, 0x00c40g08)")
m.setCursorPos(1, 24)


m.write("Beginning dump of physical memory...")
m.setCursorPos(1, 25)
m.write("Physical memory dump complete.")
m.setCursorPos(1, 26)
m.write("Contact your system administrator or technical support group for further")
m.setCursorPos(1, 27)
m.write("assistance.")
