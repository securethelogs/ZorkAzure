<#
	.SYNOPSIS
		Scan for Azure resources

	.DESCRIPTION
		ZorkAzure helps identify the follow resources:

        - Storage accounts; Blob, Queues, File and Tables
        - Azure SQL Databases


	.EXAMPLE
		See guide: https://securethelogs.com/zorkazure-enumerating-azure-resources/

	.NOTES
		Aurthor: https://Securethelogs.com -  @wet_slappy
		
		.
#>


function ZorkAzure {

Write-Output " "
Write-Output "  ________                 __      ______                                 "
Write-Output " /\_____  \               /\ \    /\  _  \                                "
Write-Output " \/____//'/'    ___   _ __\ \ \/'\\ \ \L\ \  ____    __  __  _ __    __   "
Write-Output "      //'/'    / __`\/\`'__\ \ , < \ \  __ \/\_ ,`\ /\ \/\ \/\`'__\/'__`\ "
Write-Output "     //'/'___ /\ \L\ \ \ \/ \ \ \\`\\ \ \/\ \/_/  /_\ \ \_\ \ \ \//\  __/ "
Write-Output "     /\_______\ \____/\ \_\  \ \_\ \_\ \_\ \_\/\____\\ \____/\ \_\\ \____\"
Write-Output "     \/_______/\/___/  \/_/   \/_/\/_/\/_/\/_/\/____/ \/___/  \/_/ \/____/"
Write-Output " "                                                         
Write-Output "`n"
Write-Output " Author: https://securethelogs.com"
Write-Output "`n"



# Gather words

$location = Read-Host -Prompt "Enter your wordlist location (Example: C:\Temp\wordlist.txt):"

#Get the wordlist
$words = Get-Content $location


foreach ($word in $words) {

#clear all errors
        $Error.clear()

        
         $resultblob = Test-NetConnection "$word.blob.core.windows.net" -Port 80 -erroraction SilentlyContinue -InformationLevel Quiet -WarningAction silentlyContinue
         $resulttable = Test-NetConnection "$word.table.core.windows.net" -Port 80 -erroraction SilentlyContinue -InformationLevel Quiet -WarningAction silentlyContinue
         $resultqueue = Test-NetConnection "$word.queue.core.windows.net" -Port 80 -erroraction SilentlyContinue -InformationLevel Quiet -WarningAction silentlyContinue
         $resultfile = Test-NetConnection "$word.file.core.windows.net" -Port 80 -erroraction SilentlyContinue -InformationLevel Quiet -WarningAction silentlyContinue
         $resultdb = Test-NetConnection "$word.database.windows.net" -Port 1433 -erroraction SilentlyContinue -InformationLevel Quiet -WarningAction silentlyContinue

         

        

# ------ Search for Blob -----------------

         if ($resultblob -eq "True"){

Write-Output "Blob Storage Found: $word.blob.core.windows.net"

} else {

#Do nothing

}


# ------ Search for Tables -----------------

         if ($resulttable -eq "True"){

Write-Output "Table Found: $word.table.core.windows.net"

} else {

#Do nothing

}

# ------ Search for Queue -----------------

         if ($resultqueue -eq "True"){

Write-Output "Queue Found: $word.queue.core.windows.net"

} else {

#Do nothing

}

# ------ Search for Files -----------------


         if ($resultfile -eq "True"){

Write-Output "Queue Found: $word.file.core.windows.net"

} else {

#Do nothing

}

# ------ Search for Databases -----------------

         if ($resultdb -eq "True"){

Write-Output "Database Found: $word.database.windows.net"

} else {

#Do nothing

}



}
Write-Output "`n"
Write-Output "`n"
Write-Output "If no results were found, try checking your wordlist or network connection"

}
