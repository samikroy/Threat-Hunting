$Response = Invoke-WebRequest -URI https://www.microsoft.com/en-us/download/confirmation.aspx?id=56519
$DownloadLink = $Response.Links |  where {$_.href.Contains("/ServiceTags_Public")} |select href
$URL = $DownloadLink.href
$jsonFileData = Invoke-WebRequest -Method Get -URI $URL | ConvertFrom-Json
$jsonFileData | ConvertTo-Json -depth 100 | Out-File ".\servicetags.json"
