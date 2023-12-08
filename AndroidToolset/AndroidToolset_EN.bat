@echo off
cd PlatformTools\

set zero=..\
set base=..\0\
set baseWhatsapp=..\0\Android\media\com.whatsapp\
set baseWhatsapp2=..\0\Android\media\com.whatsapp\WhatsApp\
set copyToDevice=..\CopyToDevice\
set images=..\Images\

if not exist %base% (
  mkdir %base% 
)
if not exist %baseWhatsapp% (
  mkdir %baseWhatsapp% 
)
if not exist %baseWhatsapp2% (
  mkdir %baseWhatsapp2% 
)
if not exist %copyToDevice% (
  mkdir %copyToDevice% 
)
if not exist %images% (
  mkdir %images% 
)

echo Welcome to AndroidToolset. Please connect the device to PC.
pause
echo.

:introduction
set /p firstTime=Have you ever used ADB commands before on the device? (Y/N) = 

if %firstTime% equ Y (
   echo.
   goto checkDeviceConnection
) else if %firstTime% equ y (
   echo.
   goto checkDeviceConnection
) 

if %firstTime% equ N (
   echo.
   goto checkDebugUSB
) else if %firstTime% equ n (
   echo.
   goto checkDebugUSB
) else (
   echo Character not valid.
   echo.
   goto introduction
)

:checkDebugUSB
set /p debugUSB=Is "Debug USB" enabled on the device? (Y/N) = 

if %debugUSB% equ Y (
   echo.
   goto checkDeviceAuth
) else if %debugUSB% equ y (
   echo.
   goto checkDeviceAuth
) 

if %debugUSB% equ N (
   echo Please enable "Debug USB" option in "Developer Settings" to go ahead.
   echo.
   goto checkDebugUSB
) else if %debugUSB% equ n (
   echo Please enable "Debug USB" option in "Developer Settings" to go ahead.
   echo.
   goto checkDebugUSB
) else (
   echo Character not valid.
   echo.
   goto checkDebugUSB
)

:checkDeviceAuth
adb devices
echo If not already done before, please authorize PC via the popup displayed on the device.
pause
echo.
adb devices

set /p deviceAuth=Is listed device authorized? (Y/N) = 

if %deviceAuth% equ Y (
   echo.
   goto starting
) else if %deviceAuth% equ y (
   echo.
   goto starting
) 

if %deviceAuth% equ N (
   goto showAuthPopup
) else if %deviceAuth% equ n (
   goto showAuthPopup
) else (
   echo Character not valid.
   echo.
   goto checkDeviceAuth
)

:showAuthPopup
echo Trying to show on the device the popup to authorize PC again.
echo If the popup doesn't appear, please check authorization from the device manually.
echo.
adb shell exit
goto checkDeviceAuth

:checkDeviceConnection
adb devices

:starting
echo Please enter the number of the operation to be done on the device:
echo (1) - Uninstall an app
echo (2) - Extract data
echo (3) - Restore extracted data
echo (4) - Copy files to device Documents folder
echo (5) - Obtain root permissions
echo (6) - Try to restore NFC toggle
echo (7) - Close AndroidToolset
echo.
set /p operationNumber=Operation number: 

if %operationNumber% equ 1 (
   echo.
   goto uninstallApps
) else if %operationNumber% equ 2 (
   echo.
   goto saveData
) else if %operationNumber% equ 3 (
   echo.
   goto restoreData
) else if %operationNumber% equ 4 (
   echo.
   goto copyData
) else if %operationNumber% equ 5 (
   echo.
   goto getRoot
) else if %operationNumber% equ 6 (
   echo.
   goto enableNFC
) else if %operationNumber% equ 7 (
   echo.
   goto exit  
) else (
   echo Number not valid.
   echo.
   goto starting
)

:uninstallApps
echo List of common preinstalled apps:
echo (1) - Android Accessibility Suite
echo (2) - Android Digital Wellbeing
echo (3) - Google Android Auto
echo (4) - Google Chrome
echo (5) - Google Drive
echo (6) - Google Safety Hub
echo (7) - Google App
echo (8) - Google Keep
echo (9) - Google Pixel Ambient Services
echo (10) - Google Pixel Buds
echo (11) - Google Pixel Live Wallpaper
echo (12) - Google Pixel Stand
echo (13) - Google Play Video
echo (14) - Youtube
echo (15) - Youtube Music
echo.
echo List of other possible preinstalled apps:
echo (16) - Google Documents
echo (17) - Google Duo
echo (18) - Google News
echo (19) - Google One
echo (20) - Google Podcasts
echo (21) - Google Tips
echo.
echo If you want to uninstall an app via his package name, type "P".
echo.
set /p appToUninstall=Enter the number of the application to uninstall, 0 to return to the main menu: 

