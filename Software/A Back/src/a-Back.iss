#define MyAppName "A Back"
#define MyAppVersion "1.2"
#define MyAppPublisher "Avarwand"
#define MyAppURL "https://github.com/payam-avarwand/A-Back"
#define MyAppExeName "A Back.exe"
#define MyAppIcon "C:\temp\aback.ico"
#define MyVbsLauncher "A Back_Launcher.vbs"
#define MyAppIconName "aback.ico"
#define MyAppFileVersion "1.2.0.85"

[Setup]
AppId={{A_Back.com.yahoo@Avar_Payam}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
VersionInfoVersion={#MyAppFileVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\Avarwand\{#MyAppName}
DefaultGroupName={#MyAppName}
UninstallDisplayIcon={app}\icons\{#MyAppIconName}
OutputDir="C:\temp\insssss"
OutputBaseFilename={#MyAppName}-{#MyAppVersion}-Setup
SetupIconFile={#MyAppIcon}
SolidCompression=yes
WizardStyle=modern
PrivilegesRequiredOverridesAllowed=dialog
ArchitecturesInstallIn64BitMode=x64

; Added fields
VersionInfoCopyright=©Avarwand

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked


[Files]
Source: "C:\temp\A Back\A Back.exe"; DestDir: "{app}\icons"; Flags: ignoreversion
Source: "{#MyAppIcon}"; DestDir: "{app}\icons\_internal"; Flags: ignoreversion

; Install _internal under the icons folder
Source: "C:\temp\A Back\_internal\*"; DestDir: "{app}\icons\_internal"; Flags: ignoreversion recursesubdirs createallsubdirs



[Icons]
; VBS launcher
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyVbsLauncher}"; IconFilename: "{app}\icons\{#MyAppIconName}"
Name: "{autodesktop}\{#MyAppName} {#MyAppVersion}"; Filename: "{app}\{#MyVbsLauncher}"; Tasks: desktopicon; IconFilename: "{app}\icons\_internal\{#MyAppIconName}"

[Run]
Filename: "{app}\{#MyVbsLauncher}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: shellexec postinstall skipifsilent

[Code]
procedure CurStepChanged(CurStep: TSetupStep);
var
  VbsContent: string;
  VbsPath: string;
  ResultCode: Integer;
begin
  if CurStep = ssPostInstall then
  begin
    VbsPath := ExpandConstant('{app}\{#MyVbsLauncher}');
    VbsContent :=
      'On Error Resume Next' + #13#10 +
      'Set fso = CreateObject("Scripting.FileSystemObject")' + #13#10 +
      'Set shell = CreateObject("WScript.Shell")' + #13#10 +
      'appPath = fso.GetParentFolderName(WScript.ScriptFullName)' + #13#10 +
      'exePath = appPath & "\icons\{#MyAppExeName}"' + #13#10 +
      'If fso.FileExists(exePath) Then' + #13#10 +
      '  shell.Run Chr(34) & exePath & Chr(34), 1, False' + #13#10 +
      'Else' + #13#10 +
      '  MsgBox "Executable not found: " & exePath, vbCritical, "Error"' + #13#10 +
      'End If';

    SaveStringToFile(VbsPath, VbsContent, False);

    // make the script hide and read-only
    Exec('cmd.exe', '/C attrib +h +r +s "' + ExpandConstant('{app}\icons\{#MyAppExeName}') + '"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    // Protect all files in the icons folder
    Exec('cmd.exe', '/C attrib +h +r +s "' + ExpandConstant('{app}\icons\*.*') + '" /S', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    // Protect the icons folder itself
    Exec('cmd.exe', '/C attrib +h +r +s "' + ExpandConstant('{app}\icons') + '"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);

    // Check if VBS file was created
    if not FileExists(VbsPath) then
      MsgBox('Failed to create VBS launcher at: ' + VbsPath, mbError, MB_OK);
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  AppDir: string;
  ResultCode: Integer;
begin
  if CurUninstallStep = usPostUninstall then
  begin
    AppDir := ExpandConstant('{app}');

    // Remove hidden/read-only/system attributes from files first (optional but recommended)
    if FileExists(AppDir + '\{#MyAppExeName}') then
      Exec('cmd.exe', '/C attrib -h -r -s "' + AppDir + '\{#MyAppExeName}"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);

    // Force delete the entire directory and all contents
    if DirExists(AppDir) then
    begin
      Exec('cmd.exe', '/C rmdir /s /q "' + AppDir + '"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    end;
  end;
end;






