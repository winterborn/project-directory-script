set default_path to "Users/admin/Desktop"
set jobNum to text returned of (display dialog "Job Number:" default answer "")
set jobName to text returned of (display dialog "Job Name:" default answer "")
set folderpath to (choose folder with prompt "Choose Folder Structure Location" default location default_path)
set newJobFolder to my newFold(jobNum, jobName, folderpath)
on newFold(theNumber, theName, thefolder)
	set subNameList to {"Audio-Music", "Audio-SFX", "Audio-VO", "Client-Info", "Client-Logo", "Compressor", "DVD Builds", "Exports", "Graphics-AE", "Graphics-C4D", "Graphics-Motion", "Graphics-PS", "Graphics-QT", "Images", "Rushes"}
	set itemCount to count of subNameList
	tell application "Finder"
		set newJobFolder to (make new folder at thefolder with properties {name:theNumber & " - " & theName})
		repeat with i from 1 to itemCount
			set thisFolder to make new folder at newJobFolder with properties {name:"" & item i of subNameList}
			if item i of subNameList contains "Graphics-AE" then
				make new folder at thisFolder with properties {name:"Projects"}
				make new folder at thisFolder with properties {name:"Renders"}
			end if
			if item i of subNameList contains "Graphics-Motion" then
				make new folder at thisFolder with properties {name:"Projects"}
				make new folder at thisFolder with properties {name:"Renders"}
			end if
			if item i of subNameList contains "Graphics-C4D" then
				make new folder at thisFolder with properties {name:"Projects"}
				make new folder at thisFolder with properties {name:"Renders"}
			end if
		end repeat
		make new folder at "Macintosh HD:Users:admin:Dropbox:Final Cut Pro Projects" with properties {name:theNumber & " - " & theName}
	end tell
end newFold
