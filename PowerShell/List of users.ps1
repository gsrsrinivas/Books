function Listofusers
{
$strFilter = "(&(objectCategory=User))"

$objDomain = New-Object System.DirectoryServices.DirectorySearcher

$objSearcher = New-Object System.DirectoryServices.DirectorySearcher

$ObjSearcher.SearchRoot = $ObjDomain

$ObjSearcher.PageSize = 10000

$objSearcher.Filter = $strFilter

$objSearcher.SearchRoot = "dc=domain,dc=local"

$colResults = $objSearcher.FindAll()

foreach($objResult in $colResults)
{
$objItem = $objResult.Properties; $objItem.name
}

}
ListofUsers
