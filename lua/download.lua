local args = { ... }

if #args < 2 then
  print("Usage: dl <url> <filename>")
  return
end

if not http then
  printError("The http API is disabled. Set enableAPI_http")
  printError("to true in ComputerCraft.cfg to enable it.")
  return
end

local function get(url)
  write ("Connecting to " .. url .. "...")
  local response = http.get(url)
  if response then
    print("Success.")
    local contents = response.readAll()
    response.close()
    return contents
  else
    printError("Failed")
  end
end

local url = args[1]
local filename = args[2]
local path = shell.resolve(filename)
if fs.exists(path) then
  print("File already exists")
  return
end

local res = get(url)
if res then
  local file = fs.open(path, "w")
  file.write(res)
  file.close()
  print("Downloaded from " .. url .. " as " .. filename)
end
