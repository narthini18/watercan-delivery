# 💧 AquaDelivery — Water Can Management System

A complete water can delivery management web app with **Customer**, **Worker**, and **Owner** dashboards.  
Built with Flask + SQLite. **PWA-ready** (installable on phones). **Deployment-ready** for cloud hosting.

---

## ✨ Features

| Feature | Details |
|---|---|
| **3 User Roles** | Customer, Worker, Owner — each with own dashboard |
| **Order Management** | Customers place orders; workers mark delivered |
| **Payment Tracking** | Owner records cash/UPI/bank payments per order or in bulk |
| **Payment History** | Customers see all their payment records |
| **Notifications** | In-app alerts on order placed, delivered, payment received |
| **Excel Export** | 4-sheet report: payments, pending, customer summary, all orders |
| **QR Code** | Owner generates QR to share app link on notice board |
| **Add Customers** | Owner adds new residents directly from dashboard |
| **PWA** | Users can "Add to Home Screen" — works like a native app |
| **SQLite Database** | No Excel corruption; handles multiple concurrent users |
| **Mobile Responsive** | Works perfectly on all phone sizes |

---

## 🚀 Option 1: Deploy to Cloud (Recommended)

### Render.com (FREE, Persistent Storage)

1. **Create GitHub repo** → upload all these files
2. Go to [render.com](https://render.com) → Sign Up (free)
3. Click **"New +"** → **"Web Service"**
4. Connect your GitHub repo
5. Render auto-detects `render.yaml` — just click **Deploy**
6. Your app is live at: `https://your-app-name.onrender.com`
7. Share that link with all residents! 🎉

> ⚠️ Free tier sleeps after 15min inactivity (first load takes ~30s). Upgrade to $7/month for always-on.

---

### Railway.app ($5/month, Always On)

1. Go to [railway.app](https://railway.app) → Login with GitHub
2. **"New Project"** → **"Deploy from GitHub repo"**
3. Select your repo → Railway reads `railway.json` automatically
4. Add environment variables:
   - `SECRET_KEY` = any random string (e.g. `mySecretKey2024abc`)
   - `PRICE_PER_CAN` = `50`
5. Click **Deploy** → Get permanent URL instantly
6. Share the URL via WhatsApp group!

---

## 💻 Option 2: Run Locally (Same WiFi Network)

### Mac / Linux
```bash
cd watercan_v3
chmod +x start.sh
./start.sh
```

### Windows
```
Double-click start.bat
```

Then find your local IP:
- **Windows**: Open CMD → type `ipconfig` → look for "IPv4 Address" (e.g. `192.168.1.5`)
- **Mac**: System Preferences → Network → Advanced → TCP/IP
- **Linux**: `hostname -I`

Share `http://192.168.1.5:5000` with everyone on the same WiFi.

---

## 📱 PWA Installation (Add to Home Screen)

Once the app is hosted online:

**Android (Chrome):**
1. Open the app URL in Chrome
2. Tap the ⋮ menu → "Add to Home screen"
3. Tap "Add" → App icon appears on home screen ✅

**iPhone (Safari):**
1. Open the app URL in Safari
2. Tap the Share button (box with arrow)
3. Scroll down → "Add to Home Screen" → "Add" ✅

A banner will also automatically appear prompting installation.

---

## 🏠 Sharing the App

### Method 1: WhatsApp Link
Simply send your deployment URL in the building WhatsApp group.

### Method 2: QR Code (Best for Notice Board)
1. Login as owner
2. Click **"Get App QR Code"** in sidebar
3. Download the QR image
4. Print and paste on building notice board / elevator

### Method 3: Local Network
If everyone is on the same WiFi (apartment building):
- No internet needed
- Run the app on a PC that stays on 24/7
- Share local IP link

---

## 👥 Default Login Credentials

| Role | Username | Password |
|------|----------|----------|
| Customer | customer1 | pass123 |
| Customer | customer2 | pass123 |
| Worker | worker1 | pass123 |
| Owner | owner | admin123 |

**To add new customers:**
- Login as owner → Sidebar → "Add Customer" → Fill form → Done
- Customer can login immediately

**To change passwords:**
- Open `instance/watercan.db` with DB Browser for SQLite
- Or add a "Change Password" endpoint (future feature)

---

## ⚙️ Environment Variables

| Variable | Default | Description |
|---|---|---|
| `SECRET_KEY` | Built-in | Flask session secret — change in production! |
| `PRICE_PER_CAN` | `50` | Price per water can in ₹ |
| `PORT` | `5000` | Server port |
| `FLASK_ENV` | `production` | Set to `development` for debug mode |

---

## 🗄️ Database

- Uses **SQLite** stored at `instance/watercan.db`
- Auto-created on first run — no setup needed
- On **Render**: use the persistent disk (configured in `render.yaml`)
- On **Railway**: data persists on the volume
- **Backup**: Just download the `watercan.db` file periodically

### Tables
- `users` — All user accounts (customers, workers, owner)
- `orders` — Every order placed
- `payments` — Every payment recorded
- `notifications` — In-app notifications

---

## 📁 File Structure

```
watercan_v3/
├── app.py                 # Main Flask application
├── requirements.txt       # Python dependencies
├── Procfile              # For Render/Heroku/Railway
├── render.yaml           # Render.com auto-deploy config
├── railway.json          # Railway.app config
├── start.sh              # Local start (Mac/Linux)
├── start.bat             # Local start (Windows)
├── README.md             # This file
├── instance/
│   └── watercan.db       # SQLite database (auto-created)
├── templates/
│   ├── base.html         # Shared layout with sidebar + PWA
│   ├── login.html        # Login page
│   ├── customer_dashboard.html
│   ├── worker_dashboard.html
│   └── owner_dashboard.html
└── static/
    ├── css/style.css     # All styles
    └── icons/            # PWA app icons (add your own)
```

---

## 🔒 Security Notes for Production

1. **Change SECRET_KEY**: Set a strong random value as env variable
2. **Change default passwords**: Login as owner → add customers with strong passwords
3. **HTTPS**: Both Render and Railway provide free SSL automatically
4. **Backups**: Download `watercan.db` weekly as backup

---

## 🆘 Troubleshooting

**App won't start?**
```bash
pip install -r requirements.txt
python app.py
```

**Database issues?**
```bash
rm instance/watercan.db  # Delete and let it recreate
python app.py
```

**Can't access from other devices on WiFi?**
- Check firewall allows port 5000
- Use `0.0.0.0:5000` not `localhost:5000` when sharing

---

Built with ❤️ using Flask, SQLite, and vanilla JS.
