#This script will return all Active Directory computer objects that have been stale 
#for over the num of days provided below

$DaysInactive = #<Insert Num of Days>

#gives you the actual date of the $DaysInactive variable
$time = (Get-Date).Adddays(-($DaysInactive))

#get all the stale pcs & display in alpha order
Get-ADComputer -Filter {LastLogonTimeStamp -lt $time -And enabled -eq $true} -Properties Ipv4Address, OperatingSystem, LastLogonDate | Select-Object DNSHostName, Ipv4Address, OperatingSystem, LastLogonDate | Sort-Object -Property LastLogonDate
