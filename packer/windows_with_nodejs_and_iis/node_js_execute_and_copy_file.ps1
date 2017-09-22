# install IIS
add-windowsfeature web-webserver -includeallsubfeature
# install Nodejs
## download Nodejs
$nodejs_msi = "C:\nodetest\nodejs.msi"
$url = "https://nodejs.org/dist/v6.11.3/node-v6.11.3-x64.msi"
$webclient = New-Object System.Net.WebClient
$webclient.DownloadFile($url, $nodejs_msi)
## install the Nodejs application
Start-Process msiexec.exe -Wait -ArgumentList "/I $nodejs_msi /quiet"
## execute Nodejs script
Start-Process "C:\Program Files\nodejs\node.exe" -Wait -ArgumentList "C:\nodetest\nodejs_script_copy_file.js"
