$startx = "<?xml version='1.0' encoding='UTF-8' standalone='no' ?><gpx xmlns=`"http://www.topografix.com/GPX/1/1`" version=`"1.1`" xmlns:xsi=`"http://www.w3.org/2001/XMLSchema-instance`" xsi:schemaLocation=`"http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd`" creator=`"com.mapfactor.navigator`"><trk><name>All</name><trkseg>"


foreach($file in (Get-ChildItem -Path "C:\temp\gps"))
{
    $file.fullname
    foreach($line in (Get-Content -Path $file.fullname))
    {
        if ($line.startswith("A"))
        {
            try
            {
                $max = "<trkpt lat=`""+ ([math]::round([int] ($line.split(",")[3].substring(1,2)) + ( [int] ($line.split(",")[3].substring(3,2))  / 60 )+ (([int] $line.split(",")[3].substring(6,4))/10000/60),6)).Tostring()+"`""
                $max +=      " lon=`""+ ([math]::round([int] ($line.split(",")[5].substring(1,3)) + ( [int] ($line.split(",")[5].substring(4,2))  / 60 )+ (([int] $line.split(",")[5].substring(7,4))/10000/60),6)).Tostring()+"`">"
                $max += "<ele>300.00</ele>"
                $datx = ($line.split(",")[1]+$line.split(",")[2])
                $daty = "20"+$datx[4]+$datx[5]+"-"+$datx[2]+$datx[3]+"-"+$datx[0]+$datx[1]+"T"+$datx[6]+$datx[7]+":"+$datx[8]+$datx[9]+":"+$datx[10]+$datx[11]+"Z"
                $max += "<time>"+$daty+"</time>"
                $max += "</trkpt>"
                $startx+=$max
            }
            catch
            {
             "`t"+$line
            }
        }
    }
}
$startx += "</trkseg></trk></gpx>"

$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllLines("C:\temp\xxx.gpx", $startx, $Utf8NoBomEncoding)



#  <trkpt lat="49.785812" lon="18.263496"><ele>242.00</ele><time>2019-02-07T15:52:29Z</time></trkpt>
