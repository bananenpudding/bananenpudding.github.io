local monitor = peripheral.wrap("left")
tdfile = fs.open("todo.txt", "r")
monitor.setTextScale(2)
monitor.write("Gerrits Te doen lijst:")
local line = ""
local i = 0
repeat
  line = tdfile.readLine()
  if line == "" or line == nil then break end
  monitor.setCursorPos(2,3 + i)
  monitor.setTextScale(2)
  monitor.write(i + 1 .. ". " .. line)
  i = i + 1
until line == "" or line == nil
tdfile.close()
