$Cont = docker ps --filter "status=running" --filter "name= dockapp_myapp-develop_"  --format '{{ .ID }}'

$ipaddress = docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}"  $Cont

$ipaddress

Start-Process "chrome.exe" "$ipaddress"