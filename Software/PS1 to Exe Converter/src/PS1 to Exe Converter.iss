#define MyAppName "PS1 to Exe Converter"
#define MyAppVersion "1.0"
#define MyAppPublisher "Avarwand"
#define MyAppURL "https://github.com/payam-avarwand/PS1-to-Exe-Converter/releases/tag/Powershell2Exe"
#define MyAppExeName "PS1 to Exe Converter 1.0 - portable.exe"
#define MyAppIcon "D:\Payam Avarwand\My Repos\GitHub\Avarwand\PS1 to Exe Converter\installer\PS1 to Exe Converter.ico"
#define MyVbsLauncher "PS1 to Exe Converter_Launcher.vbs"
#define MyAppIconName "PS1 to Exe Converter.ico"
#define MyAppFileVersion "1.0.0.40"

[Setup]
AppId={{PS1_to_Exe_Converter.com.yahoo@Avar_Payam}
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
OutputDir="D:\Payam Avarwand\My Repos\GitHub\Avarwand\PS1 to Exe Converter\installer"
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
Source: "D:\Payam Avarwand\My Repos\GitHub\Avarwand\PS1 to Exe Converter\installer\PS1 to Exe Converter 1.0 - portable.exe"; DestDir: "{app}\icons"; Flags: ignoreversion
Source: "{#MyAppIcon}"; DestDir: "{app}\icons"; Flags: ignoreversion

[Icons]
; VBS launcher
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyVbsLauncher}"; IconFilename: "{app}\icons\{#MyAppIconName}"
Name: "{autodesktop}\{#MyAppName} {#MyAppVersion}"; Filename: "{app}\{#MyVbsLauncher}"; Tasks: desktopicon; IconFilename: "{app}\icons\{#MyAppIconName}"

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






