$icsfile = ".\ForExport.ics"
$csvfile = ".\ForExport.csv"

if (-not ( test-path $csvfile ))
{
    """Subject"";""Description"";""Location"";""Start_Year"";""Start_Month"";""Start_Day"";""Start_Hour"";""Start_Minute"";""End_Year"";""End_Month"";""End_Day"";""End_Hour"";""End_Minute"";""UID""`r`n" > .\ForExport.csv
}
else
{
	$export = "BEGIN:VCALENDAR"+"`r`n"
	$export += "VERSION:2.0"+"`r`n"
	$export += "PRODID:-//IBM// test of ics export"+"`r`n"

	#(Import-Csv $csvfile -delimiter ";" ) | ft

	foreach( $a in (Import-Csv $csvfile -delimiter ";" ) )
	{
        #to get rid of empty csv lines
        if (($a.Subject+$a.Start_Year+$a.Start_Month+$a.Start_Day+$a.Start_Hour+$a.Start_Minute+$a.End_Year+$a.End_Month+$a.End_Day+$a.End_Hour+$a.End_Minute).length -gt 18)
        {
            #start event
            if ($a.Start_Month.length -eq 1) {  $a.Start_Month = "0"+ $a.Start_Month } # to add leading zeros
            if ($a.Start_Day.length -eq 1) {    $a.Start_Day = "0"+   $a.Start_Day } # to add leading zeros
            if ($a.Start_Hour.length -eq 1) {   $a.Start_Hour = "0"+  $a.Start_Hour } # to add leading zeros
            if ($a.Start_Minute.length -eq 1) { $a.Start_Minute = "0"+$a.Start_Minute } # to add leading zeros
    
            #end event
            if ($a.End_Month.length -eq 1) {  $a.End_Month = "0"+ $a.End_Month } # to add leading zeros
            if ($a.End_Day.length -eq 1) {    $a.End_Day = "0"+   $a.End_Day } # to add leading zeros
            if ($a.End_Hour.length -eq 1) {   $a.End_Hour = "0"+  $a.End_Hour } # to add leading zeros
            if ($a.End_Minute.length -eq 1) { $a.End_Minute = "0"+$a.End_Minute } # to add leading zeros
    
            $export += "BEGIN:VEVENT"
            $export += "`r`n"+"DTSTART:"+$a.Start_Year+$a.Start_Month+$a.Start_Day+"T"+$a.Start_Hour+$a.Start_Minute+"00"
            $export += "`r`n"+"DTEND:"+$a.End_Year+$a.End_Month+$a.End_Day+"T"+$a.End_Hour+$a.End_Minute+"00"
            $export += "`r`n"+"DTSTAMP:"+$a.Start_Year+$a.Start_Month+$a.Start_Day+"T"+$a.Start_Hour+$a.Start_Minute+"00Z"
		
            #if no UID, let's create one
            if ($a.UID.length -gt 3) 
            {
                $export += "`r`n"+"UID:"+$a.UID # should be unique
            }
            else
            {
                $export += "`r`n"+"UID:"+ $a.Subject+$a.Start_Year+$a.Start_Month+$a.Start_Day+"T"+$a.Start_Hour+$a.Start_Minute+"00"
            }
	
            #if Subject exists
            if ($a.Subject.length -gt 3) 
            {
                $export += "`r`n"+"SUMMARY:"+$a.Subject
            }
            else
            {
                $export += "`r`n"+"SUMMARY:"+$a.Subject+"-"
            }
    
    
            #if Description exists.
            if ($a.Description.length -gt 3) 
            {
                $export += "`r`n"+"DESCRIPTION:"+$a.Description.replace("`r`n","\n").replace("`n","\n")
            }
    

            #if Location exists
            if ($a.Location.length -gt 3) 
            {
                $export += "`r`n"+"LOCATION:"+$a.Location
            }
	
            $export += "`r`n"+"END:VEVENT"
            $export += "`r`n"
        }
	}

	$export += "END:VCALENDAR"+"`r`n"
    if (test-path $icsfile )
    {
        remove-item $icsfile
    }
    
	out-file -filepath $icsfile -inputobject $export -encoding ASCII 
}
