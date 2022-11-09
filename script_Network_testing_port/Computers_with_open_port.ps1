
function get-one{
    param(
        [string] $Xcomputer = "localhost" , #if not defined
        [int] $Xport = 80  #if not defined
    )
    try
    {
        $Socket = New-Object Net.Sockets.TcpClient
        $ErrorActionPreference = 'SilentlyContinue'
        $Socket.Connect($Xcomputer, $Xport)
        $ErrorActionPreference = 'Continue'
        $socket.SendTimeout = 100
    
        if ($Socket.Connected)
        {
            write-host $Xcomputer "`tOpen" -backgroundcolor green
            $Socket.Close()
            $Socket = $null  
        }
    }
    catch
    {
        #write-host $Xcomputer "`tClosed" -backgroundcolor red
        $Socket = $null  
    }
}


workflow processingtask 
{
    param(
        [string[]] $manycomputers
    )
    foreach -parallel -throttle 20 ($onecomputer in $manycomputers)
    {
        get-one -xcomputer $onecomputer -xport 22  #This port is tested
    }
}


$computers = @()

for ([int] $i=2 ; $i -lt 60 ; $i++)  #It works ... making a range of IPs.
{
    $computers+= ("192.168.1."+$i.ToString())
}

processingtask -manycomputers $computers 

 
write-host "Done, click any key"
Read-Host  

 

