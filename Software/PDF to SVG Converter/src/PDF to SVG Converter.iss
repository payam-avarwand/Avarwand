#define MyAppName "PDF to SVG Converter"
#define MyAppVersion "1.2"
#define MyAppPublisher "Avarwand"
#define MyAppURL "https://github.com/payam-avarwand/PDF-to-SVG-Converter"
#define MyAppExeName "PDF to SVG Converter 1.2 Portable.exe"
#define MyAppIcon "C:\temp\pdf2svg.ico"
#define MyVbsLauncher "PDF to SVG Converter_Launcher.vbs"
#define MyAppIconName "pdf2svg.ico"
#define MyAppFileVersion "1.2.3.6"

[Setup]
AppId={{PDF_to_SVG_Converter.com.yahoo@Avar_Payam}
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
UninstallDisplayIcon={app}\lib\{#MyAppIconName}
OutputDir="C:\temp"
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
Source: "C:\temp\PDF to SVG Converter 1.2 Portable\PDF to SVG Converter 1.2 Portable.exe"; DestDir: "{app}\lib"; Flags: ignoreversion
Source: "{#MyAppIcon}"; DestDir: "{app}\lib\_internal"; Flags: ignoreversion

; Install _internal under the lib folder
Source: "C:\temp\PDF to SVG Converter 1.2 Portable\_internal\*"; DestDir: "{app}\lib\_internal"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
; VBS launcher
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyVbsLauncher}"; IconFilename: "{app}\lib\_internal\{#MyAppIconName}"
Name: "{autodesktop}\{#MyAppName} {#MyAppVersion}"; Filename: "{app}\{#MyVbsLauncher}"; Tasks: desktopicon; IconFilename: "{app}\lib\_internal\{#MyAppIconName}"

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
      'exePath = appPath & "\lib\{#MyAppExeName}"' + #13#10 +
      'If fso.FileExists(exePath) Then' + #13#10 +
      '  shell.Run Chr(34) & exePath & Chr(34), 1, False' + #13#10 +
      'Else' + #13#10 +
      '  MsgBox "Executable not found: " & exePath, vbCritical, "Error"' + #13#10 +
      'End If';

    SaveStringToFile(VbsPath, VbsContent, False);

    // make the script hide and read-only
    Exec('cmd.exe', '/C attrib +h +r +s "' + ExpandConstant('{app}\lib\{#MyAppExeName}') + '"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    // Protect all files in the lib folder
    Exec('cmd.exe', '/C attrib +h +r +s "' + ExpandConstant('{app}\lib\*.*') + '" /S', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    // Protect the lib folder itself
    Exec('cmd.exe', '/C attrib +h +r +s "' + ExpandConstant('{app}\lib') + '"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);

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



