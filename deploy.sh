#!/bin/bash
#
# Quick Start Deployment Script for Hudson Yards Data Website
# 
# This script helps you deploy your website to GitHub Pages
# Run this after creating your GitHub repository

set -e  # Exit on any error

echo "=================================================="
echo "Hudson Yards Data - GitHub Deployment Script"
echo "=================================================="
echo ""

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: Please run this script from the hudsonyardsdata-website directory"
    exit 1
fi

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Error: git is not installed. Please install git first."
    exit 1
fi

# Initialize git if not already done
if [ ! -d ".git" ]; then
    echo "📦 Initializing git repository..."
    git init
    echo "✓ Git initialized"
else
    echo "✓ Git already initialized"
fi

# Add all files
echo ""
echo "📝 Adding files to git..."
git add .

# Show what will be committed
echo ""
echo "Files to be committed:"
git status --short

# Commit
echo ""
read -p "Enter commit message (or press Enter for default): " commit_msg
if [ -z "$commit_msg" ]; then
    commit_msg="Initial commit: Hudson Yards Data website"
fi

git commit -m "$commit_msg" || echo "No changes to commit"

# Set main branch
git branch -M main

# Get GitHub username and repo name
echo ""
echo "=================================================="
echo "GitHub Repository Configuration"
echo "=================================================="
echo ""
echo "Before continuing, create a repository on GitHub:"
echo "  1. Go to https://github.com/new"
echo "  2. Repository name: hudsonyardsdata-website"
echo "  3. Make it Public"
echo "  4. Don't initialize with README or .gitignore"
echo "  5. Click 'Create repository'"
echo ""
read -p "Enter your GitHub username: " github_user

if [ -z "$github_user" ]; then
    echo "❌ GitHub username required"
    exit 1
fi

# Set remote
repo_url="https://github.com/${github_user}/hudsonyardsdata-website.git"
echo ""
echo "Setting remote to: $repo_url"

# Remove existing remote if present
git remote remove origin 2>/dev/null || true

# Add new remote
git remote add origin "$repo_url"

# Push to GitHub
echo ""
echo "🚀 Pushing to GitHub..."
echo "You may be prompted for your GitHub credentials..."
echo ""

if git push -u origin main; then
    echo ""
    echo "=================================================="
    echo "✅ SUCCESS! Your website has been pushed to GitHub"
    echo "=================================================="
    echo ""
    echo "Next steps:"
    echo ""
    echo "1. Enable GitHub Pages:"
    echo "   • Go to: https://github.com/${github_user}/hudsonyardsdata-website/settings/pages"
    echo "   • Under 'Source', select 'GitHub Actions'"
    echo "   • Save"
    echo ""
    echo "2. Wait 2-3 minutes for deployment"
    echo ""
    echo "3. View your site at:"
    echo "   https://${github_user}.github.io/hudsonyardsdata-website/"
    echo ""
    echo "4. Configure custom domain:"
    echo "   • Add 'hudsonyardsdata.com' in Pages settings"
    echo "   • Follow DNS_MIGRATION_GUIDE.md for DNS setup"
    echo ""
    echo "=================================================="
else
    echo ""
    echo "❌ Push failed. Common solutions:"
    echo ""
    echo "1. Authentication failed?"
    echo "   • Use a Personal Access Token instead of password"
    echo "   • Generate one at: https://github.com/settings/tokens"
    echo ""
    echo "2. Repository doesn't exist?"
    echo "   • Create it first at: https://github.com/new"
    echo ""
    echo "3. Try manual push:"
    echo "   git push -u origin main"
    echo ""
    exit 1
fi
