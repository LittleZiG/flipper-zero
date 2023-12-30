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
        
        $webClient.UploadFile($ftpserver$remotepath$localfilepath.name,$localfilepath)

        Write-Host "Le fichier a été uploadé avec succès."
    }
    catch {
        Write-Host "Erreur lors de l'upload du fichier : $_.Exception.Message"
    }
    finally {
        $webClient.Dispose()
    }
}
