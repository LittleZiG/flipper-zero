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

        # Spécifier l'encodage (utf-8) lors de la lecture du fichier
        $fileContent = Get-Content -Path $fileupload -Raw -Encoding UTF8

        $ftpRequest = [System.Net.FtpWebRequest]::Create("ftp://ftp.zigflip.fun/log/" + $outputFile)
        $ftpRequest.Credentials = New-Object System.Net.NetworkCredential($ftpUsername, $ftpPassword)
        $ftpRequest.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile

        # Convertir le contenu du fichier en tableau d'octets avec l'encodage UTF-8
        $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)
        $ftpRequest.ContentLength = $fileBytes.Length

        # Obtenir le flux de la requête et écrire les données
        $requestStream = $ftpRequest.GetRequestStream()
        $requestStream.Write($fileBytes, 0, $fileBytes.Length)
        $requestStream.Close()

        # Obtenir la réponse du serveur
        $ftpResponse = $ftpRequest.GetResponse()

        Write-Host "Le fichier a été uploadé avec succès."
    }
    catch {	
        Write-Host "Erreur lors de l'upload du fichier : $_.Exception.Message"
    }
    finally {
        $webClient.Dispose()
    }
}
