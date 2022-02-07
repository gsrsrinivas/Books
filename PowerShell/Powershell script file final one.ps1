cls
$DestinationFolder = "C:\Users\cinu\Pictures\Surya"
$SourceFolder      = "C:\Users\cinu\Pictures\5.Surya"

$StartDate=(GET-DATE)

If (Test-Path $SourceFolder) { Write-Host "Source Folder exists" } 
else { Write-Host "Source Folder does not exists" }

$SrcFiles = Get-ChildItem $SourceFolder -Recurse -include *.*
Write-Host $SrcFiles.Count

foreach ($filename in $SrcFiles)
{

    Write-Host $filename.FullName
    #$SourceFile = $SourceFolder + "\" + $filename.Name
    $SourceFile = $filename.FullName

    if ((Get-ItemProperty -Path $SourceFile ).Extension -eq "") { 
        Write-Host "Its a Folder" } else { Write-Host "Its a File" }

    Write-Host $SourceFile 
    $Year = (Get-ItemProperty -Path $SourceFile).LastWriteTime.Year
    #Write-Host $year 
    $Month = (Get-ItemProperty -Path $SourceFile).LastWriteTime.Month
    #Write-Host $Month 
    $Day = (Get-ItemProperty -Path $SourceFile).LastWriteTime.Day
    #Write-Host $Day

    $DestinationFile = "$DestinationFolder\$Year\$Month\$Day\" + $filename.Name

    Write-Host $DestinationFile

    $SourceFile = $SourceFile
    $DestinationFile = $DestinationFile

    If (Test-Path $DestinationFile) {
        $i = 0
        While (Test-Path $DestinationFile) {
            $i += 1
            $DestinationFile = [System.IO.Path]::GetDirectoryName($DestinationFile) + "\" + [System.IO.Path]::GetFileNameWithoutExtension($SourceFile) + "--" + $i + [System.IO.Path]::GetExtension($SourceFile)
            Write-Host $DestinationFile 
        } 
    } 
    Else {   
        New-Item -ItemType File -Path $DestinationFile -Force 
    }

    Write-Host "Getting Ready to move the File...."
    Start-Sleep -m 2
    Write-Host "File Moving Started...."
    
    Move-Item -Path $SourceFile -Destination $DestinationFile -Force
    
    Write-Host "File Moving Finished...."
    Start-Sleep -m 2
    Write-Host "Selecting another File to move...."
}
$EndDate=(GET-DATE)
NEW-TIMESPAN –Start $StartDate –End $EndDate
Write-Host "Successfully Moved the files"


