<#

This script will replace certain text in all files found in a directory. It will overwrite the original files.

Example of calling script
.\replaceTextInAllFIles.ps1 .\filesToReplaceTextIn

#>

Param ( 
    [Parameter(Mandatory=$True)][String]$SourcePath
) 
     
$Files = Get-ChildItem $SourcePath -Recurse -File 

$newLine = [Environment]::NewLine
$replacementText = "1 = one" + $newLine + "2 = two" + $newLine + "3 = three" + $newLine + "4 = four"
$textToReplace = "replace this bit of text"


If ($Files.Count -gt 0)
{ 
    ForEach($File in $Files) 
    {
        Write-Host "Read and Convert $($File.Name)" -ForegroundColor Cyan 
        $fileText = [IO.File]::ReadAllText($File.FullName)
        $fileText = $fileText.Replace($textToReplace, $replacementText)
        [System.IO.File]::WriteAllLines(($File.FullName), $fileText)
    } 

    Write-Host "Replacement of Text in $($Files.Count) Files" -ForegroundColor Green 
} 
Else 
{ 
        Write-Host "Source-Directory empty or invalid SourcePath." -ForegroundColor Red 
}