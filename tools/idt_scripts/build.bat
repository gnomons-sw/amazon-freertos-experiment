del /Q "%1\projects\renesas\rx65n-rsk\e2studio\aws_tests\HardwareDebug\*.*"

"C:\Renesas\e2_studio_v7_8\eclipse\eclipsec.exe" -nosplash --launcher.suppressErrors -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data %1\temp -import %1\projects\renesas\rx65n-rsk\e2studio\aws_tests\ -cleanBuild all
ECHO Result Code: %ErrorLevel%

:"%1\vendors\renesas\tools\mot_file_converter\Renesas Secure Flash Programmer\bin\Debug\Renesas Secure Flash Programmer.exe" CUI Initial "RX65N(ROM 2MB)/Secure Bootloader=256KB" "sig-sha256-ecdsa" 1 "%1\projects\renesas\rx65n-rsk\e2studio\boot_loader\HardwareDebug\boot_loader.mot" "%1\projects\renesas\rx65n-rsk\e2studio\aws_tests\HardwareDebug\aws_tests.mot" "C:\temp\CERT\ota_setup\secp256r1.privatekey" "%1\projects\renesas\rx65n-rsk\e2studio\aws_tests\HardwareDebug\userprog.mot"
:ECHO Result Code: %ErrorLevel%

:"%1\vendors\renesas\tools\mot_file_converter\Renesas Secure Flash Programmer\bin\Debug\Renesas Secure Flash Programmer.exe" CUI Update "RX65N(ROM 2MB)/Secure Bootloader=256KB" "sig-sha256-ecdsa" 1 "%1\projects\renesas\rx65n-rsk\e2studio\aws_tests\HardwareDebug\aws_tests.mot" "%1\projects\renesas\rx65n-rsk\e2studio\aws_tests\HardwareDebug\userprog.rsu"
:ECHO Result Code: %ErrorLevel%
