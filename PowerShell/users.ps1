# Start of script
cls

foreach ($targetou in 'A','B','C','D','E','F','G','GUESTACCOUNTS','H','I','J','K','L','CONTRACTOR','M','N','O','P','Q','R','S','T',','U','V','W','X','Y','Z')
{
"Processing information for OU $targetou"
$DomainRootPath='LDAP://OU='+$targetou+',OU=ORGUSER,DC=contoso,DC=com'
$adsearch = New-Object DirectoryServices.DirectoryAdsearch([adsi]$DomainRootPath)
$adsearch.filter = "(objectclass=user)"
$adsearch.PropertiesToLoad.AddRange(@("name"))
$adsearch.PropertiesToLoad.AddRange(@("lastLogon"))
$adsearch.PropertiesToLoad.AddRange(@("givenName"))
$adsearch.PropertiesToLoad.AddRange(@("SN"))
$adsearch.PropertiesToLoad.AddRange(@("DisplayName"))
$adsearch.PropertiesToLoad.AddRange(@("extensionAttribute1"))
$adsearch.PropertiesToLoad.AddRange(@("extensionAttribute2"))
$adsearch.PropertiesToLoad.AddRange(@("comment"))
$adsearch.PropertiesToLoad.AddRange(@("title"))
$adsearch.PropertiesToLoad.AddRange(@("mail"))
$adsearch.PropertiesToLoad.AddRange(@("userAccountControl"))
$adsearch.Container
$users = $adsearch.findall()
$report = @()
foreach ($objResult in $users)
{
$objItem = $objResult.Properties
$temp = New-Object PSObject
$temp | Add-Member NoteProperty name $($objitem.name)
$temp | Add-Member NoteProperty title $($objitem.title)
$temp | Add-Member NoteProperty mail $($objitem.mail)
$temp | Add-Member NoteProperty displayname $($objitem.displayname)
$temp | Add-Member NoteProperty extensionAttribute1 $($objitem.extensionattribute1)
$temp | Add-Member NoteProperty extensionAttribute2 $($objitem.extensionattribute2)
$temp | Add-Member NoteProperty givenname $($objitem.givenname)
$temp | Add-Member NoteProperty sn $($objitem.sn)
$temp | Add-Member NoteProperty useraccountcontrol $($objitem.useraccountcontrol)
$report += $temp
}
$csvfile="AD-"+$targetou+".csv"
$report | export-csv -notypeinformation $csvfile
"Wrote file for $targetou"
}
