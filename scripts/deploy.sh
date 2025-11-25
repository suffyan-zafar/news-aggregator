#!/bin/bash
set -e
cd /var/www/myapp
echo "📥 Pulling latest code..."
git pull origin main
echo "📦 Installing dependencies..."
npm install --production
echo "🔨 Building project..."
npm run build
echo "♻️ Restarting PM2..."
pm2 restart all || pm2 start npm --name "myapp" -- start
echo "✅ Deployment completed!"
