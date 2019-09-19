<#
This powershell script will perform the following activity to implement sanitization

Take a file input
Archive the input file to .zip format (hereafter the 'zip file' and 'archive file' words are inter changably used)
Move the zip file to a temporary location
Unzip all the compressed files and remove the parent archive files

#>

# packages #
Add-Type -AssemblyName System.Windows.Forms

# get-filename function #
Function Get-FileName($initialDirectory)
{   
 [System.Reflection.Assembly]::LoadWithPartialName(“System.windows.forms”) |
 Out-Null

 $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
 $OpenFileDialog.initialDirectory = $initialDirectory
 $OpenFileDialog.filter = “Compressed (zipped) Folder|*.zip”
 $OpenFileDialog.ShowDialog() | Out-Null
 $OpenFileDialog.filename
} 

# gets file #
$file = Get-FileName -initialDirectory “file”

# temporary folder creation #
$homefolder=$env:USERPROFILE
New-Item -ItemType Directory -Force -Path $homefolder\temp
[String]$location="$homefolder\temp"

# move files to temporary location #
Move-Item $file $location -Force 

# expand all archives #
Get-ChildItem -Recurse -Path $location *.zip | Expand-Archive -DestinationPath $location -force
Get-ChildItem -Recurse -Path $location *.zip | Expand-Archive -DestinationPath $location -force

# removes all archive files #
Get-ChildItem -Recurse -Path "$location" *.zip | Remove-Item -Force 
