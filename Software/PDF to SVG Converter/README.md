# PDF to SVG Converter

An offline, user-friendly Python-based tool for Windows designed to convert PDF files into SVG format with a simple graphical interface. Users can easily select a PDF file, start the conversion with a single click, and track progress through a built-in progress bar. Each page of the PDF is exported as a separate SVG file with accurate vector rendering.

## Supported Data

- **Input**: PDF documents (`*.pdf`)  
- **Output**: SVG vector files (`*.svg`)  
- **Page Handling**: Each PDF page is saved as an individual SVG file  
- **Progress Display**: Real-time progress bar during conversion  
- **Output Folder**: Automatically created next to the selected PDF file

## Usage

1. **Convert PDF to SVG**:  
   - Click **"Click to Select PDF File"** and choose a PDF file.  
   - Click **"Convert to SVG"** to begin conversion.  
   - The program creates a new folder (e.g., `DocumentName_SVGs`) containing the resulting SVG files.  
   - When complete, a popup confirms total pages and output location.

2. **Exit Application**:  
   - Click **"Exit"** to close the tool.

## Technical Details

- **Platform**: Windows (tested with Python 3.13)  
- **Backend**: Python 3 with Tkinter GUI  
- **PDF Processing**: PyMuPDF (`fitz`) for extracting page content as SVG  
- **GUI**: Clean, centered window with clear status updates  
- **Dependencies**: Automatically installs PyMuPDF and Pillow if missing  
- **Error Handling**: Displays user-friendly messages for failed conversions or missing dependencies  
- **Performance**: Converts multi-page PDFs efficiently with progress feedback

## System Requirements

- Windows operating system  
- Python 3.x installed  
- Sufficient disk space for generated SVG files  
- Permissions to create files in the target directory

## Common Issues

- **Missing Dependencies**: The script will automatically install PyMuPDF and Pillow if not found.  
- **Permission Errors**: Ensure you have write access to the output folder.  
- **Corrupted PDFs**: Damaged PDF files may not convert properly.

## Code Features

- **Automatic Dependency Setup**: Ensures required packages are installed at runtime.  
- **Safe Import Handling**: Removes old `fitz` installations to avoid version conflicts.  
- **Modern GUI**: Tkinter-based, clean, and centered layout with Segoe UI font.  
- **Progress Feedback**: Conversion progress shown via determinate progress bar.  
- **Temporary Icon Management**: Application icon loaded from Base64, stored in a hidden temp file, and deleted automatically on exit.  
- **Error Resilience**: Graceful handling of exceptions during installation and conversion.

## Contributing

This project is released as freeware. Although primarily maintained by the author, suggestions and feedback are welcome.  
If you find bugs or have feature requests, please contact the author via email.

## License

This software is released as freeware under the following terms:

**END USER LICENSE AGREEMENT (EULA)**

This software is provided by **P.Avarwand**, free of charge for personal or internal business use.

By installing or using this software, you agree to:  
- Use the software in compliance with the EULA  
- Not reverse engineer, decompile, or modify the software  
- Not redistribute or claim ownership of the software  
- Accept the software "as is" without warranties  

*For full EULA terms, see the LICENSE.txt file included in this distribution.*

---

**Developed by Payam Avarwand**  
**Initial Release: October 2025**  
**Last Updated: October 2025**

## Contact

**Payam Avarwand**  
payam_avar@yahoo.com

© 2025 Payam Avarwand. All rights reserved.
