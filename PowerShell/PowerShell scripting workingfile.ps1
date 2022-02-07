#------------------------------------------------------
cls
$destDir = "C:\Users\cinu\Desktop\1" 
$SourceFile = "C:\Users\cinu\Desktop\sample.txt"

if (!(Test-path $destDir)) { md $destDir } 
else { Write-Host "Directory already exists" } 


if (!(Test-path $SourceFile)) { 
Move-Item $SourceFile $destDir }
else { 


If (Test-Path $SourceFile) {
    $i = 0
    While (Test-Path $SourceFile) {
        $i += 1
        $SourceFile =  [System.IO.Path]::GetDirectoryName($DestinationFile) + "\" + [System.IO.Path]::GetFileNameWithoutExtension($SourceFile) + $i + [System.IO.Path]::GetExtension($SourceFile)
        Write-Host $SourceFile
    }
} Else {
    New-Item -ItemType File -Path $destFile -Force
}

Move-Item -Path $SourceFile -Destination $destFile -Force


Write-Host "File already exists" }

#------------------------------------------------------

"C:\Users\cinu\Desktop\1\sample$i.txt"
        [System.IO.Path]::GetExtension("sample.txt")
        [System.IO.Path]::GetFileNameWithoutExtension("sample.txt")
        [System.IO.Path]::GetDirectoryName("c:\sample.txt")

Dir | Get-ChildItem | Where-Object { $_.Name -like "*copy of*" }


#------------------------------------------------------
cls
$destDir = "C:\Users\cinu\Desktop\1" 
if (!(Test-path $destDir)) { md $destDir } 
else { Write-Host "Directory already exists" } 

$destFile = "C:\Users\cinu\Desktop\sample.txt"
if (!(Test-path $destFile)) { 
Move-Item $destFile $destDir }
else { 
Dir $destFile | ForEach-Object  -begin { $count=1 }  -process { rename-item $_ -NewName ($_.BaseName + $count + $_.Extension).ToString(); $count++ }

Write-Host "File already exists" }

#------------------------------------------------------
$i=0
While ($i > $SrcFiles.count) {
Write-Host $SrcFiles.Item(0)
$SourceFileName = $SrcFiles.Item(0)
$SourceFile = "$SourceFolder\$SourceFileName" 
Write-Host $SourceFile 
$DestinationFile = "$DestinationFolder\$SourceFileName"
Write-Host $DestinationFile
$i += 1
}
#------------------------------------------------------
Clear-Host
$Path = "C:\Users\cinu\Desktop\1\"
$WinExe = Get-ChildItem $Path -Recurse
$WinExe.count
Write-Host $WinExe.Item(0)
#------------------------------------------------------


$i = 1
Get-ChildItem *.jpg | %{Rename-Item $_ -NewName ('19981016_{0:D4}.jpg' -f $i++)}


Get-ChildItem attachment.* | Sort Extension -desc | Rename-Item -NewName {$_.basename + ".{0:D6}" -f ($_.extension.substring(1) + 1)}

$file = Get-ChildItem attachment.012345
$file.basename + ".0" + ([int]::parse([regex]::split($file.extension,"\D")) + 123).tostring()


Dir *.* | ForEach-Object  -begin { $count=1 }  -process { rename-item $_ -NewName ($_.BaseName+$Count+$_.Extension).tostring() ; $count++ }

Rename-Item $destFile -NewName ($_.BaseName + $i + $_.Extension).ToString()


#------------------------------------------------------------------------------------

$SourceFile = "C:\Users\cinu\Desktop\sample.txt"
$DestinationFile = "C:\Users\cinu\Desktop\1\sample.txt"

If (Test-Path $DestinationFile) {
    $i = 0
    While (Test-Path $DestinationFile) {
        $i += 1
        $DestinationFile = "C:\Users\cinu\Desktop\1\sample$i.txt"
    }
	
	
} Else {
    New-Item -ItemType File -Path $DestinationFile -Force
}

Copy-Item -Path $SourceFile -Destination $DestinationFile -Force

#----------------------------------------------------------------------------------------


$DestinationFile = [io.path]::GetDirectoryName("C:\Users\cinu\Desktop\sample.txt")  + "\1\" + [io.path]::GetFileName("C:\Users\cinu\Desktop\sample.txt") + "123" + [io.path]::GetFileNameWithoutExtension("C:\Users\cinu\Desktop\sample.txt")


//Rename-Item $destFile -NewName $_.BaseName + ('0' * (6 - $intInc.ToSTring().Length)) + ($intInc++).ToString() + $_.Extension 

Dir $destFile | ForEach-Object  -begin { $count=1 }  -process { rename-item $_ -NewName ($_.BaseName + $count + $_.Extension).ToString(); $count++ }



Dir | Get-ChildItem | Where-Object { $_.Name -like "*copy of*" }

#--------------------------------------------------

Get-ItemProperty -Path C:\Users\cinu\Desktop\1.jpg | Format-list -Property * -Force

Get-ItemProperty -Path C:\Users\cinu\Desktop\ | Format-list -Property * -Force

if ((Get-ItemProperty -Path C:\Users\cinu\Desktop\ ).Extension -eq "") 
{
Write-Host "folder"
} 
else 
{
Write-Host "File"
}

