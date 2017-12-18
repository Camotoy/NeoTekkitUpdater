@echo off
set batUrl=https://github.com/DoctorMacc/NeoTekkitUpdater/raw/master/NeoTekkitUpdater.bat
powershell -Command "Invoke-WebRequest %batUrl% NeoTekkitUpdater.bat"
echo Update complete.
call NeoTekkitUpdater.bat
