// auth.js
const SERVER_URL = 'http://localhost:3000';

const Auth = {
  // ---------- LOGIN ----------
  async login(email, password) {
    try {
      const res = await fetch(`${SERVER_URL}/login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email, password })
      });
      const data = await res.json();
      if (data.success) {
        // ذخیره در localStorage
        localStorage.setItem('avarwand_token', data.token);
        localStorage.setItem('avarwand_user', JSON.stringify(data.user));
      }
      return data;
    } catch (e) {
      return { success: false, message: 'خطا در اتصال به سرور' };
    }
  },

  // ---------- REGISTER ----------
  async register(email, password, name = '') {
    try {
      const res = await fetch(`${SERVER_URL}/register`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email, password, name })
      });
      return await res.json();
    } catch (e) {
      return { success: false, message: 'خطا در اتصال به سرور' };
    }
  },

  // ---------- LOGOUT ----------
  logout() {
    localStorage.removeItem('avarwand_token');
    localStorage.removeItem('avarwand_user');
    sessionStorage.removeItem('avarwand_token');
    sessionStorage.removeItem('avarwand_user');
  },

  // ---------- وضعیت ----------
  isLoggedIn() {
    return !!localStorage.getItem('avarwand_token');
  },

  getCurrentUser() {
    const u = localStorage.getItem('avarwand_user');
    return u ? JSON.parse(u) : null;
  },

  // تابع جدید برای بررسی وضعیت احراز هویت
  checkAuthStatus() {
    const token = localStorage.getItem('avarwand_token');
    const user = localStorage.getItem('avarwand_user');
    
    return {
      isLoggedIn: !!(token && user),
      currentUser: user ? JSON.parse(user) : null
    };
  }
};