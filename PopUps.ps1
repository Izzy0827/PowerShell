##(:<for Educational porpuses only>:)##

Add-Type -AssemblyName System.Windows.Forms #allos us to create a GUI on windows

$Screens = @() ##array to hold win form objects
$num = 10 ##num of pop-ups 
$Sound = New-Object System.Media.SoundPlayer ##object needed to play error sound
$font = New-Object System.Drawing.Font("Microsoft Sans Serif", 20) ##variable used to store font object | first parameter will be font style | secomd will be font size 
 
##custom functtion that returns a random number that we will use for pop-up (x,y) coordinates
Function rand() 
{
    Get-Random -Maximum '1500' -Minimum '0' ##returns num from selected max & min ranges | custom these as you wish
}

##for loop that creates all win form custom objects
for($x=0; $x -lt $num; $x++)
{
    $Screen = New-Object System.Windows.Forms.Form ##create new win form object
    $Screen.ClientSize = '300 , 120' ##change these to custom size of win form
    $screen.StartPosition = "Manual" ##allows us to custom location 
    $Screen.Location = "$(rand),$(rand)" ##this is where rand() function comes in handy
    $Screen.Text = "ERROR" ##chsnge name of pop-up here
    $Screen.BackColor = "Red" ##change color here 

    $Label = New-Object System.Windows.Forms.Label ##create new label object used for msg inside win form pop-up
    $Label.Text = 'Insert Message' ##change msg here 
    $Label.Location = New-Object System.Drawing.Size(50,45) ##location where msg will be displayed inside win form pop-up
    $Label.Size = '200,100' #size of area where msg will cover | change to you liking | (x,y) format
    $Label.Font = $font #font variable created in line 8
    
    
    $Screen.Controls.add($Label)
    
    $Screens += $Screen #this populates array of win form objects
}

##for each loop to display pop-up windows 
foreach($Screen in $Screens)
{
    $Screen.show() #display win form
    $Sound.playsync()#play error sound
    $Screen.Refresh()#allows win form to refresh and be displayed properly
    Start-Sleep -Seconds '0.20' #change interval of time between win forms
}

###############<if using this program for testing purposes leave section UNCOMMENTED>#############
###############<COMMENT AT YOUR OWN RISK>###############

#foeeach loop to clear all the pop-ups so you dont manually
##have to and/or crash your system
foreach($Screen in $Screens)
{
    $Screen.Close()
}




