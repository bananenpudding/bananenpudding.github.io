-------------------CONFIGURATION-------------------

-- Host

-- Modem channel - must be between 0 and 65535

local channel = 0


-- Modem side

local modemSide = "bottom"


-- Give the switches the name of your choice,
-- or set to "" to disable

local switch1Name = "sw1"
local switch2Name = "sw2"
local switch3Name = "sw3"
local switch4Name = "sw4"
local switch5Name = "sw5"


-- Switch sides

local switch1Side = "left"
local switch2Side = "right"
local switch3Side = "front"
local switch4Side = "back"
local switch5Side = "top"


-- Default switch states

local switch1On = false
local switch2On = false
local switch3On = false
local switch4On = false
local switch5On = false

----------------END OF CONFIGURATION---------------

function setTextColorIfSupported(color)
  if term.isColor() then
    term.setTextColor(color)
  end
end

local on = false
local err = false

modem = peripheral.wrap(modemSide)
modem.open(channel)
while true do
  redstone.setOutput(switch1Side, switch1On)
  redstone.setOutput(switch2Side, switch2On)
  redstone.setOutput(switch3Side, switch3On)
  redstone.setOutput(switch4Side, switch4On)
  redstone.setOutput(switch5Side, switch5On)
  event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
  if message == "" then
    errNoInput = true
  elseif message == switch1Name then
    switch1On = not switch1On
    on = switch1On
  elseif message == switch2Name then
    switch2On = not switch2On
    on = switch2On
  elseif message == switch3Name then
    switch3On = not switch3On
    on = switch3On
  elseif message == switch4Name then
    switch4On = not switch4On
    on = switch4On
  elseif message == switch5Name then
    switch5On = not switch5On
    on = switch5On
  else
    errNotExist = true
  end
  if errNotExist then
    modem.transmit(replyChannel, channel, "Switch '" .. message .. "' does not exist. To exit, type exit.")
    setTextColorIfSupported(colors.orange)
    print("[ch " .. replyChannel .. ", " .. senderDistance .. " bl] Switch '" .. message .. "' was entered but does not exist.")
    setTextColorIfSupported(colors.white)
    errNotExist = false
  elseif errNoInput then
    modem.transmit(replyChannel, channel, "Enter a switch name to switch or type exit to exit.")
    setTextColorIfSupported(colors.orange)
    print("[ch " .. replyChannel .. ", " .. senderDistance .. " bl] There was no switch entered.")
    setTextColorIfSupported(colors.white)
    errNoInput = false
  else
    if on then
      modem.transmit(replyChannel, channel, "Switch '" .. message .. "' is switched ON.")
      setTextColorIfSupported(colors.green)
      print("[ch " .. replyChannel .. ", " .. senderDistance .. " bl] Switch '" .. message .. "' is switched ON.")
      setTextColorIfSupported(colors.white)
    else
      modem.transmit(replyChannel, channel, "Switch '" .. message .. "' is switched OFF.")
      setTextColorIfSupported(colors.red)
      print("[ch " .. replyChannel .. ", " .. senderDistance .. " bl] Switch '" .. message .. "' is switched OFF.")
      setTextColorIfSupported(colors.white)
    end
  end
end
