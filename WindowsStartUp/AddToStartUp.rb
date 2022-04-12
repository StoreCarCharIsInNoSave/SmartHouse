script='Set oShell = CreateObject ("Wscript.Shell")
Dim strArgs
strArgs = "cmd /c C:\SmartHouse\WindowsStartUp\ToRunServer.bat"
oShell.Run strArgs, 0, false'

filename='C:\Users\\'+ENV['USERNAME']+'\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\ToRunWithOutWindow.vbs'

def create_file(file_name,script)
  File.open(file_name, 'w') do |file|
    file.puts script
  end
end
create_file(filename,script)
