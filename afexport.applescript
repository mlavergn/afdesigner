-- activate AffinityDesigner
on appActivate(appX)
	tell application appX
		activate
	end tell
end appActivate

-- trigger the Export menu
on exportMenu(appX)
	tell application "System Events"
		tell process appX
			tell menu bar 1
				tell menu bar item "File"
					tell menu "File"
						click menu item 20
					end tell
				end tell
			end tell
		end tell
	end tell
end exportMenu

-- set export settings
on exportSettings(appX, sizeX)
	tell application "System Events"
		tell process appX
			keystroke "	" & sizeX & "	"
		end tell
	end tell
end exportSettings

-- trigger the Export button
on exportButton(appX)
	tell application "System Events"
		tell process appX
			click UI element "Export" of sheet 1 of window 1
		end tell
	end tell
end exportButton

-- set the SaveAs name
on saveAs(appX, nameX, sizeX)
	tell application "System Events"
		tell process appX
			click text field 1 of sheet 1 of window 1
			keystroke nameX & "-" & sizeX
		end tell
	end tell
end saveAs

-- trigger the Save button
on saveButton(appX)
	tell application "System Events"
		tell process appX
			click UI element "Save" of sheet 1 of window 1
		end tell
	end tell
end saveButton

-- trigger the Replace button
on replaceButton(appX)
	tell application "System Events"
		tell process appX
			click UI element "Replace" of sheet 1 of sheet 1 of window 1
		end tell
	end tell
end replaceButton

-- export a specified image size
on exportSize(appX, nameX, sizeX)
	appActivate(appX)
	delay 1
	exportMenu(appX)
	delay 1
	exportSettings(appX, sizeX)
	delay 1
	exportButton(appX)
	delay 1
	saveAs(appX, nameX, sizeX)
	delay 1
	saveButton(appX)
	delay 1
	replaceButton(appX)
	delay 1
end exportSize

-- export app icons
on exportAppIcons(appX, nameX, sizesX)
	repeat with sizeX in sizesX
		exportSize(appX, nameX, sizeX)
	end repeat
end exportAppIcons

-- export status bar icons
on exportStatusBarIcon(appX, nameX)
	appActivate(appX)
	delay 1
	exportMenu(appX)
	delay 1
	exportButton(appX)
	delay 1
	saveAs(appX, nameX, "StatusBar")
	delay 1
	saveButton(appX)
	delay 1
	replaceButton(appX)
	delay 1
end exportStatusBarIcon

-- utility main
on run argv
	set appX to "Affinity Designer"
	local nameX
	local opt
	if (count of argv is equal to 2) then
		set nameX to item 1 of argv
		set opt to item 2 of argv
	else
		set nameX to "BluJ"
		set opt to "app"
	end if
	if (opt is equal to "status") then
		exportStatusBarIcon(appX, nameX)
	else
		set sizesX to {16, 32, 64, 128, 256, 512}
		exportAppIcons(appX, nameX, sizesX)
	end if
end run

