Add-Type -AssemblyName System.Windows.Forms 

$Screens = @()
$num = 100
$Sound = New-Object System.Media.SoundPlayer
Function rand() 
{
    Get-Random -Maximum '1500' -Minimum '0'
}

for($x=0; $x -lt $num; $x++)
{
    $Screen = New-Object System.Windows.Forms.Form
    $Screen.ClientSize = '300 , 120'
    $screen.StartPosition = "Manual"
    $Screen.Location = "$(rand),$(rand)"
    $Screen.Text = "ERROR"
    $Screen.BackColor = "Red"
    $Screens += $Screen
}

foreach($Screen in $Screens)
{
    $Screen.show()
    $Sound.playsync()
    Start-Sleep -Seconds '0.20'
}


foreach($Screen in $Screens)
{
    $Screen.Close()
}




