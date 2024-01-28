$Computer = "192.168.1.55"
$Port = "80"
$every = 2 #seconds + 500miliseconds of timeout
$disconnected=$true
write-host $Computer
do
{
    $Socket = New-Object Net.Sockets.TcpClient
    $ErrorActionPreference = 'SilentlyContinue'
    $Socket.Connect($Computer, $Port)
    $ErrorActionPreference = 'Continue'
    $socket.SendTimeout = 500
    if ($Socket.Connected)
    {
        write-host ((get-date).tostring("yyyy/MM/dd HH:mm:ss")) ($Computer+" Open") -backgroundcolor green
        $Socket.Close()
		start-sleep -s $every        
        $disconnected=$false
    }
    else
    {
        write-host ((get-date).tostring("yyyy/MM/dd HH:mm:ss")) ($Computer+" Closed") -backgroundcolor red
		start-sleep -s $every
    }
    $Socket = $null  
}
while ($disconnected)

