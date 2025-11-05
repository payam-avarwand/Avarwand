# Wiki Tazeh (ویکی تازه)

**Wiki Tazeh** is a Windows desktop application that lets you explore newly created articles on the Persian (Farsi) Wikipedia using an intuitive graphical interface. It fetches real-time data from the Wikipedia API based on user-defined date ranges and provides powerful filtering and sorting capabilities.


## 🖥️ Features

- 🔍 Search new Wikipedia articles by date range
- 🧑 Filter results by creator (user)
- 📝 Filter by article title
- 📅 Sort by title, user, creation time, or link
- 📄 Paginated display (100 results per page)
- 🌐 Open articles in your web browser by double-clicking
- 🇮🇷 Fully localized Persian interface
- ✅ No installation of Python required (Windows `.exe` included)

---

## 🚀 How to Use

1. **Download and extract** the latest release (`Wiki Tazeh.exe`) from the [Releases](https://github.com/payam-avarwand/Wiki-Tazeh/releases/tag/Persian_Wikipedia) section.
2. **Double-click** the executable to launch the application.
3. **Enter date range** in `YYYY-MM-DD` format and click **جستجو** (Search).
4. **Use filters** to search by article creator or title.
5. **Navigate pages** using the control buttons
6. **Double-click** any result to open the corresponding Wikipedia article in your browser.

---

## 📦 Requirements

If you are using the source code instead of the `.exe`, make sure you have Python 3.8+ and the following libraries installed:

```bash
pip install pillow requests
