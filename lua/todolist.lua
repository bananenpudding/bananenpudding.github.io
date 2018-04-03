local monitor = peripheral.wrap("left")
tdfile = fs.open("todo.txt", "r")
monitor.setTextScale(2)
monitor.write("Gerrits Te doen lijst:")
repeat
  lines[i] = tdfile.readLine()
  monitor.setCursorPos(4,3 + i)
  monitor.setTextScale(2)
	monitor.write(lines[i])
  i = i + 1
until lines[i] == "" or lines[i] == nil
tdfile.close()
