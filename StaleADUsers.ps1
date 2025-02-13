#This script will return the samaccount name and the lastlogon date of stale user objects in Active Directory
#you will have to manually enter the number of days of inactivity by replacing "<Insert Num of days>" with the number

#set number of days here 
$DaysInactive = <Insert Num of days!>

#this will give the exact date of the first day of inactivity
$time = (Get-Date).Adddays(-($DaysInactive))

#Displays the user objects and their last log on date 
#you can add more user properties to your query by placing your property of choice in the select-object section
#example: Select-Object SamAccountName, LastLogonDate <,property>  (don't forget the comma)
Get-ADUser -Filter {enabled -eq $true} -Properties LastLogonDate | Where-Object {$_.LastLogondate -le $time} | Select-Object SamAccountName, LastLogonDate | Sort-Object -Property LastLogonDate

