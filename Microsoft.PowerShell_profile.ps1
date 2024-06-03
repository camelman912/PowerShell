$PSDefaultParameterValues=@{
    "Get-AdUser:server"="192.168.1.12"
    "Get-AdUser:credential"=(Import-Clixml -Path 'C:\users\T0173536\ricky-domain-creds.xml')
    "Invoke-RestMethod:SkipCertificateCheck"=$True
    "ConvertTo-JSON:Depth"=5
}

$rickydomaincreds = Import-Clixml -Path C:\Users\T0173536\ricky-domain-creds.xml

# Base64 Encode/Decode CMDLET Functions
Function ConvertFrom-Base64($base64) {
    return [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($base64))
}

Function ConvertTo-Base64($plain) {
    return [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes($plain))
}

function Get-FullHistory {
    param(
		[Parameter()] [string] $grep
	)
	
	if($grep){ 
		Get-Content (Get-PSReadLineOption).HistorySavePath | Select-String -Pattern $grep 
	}else { 
		Get-Content (Get-PSReadLineOption).HistorySavePath
	}
}

#CMDLET Function To Play with Console Colors

function Set-ConsoleColor ($bc, $fc) {
   $Host.UI.RawUI.BackgroundColor = $bc
   $Host.UI.RawUI.ForegroundColor = $fc
}

#Set-ConsoleColor 'black' 'gray'

function Grant-Admin {
	Start-Process wt pwsh -Verb runAs
}

function Reload-Profile{
	& $profile
}


$MaximumHistoryCount = 9999

#New Aliases
New-Alias -name FullHistory -value Get-FullHistory
New-Alias -name "npp" -value "C:\Program Files (x86)\Notepad++\notepad++.exe"
New-Alias -name vscode -value "C:\Users\t0173536\AppData\Local\Programs\Microsoft VS Code\Code.exe"
New-Alias -name ga -Value Grant-Admin


