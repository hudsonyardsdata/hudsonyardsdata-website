# Upload to GitHub - Web Interface Method

Since direct authentication isn't available in this environment, here's the simplest way to get your website on GitHub:

## Method 1: GitHub Web Upload (Easiest - 5 minutes)

### Step 1: Create Repository
1. Go to https://github.com/new
2. Repository name: `hudsonyardsdata-website`
3. Make it **Public**
4. ✅ Check **"Add a README file"** (we'll replace it)
5. Click **"Create repository"**

### Step 2: Upload Files via Web Interface

1. In your new repository, click **"uploading an existing file"** link
   (or go to: Add file → Upload files)

2. **Drag and drop** these files from the downloaded folder:
   - All `.html` files
   - All `.md` files  
   - `deploy.sh`
   - `.gitignore`

3. Then upload the folders:
   - Upload `css/style.css` (create css folder if needed)
   - Upload `.github/workflows/deploy.yml` (create folders if needed)

4. Commit message: "Initial commit: Hudson Yards Data website"

5. Click **"Commit changes"**

### Step 3: Enable GitHub Pages

1. Go to: **Settings** → **Pages**
2. Under "Source", select: **GitHub Actions**
3. Click **Save**

### Step 4: Wait & View

1. Go to **Actions** tab
2. Wait for green checkmark (2-3 minutes)
3. Visit: `https://YOUR_USERNAME.github.io/hudsonyardsdata-website/`

## Method 2: GitHub Desktop (Recommended for Future Updates)

### Step 1: Download GitHub Desktop
- Get it at: https://desktop.github.com/

### Step 2: Clone Your Repository
1. Open GitHub Desktop
2. File → Clone Repository
3. URL: `https://github.com/YOUR_USERNAME/hudsonyardsdata-website`
4. Choose local folder

### Step 3: Copy Files
1. Copy all files from the downloaded `hudsonyardsdata-website` folder
2. Paste into the cloned repository folder
3. GitHub Desktop will show the changes

### Step 4: Commit & Push
1. In GitHub Desktop:
   - Summary: "Initial website files"
   - Click "Commit to main"
   - Click "Push origin"

2. Enable GitHub Pages (see Method 1, Step 3)

## Method 3: Command Line (For Developers)

If you're comfortable with the terminal:

```bash
# Navigate to the downloaded folder
cd path/to/hudsonyardsdata-website

# Initialize git (if not already done)
git init
git branch -M main

# Add remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/hudsonyardsdata-website.git

# Push
git add .
git commit -m "Initial commit: Hudson Yards Data website"
git push -u origin main
```

**Authentication:**
- Username: Your GitHub username
- Password: Use a [Personal Access Token](https://github.com/settings/tokens/new)
  - NOT your GitHub password!
  - Scopes: Check "repo"

## After Upload

Once files are on GitHub:

1. **Enable GitHub Pages:**
   - Settings → Pages → Source: GitHub Actions

2. **Verify Deployment:**
   - Actions tab → Wait for green checkmark

3. **View Site:**
   - `https://YOUR_USERNAME.github.io/hudsonyardsdata-website/`

4. **Add Custom Domain (Optional):**
   - Settings → Pages → Custom domain: `hudsonyardsdata.com`
   - Follow DNS_MIGRATION_GUIDE.md

## Troubleshooting

**Can't push?**
- Make sure repository exists first
- Use Personal Access Token, not password
- Check repository name is exactly: `hudsonyardsdata-website`

**Pages not working?**
- Verify GitHub Pages is enabled
- Check Actions tab for errors
- Wait 3-5 minutes after first push

**Need help?**
- Read QUICK_START.md in the downloaded folder
- GitHub Support: https://support.github.com/

---

**Pro Tip:** After initial setup, use GitHub Desktop or the web interface for easy updates!
