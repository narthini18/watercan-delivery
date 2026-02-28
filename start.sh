#!/bin/bash
# ============================================
# AquaDelivery — Water Can System
# Local Start Script
# ============================================

echo ""
echo "  💧 AquaDelivery — Water Can System"
echo "  ===================================="
echo ""

# Install dependencies
echo "  Installing dependencies..."
pip install -r requirements.txt -q

echo ""
echo "  ✅ Starting server..."
echo ""
echo "  ┌─────────────────────────────────────────┐"
echo "  │  🌐 App URL: http://localhost:5000       │"
echo "  │                                         │"
echo "  │  📱 Share this on WiFi:                 │"

# Get local IP
LOCAL_IP=$(hostname -I 2>/dev/null | awk '{print $1}' || ipconfig getifaddr en0 2>/dev/null)
if [ -n "$LOCAL_IP" ]; then
    echo "  │  http://$LOCAL_IP:5000"
fi

echo "  │                                         │"
echo "  │  👤 Demo Logins:                        │"
echo "  │  Customer: customer1 / pass123          │"
echo "  │  Worker:   worker1   / pass123          │"
echo "  │  Owner:    owner     / admin123         │"
echo "  └─────────────────────────────────────────┘"
echo ""
echo "  Press Ctrl+C to stop"
echo ""

export FLASK_ENV=development
python app.py
