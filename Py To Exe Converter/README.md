# Py To Exe Converter
It is a free, simple and user-friendly GUI application that allows you to convert your Python scripts (`.py`) into
standalone Windows executables (.exe) using PyInstaller. It is designed for developers, students, and
enthusiasts who want to package their Python scripts into single-file executables with custom metadata and icons.

---


## Features

- Convert `.py` files to `.exe` in one click
- Set metadata such as:
  - Company Name
  - File Description
  - File Version
  - Internal Name
- Choose a custom `.ico` icon file
- Clean and simple interface with progress tracking
- Automatically generates a hidden version file for PyInstaller



## Requirements

Before running this software, ensure the following are set up on your system:

1. **Python must be downloaded and installed necessarily from** [www.python.org](https://www.python.org/)**, because it:**
  - Uses normal, unrestricted folders (like `C:\Users\YourName\AppData\Local\Programs\Python\Python312`)
  - Works out-of-the-box with PyInstaller
  - Allows `--add-data` to copy `Tcl`/`Tk` folders without issue
<br>

2. **PyInstaller must be installed**  
   Install it using pip:  
   ```bash
   pip install pyinstaller

3. **Python path must be added to the system PATH**
    It should be like `C:\Users\<YourName>\AppData\Local\Programs\Python\Python312\Scripts`



## Output

The final executable file will be saved in a folder named "dist", beside the original .py with such a filename format:
`<Internal Name> <Product Version> Portable.exe`


## License

This software is released as freeware.
Feel free to use, share, and distribute it for personal or commercial use.
© 2025 Avarwand


## Contact

Developed by Payam Avarwand,	01.06.2025_
For questions or contributions, feel free to reach out.