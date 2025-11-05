# Wikipedia Contribution Finder
A user-friendly tool designed to extract and list all Article titles edited by a specified Wikipedia user in
a specific Time period, supporting both English and Persian Wikipedia.
It filters out non-article edits and sorts contributions chronologically (oldest to newest), saving results to a text file for
easy reference.
Users can customize the date range for analysis, ensuring focused and relevant output.
With an intuitive interface, it simplifies tracking a user's editing history while excluding maintenance
pages and irrelevant changes. Ideal for researchers, editors, and Wikipedia enthusiasts, this tool streamlines
contribution analysis with precision and ease.


## Features

- **User-Friendly Interface**:	Simple and intuitive GUI for easy operation
- **Multi-Language Support**:	Works with both English and Persian Wikipedia
- **Smart Filtering**:			Automatically excludes non-article edits and maintenance pages
- **Date Range Filtering**:		Customizable date range for focused analysis
- **Chronological Sorting**:	Results sorted from oldest to most recent edits
- **Output Management**:		Saves results to organized text files
- **Progress Tracking**:		Visual progress bar and detailed activity log


## Usage

- Run the application
- Enter the Wikipedia username you want to analyze (case sensitive)
- Select the Wikipedia language (English or Persian)
- Set the date range for analysis (optional)
- Choose an output directory (defaults to Desktop)
- Click "Find Contributions" to start the analysis
- Results will be saved in a text file in the format:
	[En/Fa]-[Username]-Titles_[Date].txt

It will be generated as a clean text file containing:
- Only article titles (no maintenance pages or user pages)
- One title per line
- Excludes duplicates and similar non-article edits


## Technical Details

- Fetches user contributions from Wikipedia API
- Parses the HTML response to extract page titles
- Filters out non-article pages using exclusion patterns
- Sorts results chronologically
- Saves to a text file in the specified directory


## Exclusion Patterns

It automatically filters out:
- User talk pages
- Wikipedia maintenance pages
- File uploads and media
- Templates and categories
- Special Wikipedia pages
- Other non-article content


## Common Issues

- User not found: Ensure the username is correct and case-sensitive
- No results: The user may not have made any article edits in the selected date range
- Connection errors: Check your internet connection and firewall settings

## Logging

The application maintains a detailed activity log in the GUI that shows:
- Progress of the analysis
- Any errors encountered
- Summary of results

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for:
- Bug fixes
- New features
- Additional language support
- Documentation improvements


## License

This software is released as freeware.<br>
Feel free to use, share, and distribute it for personal or commercial use.<br>
_Developed by Payam Avarwand,	06.06.2025_ <br>
© 2025 Avarwand

## Contact

payam_avar@yahoo.com