if %appToUninstall% equ 0 (
   echo.
   goto starting
) else if %appToUninstall% equ 1 (
   adb shell pm uninstall -k --user 0 com.google.android.marvin.talkback
) else if %appToUninstall% equ 2 (
   adb shell pm uninstall -k --user 0 com.google.android.apps.wellbeing
) else if %appToUninstall% equ 3 (
   adb shell pm uninstall -k --user 0 com.google.android.projection.gearhead
) else if %appToUninstall% equ 4 (
   adb shell pm uninstall -k --user 0 com.android.chrome
) else if %appToUninstall% equ 5 (
   adb shell pm uninstall -k --user 0 com.google.android.apps.docs
) else if %appToUninstall% equ 6 (
   adb shell pm uninstall -k --user 0 com.google.android.apps.safetyhub
) else if %appToUninstall% equ 7 (
   adb shell pm uninstall -k --user 0 com.google.android.googlequicksearchbox
) else if %appToUninstall% equ 8 (
   adb shell pm uninstall -k --user 0 com.google.android.keep
) else if %appToUninstall% equ 9 (
   adb shell pm uninstall -k --user 0 com.google.intelligence.sense
) else if %appToUninstall% equ 10 (
   adb shell pm uninstall -k --user 0 com.google.android.apps.wearables.maestro.companion
) else if %appToUninstall% equ 11 (
   adb shell pm uninstall -k --user 0 com.google.pixel.livewallpaper
) else if %appToUninstall% equ 12 (
   adb shell pm uninstall -k --user 0 com.google.android.apps.dreamliner
) else if %appToUninstall% equ 13 (
   adb shell pm uninstall -k --user 0 com.google.android.videos
) else if %appToUninstall% equ 14 (
   adb shell pm uninstall -k --user 0 com.google.android.youtube
) else if %appToUninstall% equ 15 (   
   adb shell pm uninstall -k --user 0 com.google.android.apps.youtube.music
) else if %appToUninstall% equ 16 (
   adb shell pm uninstall -k --user 0 com.google.android.apps.docs.editors.docs
) else if %appToUninstall% equ 17 (
   adb shell pm uninstall -k --user 0 com.google.android.apps.tachyon
) else if %appToUninstall% equ 18 (
   adb shell pm uninstall -k --user 0 com.google.android.apps.magazines
) else if %appToUninstall% equ 19 (
   adb shell pm uninstall -k --user 0 com.google.android.apps.subscriptions.red
) else if %appToUninstall% equ 20 (
   adb shell pm uninstall -k --user 0 com.google.android.apps.podcast
) else if %appToUninstall% equ 21 (
   adb shell pm uninstall -k --user 0 com.google.android.apps.tips
) else if %appToUninstall% equ p (
   echo.
   goto UninstallByPackageName
) else if %appToUninstall% equ P (
   echo.
   goto UninstallByPackageName
) else (
   echo Invalid choice.
)
echo.
goto uninstallApps

:UninstallByPackageName
echo If you already know the package name of the app you want to uninstall, type it.
echo Alternately, enter the number of the operation you want to do , 0 to return to the main menu: 
echo (1) - List all package names on the device
echo (2) - List only system package names on the device
echo (3) - List only third party package names on the device
echo (4) - List all package names including uninstalled apps
echo.
set /p doChoice=Enter your choice: 

if %doChoice% equ 0 (
   echo.
   goto starting
) else if %doChoice% equ 1 (
   adb shell pm list packages
) else if %doChoice% equ 2 (
   adb shell pm list packages -s
) else if %doChoice% equ 3 (
   adb shell pm list packages -3
) else if %doChoice% equ 4 (
   adb shell pm list packages -u
) else (
   echo adb shell pm uninstall -k --user 0 %doChoice%
)
echo.
goto UninstallByPackageName

:saveData
echo Which folder do you want to save? Data will be saved in 0 folder.
echo (1) - DCIM
echo (2) - Documents
echo (3) - Downloads
echo (4) - Music
echo (5) - Pictures
echo (6) - Ringtones
echo (7) - WhatsApp [Backups]
echo (8) - WhatsApp [Databases]
echo (9) - WhatsApp [Media]
echo (10) - WhatsApp [All data]
echo (11) - Save everything (may take some time)
echo.
set /p saveCommand=Enter the number of the operation to be performed, 0 to return to the main menu: 

if %saveCommand% equ 0 (
   echo.
   goto starting
)

