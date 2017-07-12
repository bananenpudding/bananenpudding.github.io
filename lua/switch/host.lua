local leftName = "me"
local rightName = "base"
local topName = "kelder"
local bottomName = "mars"

local on = false
local err = false

local leftOn = true
local rightOn = true
local topOn = true
local bottomOn = true

modem = peripheral.wrap("back")
modem.open(300)
while true do
  redstone.setOutput("left", leftOn)
  redstone.setOutput("right", rightOn)
  redstone.setOutput("top", topOn)
  redstone.setOutput("bottom", bottomOn)
  event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
  if message == leftName then
    leftOn = not leftOn
    on = leftOn
  elseif message == rightName then
    rightOn = not rightOn
    on = rightOn
  elseif message == topName then
    topOn = not topOn
    on = topOn
  elseif message == bottomName then
    bottomOn = not bottomOn
    on = bottomOn
  else
    err = true
  end
  if err then
    modem.transmit(301, 300, "Switch '" .. message .. "' was entered but does not exist")
    term.setTextColor(colors.red)
    print("[" .. senderDistance .. " bl] Switch '" .. message .. "' was entered but does not exist")
    term.setTextColor(colors.white)
    err = false
  else
    if on then
      modem.transmit(301, 300, "Switch '" .. message .. "' is switched ON.")
      term.setTextColor(colors.green)
      print("[" .. senderDistance .. " bl] Switch '" .. message .. "' is switched ON.")
      term.setTextColor(colors.white)
    else
      modem.transmit(301, 300, "Switch '" .. message .. "' is switched OFF.")
      term.setTextColor(colors.red)
      print("[" .. senderDistance .. " bl] Switch '" .. message .. "' is switched OFF.")
      term.setTextColor(colors.white)
    end
  end
end
