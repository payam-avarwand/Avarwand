# Avarwand PWE (Persian Wikipedia Editor)

A professional, Python-based tool designed for automating and improving content editing on **Persian Wikipedia Articles**. With an intuitive graphical interface, it provides rule-based text corrections, category management, and page content cleanup for maintaining linguistic and formatting consistency across Persian Wikipedia articles.

---

## Main Features
- **Smart Text Correction**: Automatically standardizes Persian grammar, spelling, and half-spaces using regex-based rules.
- **Category Management**: Detects, adds, and validates Wikipedia categories related to geography, literature, and Iranian studies.
- **Pywikibot Integration**: Securely connects to Persian Wikipedia using Pywikibot for page read/write operations.
- **Custom Rule Editing**: Built-in GUI for creating, editing, cloning, and testing new language normalization rules.
- **Unicode Support**: Fully supports UTF-8 Persian text, diacritics, and zero-width non-joiners.
- **Safe Config Handling**: Automatically saves and manages configuration files, including user credentials and JSON rule sets.
- **Multi-threaded Operations**: Performs background updates without freezing the interface.
- **GUI Built with Tkinter**: User-friendly design optimized for Persian right-to-left layout and Tahoma font readability.

---

## System Requirements
- **Operating System**: Windows (recommended) or Linux (with GUI support)
- **Python Version**: 3.9 or later
- **Dependencies**:
  - `pywikibot`
  - `tkinter` (standard in Python)
  - `json`, `re`, `threading`, and other standard libraries
  *(All dependencies are included with Python or installed automatically)*

---

## Installation
1. Copy the program folder to a desired location on your system (e.g., `C:\Users\YourUsername\WikiEditor`).
2. In the `requirements` folder, extract and run `Pywikibot_initiator.exe`.
3. When prompted with "Enter config path," copy and paste the path to the `support` folder (e.g., `C:\Users\YourUsername\WikiEditor\support`) and press Enter.
4. Enter your Wikipedia username.
5. If prompted for your Wikipedia account password, provide it; otherwise, press Enter to exit.
6. Run `initialization.bat` (located in the program folder) for the first execution to set up configurations.
7. The `user-config.py` file will be created in the `support` folder. Ensure it is correctly imported by the program.
8. For the "Rules" (`rls.json`) and "Category List" files, you can:
   - Create default files via the GUI.
   - Or use pre-existing files from the `DB` folder in the program directory.
9. Optionally, create a desktop shortcut using `Run_Persian_Wiki_Editor.bat` (see **Usage** section).

---

## Usage
1. **Launch the Application**:
   - Run `Persian Wikipedia Editor.py` directly with Python 3.x: `python "Persian Wikipedia Editor.py"`.
   - Alternatively, double-click `Run_Persian_Wiki_Editor.bat` (in the program folder) to launch via Command Prompt.
   - For convenience, create a desktop shortcut for the `.bat` file and assign a custom icon (e.g., `wiki_icon.ico` in the program folder).
2. **Configure Pywikibot**:
   - On first startup, select or create the `user-config.py` file for authentication.
   - If prompted for a password during editing, enter it in the command-line console behind the GUI.
3. **Manage Rules**:
   - Open the "Rule Manager" from the GUI.
   - Add, edit, or clone normalization rules (e.g., replacing "تامین" with "فراهم" unless followed by specific words).
   - Save changes to update the `rls.json` file.
4. **Manage Categories**:
   - Use the "Category Manager" to add, edit, or delete categories.
   - Select a category number to process all articles within it.
5. **Process Wikipedia Pages**:
   - Connect to Persian Wikipedia (`fa.wikipedia.org`).
   - Choose a mode: single page, multiple pages, or category-based editing.
   - Apply correction rules and review changes in the GUI.
   - Save edits with a custom summary or the default ("ابرابزار").

---

## Logging and Configuration
- **Configuration File**: `config.json` (auto-managed in the program folder).
- **Rule File**: `rls.json` (user-defined rules in the program folder or `support`).
- **Category File**: Custom category list file (default or imported from `DB` folder).
- **Temporary Files**: Managed in the system temp directory and cleaned up automatically.
- **Logging**: Actions, warnings, and statuses are displayed in the GUI and optionally logged for debugging.

---

## Common Issues
- **Login Errors**:
  - Ensure `user-config.py` is correctly configured with your Wikipedia username in the `support` folder or `%USERPROFILE%\.pywikibot\`.
  - If the password is rejected despite being correct, clear the cache by deleting all files in `support\apicache`.
- **Permission Denied**:
  - Run the program or `Run_Persian_Wiki_Editor.bat` as administrator if file access errors occur.
- **Encoding Issues**:
  - Save all rule and config files in UTF-8 format to avoid Persian text issues.
- **File Not Found**:
  - Verify that `Persian Wikipedia Editor.py` and other required files are in the `support` folder.
- **Icon File**:
  - If using a custom icon (e.g., `wiki_icon.ico`), it can be hidden as a system file using `attrib +h +s "wiki_icon.ico"` and unhidden with `attrib -h -s "wiki_icon.ico"`.

---

## Technical Details
- **Language Support**: Persian (Farsi) with full UTF-8 and zero-width non-joiner support.
- **Automation Layer**: Pywikibot API for Wikipedia interactions.
- **GUI Framework**: Tkinter with right-to-left Persian layout and Tahoma font.
- **Text Processing**: Regex-based normalization rules for Persian grammar and spelling.
- **Directory Structure**:
  - Main script: `Persian Wikipedia Editor.py`
  - Support files: `support` folder (contains `user-config.py`)
  - Database: `DB` folder (optional Edit rule and Category files)
  - Batch launcher: `Run_Persian_Wiki_Editor.bat` (in the main folder)
- **License Type**: Freeware (Avarwand License)

---

## Contributing
This software is released as **freeware** by **Avarwand**. Suggestions, bug reports, and improvement ideas are welcome. To contribute new normalization rules or categories:
- Contact the author via email with your suggestions.
- Test new rules in the GUI’s Rule Manager before submission.
- Ensure rules are compatible with Persian Wikipedia’s style guidelines.

---

## License
This software is released as freeware under the following terms:

**END USER LICENSE AGREEMENT (EULA)**

This software, **Avarwand PWE**, is provided by **Avarwand** and **P. Avarwand**, free of charge for personal and commercial use. By installing or using this software, you agree to:
- Use the software in compliance with the EULA.
- Not reverse engineer, decompile, or modify the software.
- Not redistribute or claim ownership of the software.
- Accept the software "as is" without warranties.

*For full EULA terms, see the LICENSE file in the distribution.*

---

**Developed by Payam Avarwand**  
**Initial Release: July 2025**  
**Last Updated: October 2025**

## Contact
**Payam Avarwand**  
**Email**: payam_avar@yahoo.com  
© 2025 Avarwand. All rights reserved.