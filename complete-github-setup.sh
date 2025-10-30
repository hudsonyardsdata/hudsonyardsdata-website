#!/bin/bash
#
# Complete GitHub Setup Script
# Run this after downloading the website folder
#

set -e

echo "========================================"
echo "Hudson Yards Data - GitHub Setup"
echo "========================================"
echo ""

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: Please run this script from the hudsonyardsdata-website directory"
    echo ""
    echo "If you just downloaded the files, extract them first:"
    echo "  1. Unzip the downloaded file"
    echo "  2. cd into the hudsonyardsdata-website folder"
    echo "  3. Run: ./complete-github-setup.sh"
    exit 1
fi

echo "Step 1: Creating GitHub Repository"
echo "===================================="
echo ""
echo "Please follow these steps in your browser:"
echo ""
echo "  1. Go to: https://github.com/new"
echo "  2. Repository name: hudsonyardsdata-website"
echo "  3. Make it: Public"
echo "  4. ❌ DO NOT check 'Initialize with README'"
echo "  5. ❌ DO NOT add .gitignore or license"
echo "  6. Click 'Create repository'"
echo ""
read -p "Press Enter once you've created the repository..."

echo ""
echo "Step 2: What's your GitHub username?"
echo "===================================="
read -p "GitHub username: " github_user

if [ -z "$github_user" ]; then
    echo "❌ GitHub username required"
    exit 1
fi

echo ""
echo "Step 3: Initializing Git (if needed)"
echo "===================================="

# Check if already a git repo
if [ ! -d ".git" ]; then
    git init
    git branch -M main
    echo "✓ Git initialized"
else
    echo "✓ Already a git repository"
    git branch -M main 2>/dev/null || echo "✓ Already on main branch"
fi

# Configure git if not already done
if ! git config user.email > /dev/null 2>&1; then
    git config user.email "contact@hudsonyardsdata.com"
    git config user.name "Hudson Yards Data"
    echo "✓ Git configured"
fi

# Check if files are committed
if ! git rev-parse HEAD > /dev/null 2>&1; then
    echo "Adding files..."
    git add .
    git commit -m "Initial commit: Hudson Yards Data website"
    echo "✓ Files committed"
else
    echo "✓ Files already committed"
fi

echo ""
echo "Step 4: Connecting to GitHub"
echo "===================================="

repo_url="https://github.com/${github_user}/hudsonyardsdata-website.git"

# Remove existing origin if present
git remote remove origin 2>/dev/null || true

# Add new remote
git remote add origin "$repo_url"
echo "✓ Remote added: $repo_url"

echo ""
echo "Step 5: Pushing to GitHub"
echo "===================================="
echo ""
echo "🔐 AUTHENTICATION:"
echo ""
echo "GitHub requires authentication. You have two options:"
echo ""
echo "Option A: Personal Access Token (Recommended)"
echo "  1. Go to: https://github.com/settings/tokens/new"
echo "  2. Note: 'hudsonyardsdata-website deployment'"
echo "  3. Expiration: 90 days (or custom)"
echo "  4. Scopes: Check 'repo' (full repository access)"
echo "  5. Click 'Generate token'"
echo "  6. COPY THE TOKEN (you won't see it again!)"
echo "  7. When prompted below:"
echo "     - Username: ${github_user}"
echo "     - Password: PASTE YOUR TOKEN (not your GitHub password!)"
echo ""
echo "Option B: GitHub CLI (if installed)"
echo "  1. Run: gh auth login"
echo "  2. Follow the prompts"
echo ""
read -p "Press Enter when ready to push..."

echo ""
echo "Pushing to GitHub..."
echo ""

if git push -u origin main; then
    echo ""
    echo "========================================"
    echo "✅ SUCCESS!"
    echo "========================================"
    echo ""
    echo "Your website code is now on GitHub!"
    echo ""
    echo "📍 Repository: https://github.com/${github_user}/hudsonyardsdata-website"
    echo ""
    echo "Next Steps:"
    echo ""
    echo "1. Enable GitHub Pages:"
    echo "   → Go to: https://github.com/${github_user}/hudsonyardsdata-website/settings/pages"
    echo "   → Under 'Source', select: GitHub Actions"
    echo "   → Click Save"
    echo ""
    echo "2. Wait 2-3 minutes for deployment"
    echo ""
    echo "3. Visit your site:"
    echo "   → https://${github_user}.github.io/hudsonyardsdata-website/"
    echo ""
    echo "4. Configure custom domain (optional):"
    echo "   → Read: DNS_MIGRATION_GUIDE.md"
    echo ""
    echo "========================================"
    echo ""
else
    echo ""
    echo "========================================"
    echo "❌ Push Failed"
    echo "========================================"
    echo ""
    echo "Common solutions:"
    echo ""
    echo "1. Authentication failed?"
    echo "   → Use a Personal Access Token (see above)"
    echo "   → NOT your GitHub password"
    echo ""
    echo "2. Repository doesn't exist?"
    echo "   → Create it at: https://github.com/new"
    echo "   → Name must be: hudsonyardsdata-website"
    echo ""
    echo "3. Try again:"
    echo "   → Run: git push -u origin main"
    echo ""
    echo "4. Need more help?"
    echo "   → Read: QUICK_START.md"
    echo ""
    exit 1
fi
