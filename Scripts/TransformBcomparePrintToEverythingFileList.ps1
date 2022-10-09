<<<<<<< HEAD
﻿#
#  1 - read in columns of
#
# Read in data


#  2 - remove top 12 rows  

$inputx = ( Get-Content -ReadCount 10000 -path 'X:\ToDatabase\Files\''L D B S E T T''files.txt'  ) | Select-Object -Skip 12 | Select-Object -first 10 | ConvertTo-Csv -Delimiter `t
=======
#
#  1 - read in columns of
#
# Read in data
#  2 - remove top 12 rows  

>>>>>>> 01073a2 (Merge commit '67d731c8236c3dd90115a8da33a9ff8961af8ad5' into Branch_d5eaf3c4)
#(Measure-Command ).TotalSeconds
$inputx = [System.IO.File]::ReadLines('X:\ToDatabase\Files\''L D B S E T T''files.txt') | Select-Object -Skip 12 # | Select-Object -first 10 
  
$outputx  = $inputx | ForEach-Object {
    $hash  = @{
        Filename= '\\192.168.0.30\' + ($_ -split "[ ]{1,}")[0] 
        Size=($_ -split "[ ]{1,}")[1]
        'Date Modified'= ($_ -split "[ ]{1,}")[2]
        'Date Created'= ($_ -split "[ ]{1,}")[3]
        Attributes= ($_ -split "[ ]{1,}")[4]
        }
        New-Object PSObject -Property $hash
}

$outputx | Select-Object -property Filename, Size, 'Date Modified', 'Date Created', Attributes | Export-Csv  -Delimiter ',' -Path "X:\ToDatabase\Files\BcompareFileList.efu" -NoTypeInformation 
# Save as csv file # need powershell vers 7.x -QuoteFields "Filename"
<<<<<<< HEAD
#  - "" arround first column
#Left Orphan Files (1315753) Size          Modified            Attr
#  -
$inputx

$outputx = $inputx | 
    Select-Object @{@($_.PSObject.Properties)[1]={[string]$_."Filename"}},
        @{@($_.PSObject.Properties)[2]={[string]$_."Size"}},
        @{@($_.PSObject.Properties)[3]={[string]$_."Date Modified"}},
        @{@($_.PSObject.Properties)[4]={[string]$_."Date Created"}},
        @{@($_.PSObject.Properties)[5]={[string]$_."Attributes"}};



#  3 - append \\19.. before path column
$outputx | Format-Table @{Label="Filename"; Expression={'"\\192.168.0.30\' + $_.Filename + '"'}} | Export-Csv -NoTypeInformation -Path "X:\ToDatabase\Files\BcompareFileList.efu" -Delimiter ','

# Save as csv file
=======
>>>>>>> 01073a2 (Merge commit '67d731c8236c3dd90115a8da33a9ff8961af8ad5' into Branch_d5eaf3c4)

