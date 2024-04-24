Gathering:
Every minute it use arp/nmap to get on local network devices (hostname and MAC)
- Store the information into sqlite database with query "add if not existing"
  - If not existing mark the name with "---"
- Append into daily text file the list (date,MAC) the found devices

Sqllite db:
- information about device
- Tag (column), if should be shown in report
  - router not needed
  - always on static smart devices
- Update a device via sql query

Show-website:
Screenshot show how it look on generated website, whereas the number show how many minutes in one hour it got a find.
- Via python it gather all MACs in the daily text file. And sum the count of times it was found per hour
  - present on website
  - does for last 3 days (may longer, but takes time)
  - Above 60 , it usually point to a device that use multi network(shared network card...)  or some temporary delay (leap second)

60|13|00 <- first 13 minutes from that hour
00|13|60 <- last 13 minutes from that hour
13|26|23 <- usually device use wake-sleep method or just is and is not here


Purpose or why was it created:
- Be able to tell when we left home/returned (count duration)
- When was someone visiting us (and knows wifi)
- When a device went off, Children turn off TV
- When child arrived and be able to check it remotly
- Detect new devices on network
