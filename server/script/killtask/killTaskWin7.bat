@echo off
if "%1" == "" (
    echo Please specify the task name to kill as a command line argument.
    exit /b 1
)

set TASK_NAME=%1

echo Killing task %TASK_NAME%...

taskkill /f /im %TASK_NAME%

echo Task %TASK_NAME% killed successfully.

exit /b 0
