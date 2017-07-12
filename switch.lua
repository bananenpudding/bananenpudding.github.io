modem = peripheral.wrap("top")
while true do
  local input = read()
  modem.open(301)
  modem.transmit(300, 301, input)
  event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
  print(message)
end