if %saveCommand% equ 1 (
   adb pull /storage/emulated/0/DCIM %base%
) else if %saveCommand% equ 2 (
   adb pull /storage/emulated/0/Documents %base%
) else if %saveCommand% equ 3 (
   adb pull /storage/emulated/0/Download %base%
) else if %saveCommand% equ 4 (
   adb pull /storage/emulated/0/Music %base%
) else if %saveCommand% equ 5 (
   adb pull /storage/emulated/0/Pictures %base%
) else if %saveCommand% equ 6 (
   adb pull /storage/emulated/0/Ringtones %base%
) else if %saveCommand% equ 7 (
   adb pull /storage/emulated/0/android/media/com.whatsapp/WhatsApp/Backups %baseWhatsapp2%
) else if %saveCommand% equ 8 (
   adb pull /storage/emulated/0/android/media/com.whatsapp/WhatsApp/Databases %baseWhatsapp2%
) else if %saveCommand% equ 9 (
   adb pull /storage/emulated/0/android/media/com.whatsapp/WhatsApp/media %baseWhatsapp2%
) else if %saveCommand% equ 10 (
   adb pull /storage/emulated/0/android/media/com.whatsapp/WhatsApp %baseWhatsapp%
) else if %saveCommand% equ 11 (
	adb pull /storage/emulated/0/DCIM %base%
   adb pull /storage/emulated/0/Documents %base%
   adb pull /storage/emulated/0/Download %base%
   adb pull /storage/emulated/0/Music %base%
   adb pull /storage/emulated/0/Pictures %base%
   adb pull /storage/emulated/0/Ringtones %base%
   adb pull /storage/emulated/0/android/media/com.whatsapp/WhatsApp %baseWhatsapp%
) else (
   echo Number not valid.
)
echo.
goto saveData

:restoreData
echo The files in 0 folder will be restored to the device.
pause
echo.

for %%i in (%base%) do adb push %%i /storage/emulated/
echo.
goto starting

:copyData
echo The files in the CopyToDevice folder will be copied to the Documents folder on the device.
pause
echo.

for %%i in (%copyToDevice%) do adb push %%i /storage/emulated/0/Documents/
echo.
goto starting

:getRoot
set /p confirm=Do you know what are you doing? (Y/N) = 

if %confirm% equ Y (
   echo.
   goto getRoot2
) else if %confirm% equ y (
   echo.
   goto getRoot2
) 

if %confirm% equ N (
   echo.
   goto starting
) else if %confirm% equ n (
   echo.
   goto starting
) else (
   echo Character not valid.
   echo.
   goto getRoot
)

:getRoot2
set /p doubleConfirm=You are about to flash a .img file on the device boot partition, do you want to continue? (Y/N) =  

if %doubleConfirm% equ Y (
   echo.
   goto getRoot3
) else if %doubleConfirm% equ y (
   echo.
   goto getRoot3
) 

if %doubleConfirm% equ N (
   echo.
   goto starting
) else if %doubleConfirm% equ n (
   echo.
   goto starting
) else (
   echo Character not valid.
   echo.
   goto getRoot2
)

:getRoot3
echo Before continuing, please select the file to be flashed.
pause
echo.

for /f "usebackq delims=" %%A in (`powershell -ExecutionPolicy Bypass -File "..\ImageSelector.ps1"`) do set "selectedFile=%%A"
echo Selected file: %selectedFile%
echo.

:getRoot4
echo The device will now reboot into Bootloader mode.
pause
echo.
adb reboot bootloader

:getRoot5
set /p bootloaderConfirm=Is the device in Bootloader mode? (Y/N) = 

if %bootloaderConfirm% equ Y (
   echo.
   goto flashRoot
) else if %bootloaderConfirm% equ y (
   echo.
   goto flashRoot
) 

if %bootloaderConfirm% equ N (
   echo.
   goto getRoot4
) else if %bootloaderConfirm% equ n (
   echo.
   goto getRoot4
) else (
   echo Character not valid.
   echo.
   goto getRoot5
)

:flashRoot
echo Ready to flash file on the device.
pause
echo.
fastboot flash boot %images%\boot.img

echo Operation complete. Proceed to restart your device.
pause
echo.
fastboot reboot
goto starting

:enableNFC
echo List of tiles in dropdown menu:
adb shell "settings get secure sysui_qs_tiles"
echo.

set /p tiles=Please copy and paste previous output:

adb shell "settings put secure sysui_qs_tiles '%tiles%,nfc'"
echo.

:enableNFC2
set /p responseNFC=Is NFC tile in dropdown menu? (Y/N) = 

if %responseNFC% equ Y (
   echo.
   goto enableNFC3
) else if %responseNFC% equ y (
   echo.
   goto enableNFC3
) 

if %responseNFC% equ N (
   echo Can't enable NFC tile on your device.
   pause
   echo.
   goto starting
) else if %responseNFC% equ n (
   echo Can't enable NFC tile on your device.
   pause
   echo.
   goto starting
) else (
   echo Character not valid.
   echo.
   goto enableNFC2
)

:enableNFC3
echo Try to activate NFC tile via command to get it working...
echo System UI could crash now, but don't worry.
pause

adb shell "cmd statusbar click-tile nfc"
echo.

echo If it doesn't work, is not possible to enable NFC tile on your device.
pause
echo.
goto starting

:exit
adb kill-server