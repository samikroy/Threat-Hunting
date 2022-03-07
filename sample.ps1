$DownloadCenterURL = "https://www.microsoft.com/en-us/download/confirmation.aspx?id=56519"
$Response = Invoke-WebRequest -URI $DownloadCenterURL
$DownloadLink = $Response.Links |  where {$_.href.Contains("/ServiceTags_Public")} | select href
$DownloadURL = [System.Uri]$DownloadLink[0].href
$jsonFileData = Invoke-WebRequest -Method Get -URI $DownloadURL | ConvertFrom-Json
$jsonFileData | ConvertTo-Json -depth 100 | Out-File ".\servicetags.json"
