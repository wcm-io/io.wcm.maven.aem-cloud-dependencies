@echo off

call groovy ./update-aem-deps.groovy

echo.
if  %ERRORLEVEL% NEQ 0 (
  echo.[91m*** UPDATE FAILED ***[0m
) else (
  echo.[92m*** Update completed successfully. ***[0m
)
echo.

pause
