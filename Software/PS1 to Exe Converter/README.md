# PS1 to Exe Converter

**PS1 to Exe Converter** is a user-friendly graphical utility that allows you to convert PowerShell scripts (`.ps1`) into standalone Windows executable (`.exe`) files using the `ps2exe` module. No need to open a terminal — the tool walks you through each required input via simple GUI dialogs.


## ⚙️ Features

- 📁 Graphical file selection for `.ps1` and `.ico` files
- 🖼️ Custom icon support
- 🏷️ Set output name, version number, and company metadata
- 🧾 Optional copyright metadata
- 🗃️ Select output folder easily
- ⚠️ Detects and avoids running under PowerShell Core
- 🚀 Output is a portable `.exe` file

---

## 🪟 How to Use

1. **Download** the latest `PS1 to Exe Converter.exe` from the [Releases](https://github.com/payam-avarwand/PS1-to-Exe-Converter/releases/tag/Powershell2Exe) section.
2. **Double-click** the `.exe` file to launch the application.
3. **Follow the GUI prompts** to:
   - Select your `.ps1` script
   - Choose an `.ico` file for the executable icon
   - Enter a name for the output `.exe`
   - Provide a version number (e.g. `1.0.0.0`)
   - Select an output folder
   - (Optionally) enter your company name
4. The tool will invoke `ps2exe` behind the scenes and build the `.exe` file.


---

## 💡 Notes

- This tool generates **portable .exe** files that can run without installing PowerShell scripts.
- The generated executables **do not** embed the full PowerShell runtime, but wrap the `.ps1` script with a launcher.
- If metadata like Product Name or Copyright is missing due to `ps2exe` limitations,
  you can use tools like **Resource Hacker** to post-process.

---

## 📄 License

This software is provided **free of charge** for both personal and commercial use.  
Please read the full [End User License Agreement (EULA)](#end-user-license-agreement-eula) below.

---

## END USER LICENSE AGREEMENT (EULA)

This software, titled **"PS1 to Exe Converter"**, is developed and provided by **Payam Avarwand**, and is distributed free of charge for both personal and commercial use.

By installing, copying, or using this software, you agree to the following terms:

1. **LICENSE GRANT**  
   You are hereby granted a non-exclusive, non-transferable license to install and use this software on your personal or business devices.

2. **RESTRICTIONS**  
   - You may not reverse engineer, decompile, disassemble, or alter any part of this software.  
   - You may not redistribute, sublicense, rent, lease, or sell the software or any of its components.  
   - You may not represent this software as your own or claim any ownership of it.  
   - You may not use this software for unlawful, malicious, or harmful purposes.

3. **OWNERSHIP**  
   All rights, title, and intellectual property associated with this software remain exclusively with **Payam Avarwand**.

4. **DISCLAIMER OF WARRANTY**  
   This software is provided “AS IS”, without warranties of any kind, express or implied, including but not limited to warranties of merchantability or fitness for a particular purpose.  
   Under no circumstances shall the author be held liable for any damages or losses resulting from the use or inability to use this software.

5. **TERMINATION**  
   This license shall terminate automatically if you fail to comply with any of the terms in this agreement. Upon termination, you must cease all use of the software and destroy all copies.

---

© 2025 **Payam Avarwand**. All rights reserved.

---

## 🙋‍♂️ Contact

For feedback, suggestions, or questions, feel free to reach out via [Payam Avarwand](payam_avar@yahoo.com).
