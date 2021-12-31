﻿Function MakeSoftLink {
[CmdletBinding()]
param (

    [Parameter(Mandatory=$true,
                HelpMessage="what to link")] 
    [string]$Source,

    [Parameter(Mandatory=$false,
                HelpMessage="where to create link")] 
    [string]$target
)
PROCESS {  


if((Get-Item $source) -is [System.IO.DirectoryInfo]) 
{
$flag = '/D'
}
else
{
$flag = '/j'
}

Start-Process -Wait -FilePath cmd -Verb RunAs -ArgumentList '/k', 
  'mklink', $flag, "`"$target`"", "`"$source`""

}        
END { 

}
}   