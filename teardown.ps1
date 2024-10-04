Import-Module WindowsDisplayManager

$display = (WindowsDisplayManager\GetAllPotentialDisplays)[0]

$display.SetResolution(3840, 2160, 165)