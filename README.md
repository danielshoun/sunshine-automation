This is a script to have Sunshine change your primary display's resolution to whatever your Moonlight client is requesting and back at the start/end of a stream. Similar scripts are already out there, but they focus on setting up and using a virtual display driver. If you don't mind your actual monitor being used for streaming, this works just as well.

You will need to install the WindowsDisplayManager module in an elevated Powershell terminal before this will work:
```Install-Module WindowsDisplayManager```

First, modify the last line in `setup.ps1` to have your display's actual FPS as the final argument, and the last line in `teardown.ps1` to have your screen's actual resolution and FPS.

Next, in your Sunshine config app, go to Configuration > General. Click the "+ Add" button at the bottom of the "Command Preparations" section. Fill in the `config.do_cmd` and `config.undo_cmd` fields as follows, and check the `config_elevated` box:
```
config.do_cmd: cmd /C powershell.exe -executionpolicy bypass -windowstyle hidden -file "<PATH TO FOLDER HOLDING THESE SCRIPTS>\setup.ps1" %SUNSHINE_CLIENT_WIDTH% %SUNSHINE_CLIENT_HEIGHT%

config.undo_cmd: cmd /C powershell.exe -executionpolicy bypass -windowstyle hidden -file "<PATH TO FOLDER HOLDING THESE SCRIPTS>\teardown.ps1"
```

Fill in the `<PATH TO FOLDER HOLDING THESE SCRIPTS>` bit with the folder where you saved this repo.

Once you click Save, Sunshine will restart. You should now find that the resolution of your monitor changes to match your Moonlight client's settings when you start streaming. Be aware that in order for the resolution to go back to its original values, you need to fully stop the client streaming. Simply pausing the stream (such as by hitting Start+Select+L1+R1) will not trigger the undo command.

**NOTE:** For my own use, I didn't bother with changing FPS and HDR settings to match the client as I don't use HDR and my monitor doesn't support the 90 FPS that my primary client, a Steam Deck, runs at. Similar to the `%SUNSHINE_CLIENT_WIDTH%` and `%SUNSHINE_CLIENT_HEIGHT%` arguments passed in by the do/undo commands, variables exist for FPS and HDR that can be used to accomplish this if you desire.