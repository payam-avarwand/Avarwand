# A Back (Avarwand Back)

A user-friendly, Python-based backup and restore solution for Windows, designed to securely archive and restore essential user data including documents, browser favorites, and application-specific data from Microsoft Outlook, Word, and major browsers. With an intuitive graphical interface, it creates compressed ZIP backups with detailed logging and ensures data integrity through process verification and storage space checks.

## Supported Data Paths

- **Microsoft Edge Favorites**: `C:\Users\<USERNAME>\AppData\Local\Microsoft\Edge\User Data\Default\Bookmarks`
- **Internet Explorer**: `C:\Users\<UserName>\Favorites`
- **Firefox Bookmarks**: `C:\Users\<UserName>\AppData\Roaming\Mozilla\Firefox\Profiles\*\bookmarkbackups`
- **Outlook Signatures**: `C:\Users\<UserName>\AppData\Roaming\Microsoft\Signatures`
- **Outlook Additional Mailboxes**: `C:\Users\<UserName>\AppData\Local\Microsoft\Outlook`
- **Word User Dictionaries**: `C:\Users\<UserName>\AppData\Roaming\Microsoft\UProof`
- **MS Word AutoText**: `C:\Users\<UserName>\AppData\Roaming\Microsoft\Templates`

## Usage

1. **Backup Process**:
   - Select the folders and data types to backup
   - Choose destination path for the ZIP archive
   - Monitor progress through the detailed logging interface
2. **Restore Process**:
   - Select a previously created backup ZIP file
   - Choose restore location
   - Follow the guided restore procedure

## Technical Details

- **Platform**: Windows (optimized for user profiles and application data)
- **Backend**: Uses robocopy for efficient file operations
- **Compression**: ZIP archive format with embedded log files
- **Dependencies**: Pillow, psutil, pyperclip (auto-installed if missing)
- **Log Location**: `D:/A Back/Avarwand_Sicherung_Debug_[Date-Time].log` or Desktop fallback

## System Requirements

- Windows operating system
- Python 3.x
- Sufficient storage space for backup operations
- Administrative privileges for full functionality


## Common Issues

- **Insufficient Space**: Verify adequate free space before backup/restore
- **Process Conflicts**: Application will warn about locked files from running processes
- **Path Issues**: Default paths assume standard Windows user profile structure

## Logging

The application maintains comprehensive logs including:
- Operation start/end times
- Files processed and skipped
- Error messages and warnings
- Storage space verification
- Temporary file cleanup status

## Code Features

- **Intuitive Interface**: Clean Tkinter-based GUI for easy backup and restore management
- **Comprehensive Data Coverage**: Backs up Documents, Pictures, Downloads, Desktop, Music, Videos, and application data
- **Browser Support**: Microsoft Edge favorites, Internet Explorer, Firefox bookmarks
- **Microsoft Office Data**: Outlook signatures, additional mailboxes, Word user dictionaries, and AutoText templates
- **Smart Process Checking**: Verifies running processes and available storage before operations
- **Detailed Logging**: Comprehensive debug logs with timestamps for all operations
- **Automatic Cleanup**: Robust temporary file cleanup for clean operations
- **Administrative Checks**: Ensures proper permissions for reliable operation

## Contributing

This is a project released as freeware. While primarily maintained by the author, suggestions and feedback are welcome via email.

## License

This software is released as freeware under the following terms:

**END USER LICENSE AGREEMENT (EULA)**

This software is provided by **P. Avarwand**, free of charge for personal and commercial use.

By installing or using this software, you agree to:
- Use the software in compliance with the EULA
- Not reverse engineer, decompile, or modify the software
- Not redistribute or claim ownership of the software
- Accept the software "as is" without warranties

*For full EULA terms, see the LICENSE file in the distribution.*

---

**Developed by Payam Avarwand**  
**Initial Release: August 2025**  
**Last Updated: September 2025**

## Contact

**Payam Avarwand**  
payam_avar@yahoo.com

© 2025 Payam Avarwand. All rights reserved.