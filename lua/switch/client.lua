-------------------CONFIGURATION-------------------

-- Client

-- Client and host channels, set to -1 for manual
-- input, otherwise it must be between 0 and 65535

local clientChannel = -1
local hostChannel = -1


-- set to "" for manual input

local modemSide = ""



----------------END OF CONFIGURATION---------------

function setTextColorIfSupported(color)
  if term.isColor() then
    term.setTextColor(color)
  end
end

if clientChannel < 0 then
  write("Client channel (0-65535): ")
  clientChannel = tonumber(read())
end
if hostChannel < 0 then
  write("Host channel (0-65535): ")
  hostChannel = tonumber(read())
end
if modemSide == "" then
  print("Modem location")
  write("(left|right|top|bottom|front|back): ")
  modemSide = read()
end
modem = peripheral.wrap(modemSide)
modem.open(clientChannel)
print("Enter a switch name to switch or type exit to exit.")
while true do
  write("Switch name: ")
  local input = read()
  if input == "exit" then
    term.clear()
    print("Bye")
    return
  elseif input == "" then
    setTextColorIfSupported(colors.red)
    print("Enter a switch name to switch or type exit to exit.")
    setTextColorIfSupported(colors.white)
  else
    modem.transmit(hostChannel, clientChannel, input)
    event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
    setTextColorIfSupported(colors.lightBlue)
    print(message)
    setTextColorIfSupported(colors.white)
  end
end
