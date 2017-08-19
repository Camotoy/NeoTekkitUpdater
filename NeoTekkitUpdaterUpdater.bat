@echo off
powershell -Command "Invoke-WebRequest https://github.com/DoctorMacc/NeoTekkitUpdater/raw/master/NeoTekkitUpdater.bat -OutFile NeoTekkitUpdater.bat"
echo Update complete.
call NeoTekkitUpdater.bat
