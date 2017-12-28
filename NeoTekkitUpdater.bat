@echo off
:: Set variables.
set batchversion=0.4
set txtUrl=https://github.com/DoctorMacc/NeoTekkitUpdater/raw/master/NeoTekkitVersion.txt
set updUrl=https://github.com/DoctorMacc/NeoTekkitUpdater/raw/master/NeoTekkitUpdaterUpdater.bat
set zipUrl=
set unzipPath="C:\ProgramData\Microsoft\Windows\Start Menu\WinRar.lnk"
title Neo Tekkit Updater v%batchversion%

:: Clean up.
if exist NeoTekkitUpdaterUpdater.bat (del NeoTekkitUpdaterUpdater.bat)

:: Check for an update to the script.
powershell -Command "Invoke-WebRequest %txtUrl% -OutFile NeoTekkitVersion.txt"
set /p version=<NeoTekkitVersion.txt
if not %version%==%batchversion% (powershell -Command "Invoke-WebRequest %updUrl% -OutFile NeoTekkitUpdaterUpdater.bat"
	del NeoTekkitVersion.txt
	echo Updating the updater...
	call NeoTekkitUpdaterUpdater.bat
	exit)
del NeoTekkitVersion.txt

:: Actually update the modpack.
if exist %cd%\NeoTekkit.txt (set /p forge=<NeoTekkit.txt
	set txt=1)
if not exist %cd%\NeoTekkit.txt (echo Drag your Minecraft MODS directory to the prompt.
	set /p forge=[Folder]
	echo.%forge%>NeoTekkit.txt
	set txt=0)
echo Downloading NeoTekkit.zip to %cd%...
powershell -Command "Invoke-WebRequest %zipUrl% -OutFile NeoTekkit.zip"
if not exist %forge%\..\mods_old\ (mkdir %forge%\..\mods_old\)
echo Moving old mods folder to %forge%\..\mods_old...
move %forge%\* %forge%\..\mods_old\
echo Unzipping with WinRAR to %forge%...
%unzipPath% x NeoTekkit.zip *.jar %forge%
del NeoTekkit.zip
echo Done.
if %txt%==0 (echo I created a file called NeoTekkit.txt in %cd%, so the next time you run this program you don't need to show your Minecraft folder as long as this program and the text file are in the same directory.)
pause
