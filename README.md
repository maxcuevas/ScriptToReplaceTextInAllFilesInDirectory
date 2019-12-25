# ScriptToReplaceTextInAllFilesInDirectory

This script will replace certain text in all files found in a directory. It will overwrite the original files.

Example of calling script
```
.\replaceTextInAllFIles.ps1 .\filesToReplaceTextIn
```

If you need to be able to replace text that has a new line in it you could do something like this:

```
$textToReplace = "replace this " + $newLine + "bit of text"
```
