# Load the assembly. I used a relative path so I could off using the Resolve-Path cmdlet

$path = "D:\PS-praca s mp3-tagy\taglib-sharp.dll"
[System.Reflection.Assembly]::LoadFile($path)

# Load up the MP3 file. Again, I used a relative path, but an absolute path works too

$folderXXL = "A:\Music"

break
foreach($six in (get-childitem -path $folderXXL -recurse -filter "*.mp3"))
{
    $media = [TagLib.File]::Create($six.fullname)
    $media.Tag.Album = "SD"
    $media.Tag.AlbumID = "SD"
    $media.Tag.Year = "2023"
    $sio =$media.Tag.Title
    write-host $sio
    $media.Tag.Track = ""
    $media.Tag.AlbumArtists = ""
    $media.Tag.Comment = ""
    $pic = [taglib.picture]::createfrompath("D:\PS-praca s mp3-tagy\images.jpg")
    $media.Tag.Pictures = $pic
    # Save the file back
    $media.Save()
    if ($sio.Length -gt 3)
    {
       # Rename-Item -Path $six.FullName -NewName $sio".mp3"
    }
    write-host $six.fullname
}
