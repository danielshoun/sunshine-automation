Import-Module WindowsDisplayManager

$width = [int]$args[0]
$height = [int]$args[1]

$display = (WindowsDisplayManager\GetAllPotentialDisplays)[0]

$display.SetResolution($width, $height, 165)