3@echo off
title Neo Tekkit Updater v0.3

if exist NeoTekkitUpdaterUpdater.bat (del NeoTekkitUpdaterUpdater.bat)

powershell -Command "Invoke-WebRequest http://76.190.144.116/NeoTekkitVersion.txt -OutFile NeoTekkitVersion.txt"
set /p version=<NeoTekkitVersion.txt
if not %version%==0.2 (powershell -Command "Invoke-WebRequest https://github.com/DoctorMacc/NeoTekkitUpdater/raw/master/NeoTekkitUpdaterUpdater.bat -OutFile NeoTekkitUpdaterUpdater.bat"
	del NeoTekkitVersion.txt
	echo Updating the updater...
	call NeoTekkitUpdaterUpdater.bat
	exit)
del NeoTekkitVersion.txt

if exist %cd%\NeoTekkit.txt (set /p forge=<NeoTekkit.txt
	set txt=1)
if not exist %cd%\NeoTekkit.txt (echo Drag your Minecraft MODS directory to the prompt.
	set /p forge=[Folder]
	echo.%forge%>NeoTekkit.txt
	set txt=0)
echo Downloading NeoTekkit.zip to %cd%...
powershell -Command "Invoke-WebRequest http://76.190.144.116/NeoTekkit.zip -OutFile NeoTekkit.zip"
if not exist %forge%\..\mods_old\ (mkdir %forge%\..\mods_old\)
echo Moving old mods folder to %forge%\..\mods_old...
move %forge%\* %forge%\..\mods_old\
echo Unzipping with WinRAR to %forge%...
"C:\ProgramData\Microsoft\Windows\Start Menu\WinRar.lnk" x NeoTekkit.zip *.jar %forge%
del NeoTekkit.zip
echo Done.
if %txt%==0 (echo I created a file called NeoTekkit.txt in %cd%, so the next time you run this program you don't need to show your Minecraft folder as long as this program and the text file are in the same directory.)
pause
