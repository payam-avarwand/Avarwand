const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const csvParser = require('csv-parser');
const createCsvWriter = require('csv-writer').createObjectCsvWriter;
const fs = require('fs');
const path = require('path');
const bodyParser = require('body-parser');
const cors = require('cors');
const { v4: uuidv4 } = require('uuid');

const app = express();
app.use(bodyParser.json());
app.use(cors());

// 🔥 سرو کردن فایل‌های استاتیک (HTML, CSS, JS, تصاویر)
app.use(express.static(path.join(__dirname)));

const USERS_FILE = 'users.csv';
const SECRET_KEY = 'your-secret-key-change-this-in-production'; // ⚠️ حتماً تغییر بده
const SALT_ROUNDS = 10;

// چک وجود فایل CSV
if (!fs.existsSync(USERS_FILE)) {
  fs.writeFileSync(USERS_FILE, 'id,email,hashed_password,name,created\n');
}

// بارگذاری کاربران از CSV
function loadUsers(callback) {
  const users = [];
  fs.createReadStream(USERS_FILE)
    .pipe(csvParser())
    .on('data', (row) => users.push(row))
    .on('end', () => callback(users));
}

// ذخیره کاربر جدید در CSV
const csvWriter = createCsvWriter({
  path: USERS_FILE,
  header: [
    {id: 'id', title: 'id'},
    {id: 'email', title: 'email'},
    {id: 'hashed_password', title: 'hashed_password'},
    {id: 'name', title: 'name'},
    {id: 'created', title: 'created'}
  ],
  append: true
});

// ثبت‌نام
app.post('/register', (req, res) => {
  const { email, password, name = '' } = req.body;
  if (!email || !password) {
    return res.status(400).json({ success: false, message: 'Email and password are required' });
  }

  loadUsers((users) => {
    if (users.find(u => u.email === email)) {
      return res.status(400).json({ success: false, message: 'Email already registered!' });
    }

    bcrypt.hash(password, SALT_ROUNDS, (err, hashedPassword) => {
      if (err) return res.status(500).json({ success: false, message: 'Registration error' });

      const user = {
        id: uuidv4(),
        email,
        hashed_password: hashedPassword,
        name,
        created: new Date().toISOString()
      };

      csvWriter.writeRecords([user])
        .then(() => res.json({ success: true, message: 'Registration successful! Please login.' }))
        .catch(() => res.status(500).json({ success: false, message: 'Save error' }));
    });
  });
});

// ورود
app.post('/login', (req, res) => {
  const { email, password } = req.body;
  if (!email || !password) {
    return res.status(400).json({ success: false, message: 'Email and password are required' });
  }

  loadUsers((users) => {
    const user = users.find(u => u.email === email);
    if (!user) {
      return res.status(400).json({ success: false, message: 'Invalid email or password!' });
    }

    bcrypt.compare(password, user.hashed_password, (err, isMatch) => {
      if (err || !isMatch) {
        return res.status(400).json({ success: false, message: 'Invalid email or password!' });
      }

      const token = jwt.sign({ id: user.id, email: user.email }, SECRET_KEY, { expiresIn: '24h' });
      res.json({ 
        success: true, 
        message: 'Login successful!', 
        token, 
        user: { email: user.email, name: user.name } 
      });
    });
  });
});

// تغییر رمز
app.post('/change-password', (req, res) => {
  const { oldPassword, newPassword } = req.body;
  const token = req.headers.authorization?.split(' ')[1];
  
  if (!token) {
    return res.status(401).json({ success: false, message: 'Token required' });
  }

  try {
    const decoded = jwt.verify(token, SECRET_KEY);
    loadUsers((users) => {
      const userIndex = users.findIndex(u => u.id === decoded.id);
      if (userIndex === -1) {
        return res.status(404).json({ success: false, message: 'User not found' });
      }

      const user = users[userIndex];
      bcrypt.compare(oldPassword, user.hashed_password, (err, isMatch) => {
        if (err || !isMatch) {
          return res.status(400).json({ success: false, message: 'Old password incorrect!' });
        }

        bcrypt.hash(newPassword, SALT_ROUNDS, (err, hashedNewPassword) => {
          if (err) return res.status(500).json({ success: false, message: 'Password change error' });

          users[userIndex].hashed_password = hashedNewPassword;
          
          // بازنویسی کامل CSV
          const tempFile = USERS_FILE + '.tmp';
          const writer = createCsvWriter({ 
            path: tempFile, 
            header: [
              {id: 'id', title: 'id'},
              {id: 'email', title: 'email'},
              {id: 'hashed_password', title: 'hashed_password'},
              {id: 'name', title: 'name'},
              {id: 'created', title: 'created'}
            ]
          });
          
          writer.writeRecords(users)
            .then(() => {
              fs.renameSync(tempFile, USERS_FILE);
              res.json({ success: true, message: 'Password changed successfully' });
            })
            .catch(() => res.status(500).json({ success: false, message: 'Save error' }));
        });
      });
    });
  } catch {
    res.status(401).json({ success: false, message: 'Invalid token' });
  }
});

// Health check
app.get('/health', (req, res) => {
  res.json({ status: 'OK', timestamp: new Date().toISOString() });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`✅ Server running on http://localhost:${PORT}`);
  console.log(`📁 Serving static files from: ${__dirname}`);
});