#!/bin/bash
set -e # Exit on any error.

echo "🚀 Deployment started..."

# Pull the latest version of the app
echo "🔄 Pulling latest changes from GitHub..."
git pull origin master || { echo "❌ Git pull failed."; exit 1; }

# Install dependencies with legacy peer deps
echo "📦 Installing dependencies..."
npm install --legacy-peer-deps || { echo "❌ npm install failed."; exit 1; }

# Build the project
echo "🔧 Creating production build..."
npm run build || { echo "❌ Build process failed."; exit 1; }

# Reload PM2
echo "♻️ Reloading application with PM2..."
pm2 reload myapp || { echo "❌ PM2 reload failed."; exit 1; }

echo "✅ Deployment finished successfully!"
