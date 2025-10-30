# 🚀 Quick Start Guide

Welcome! This guide gets your new website live in **under 15 minutes**.

## What You're Getting

✅ Modern, professional static website  
✅ All content from your Charles River Data document  
✅ Automatic deployment on every git push  
✅ Free hosting via GitHub Pages  
✅ Custom domain ready (hudsonyardsdata.com)  

## Step 1: Upload to GitHub (5 minutes)

### Option A: Using the Deploy Script (Easiest)

```bash
cd hudsonyardsdata-website
./deploy.sh
```

Follow the prompts! The script will:
- Initialize git
- Commit all files
- Push to GitHub
- Give you next steps

### Option B: Manual Git Commands

```bash
cd hudsonyardsdata-website

# Initialize git
git init
git add .
git commit -m "Initial commit: Hudson Yards Data website"
git branch -M main

# Add your GitHub repo (create it first at github.com/new)
git remote add origin https://github.com/YOUR_USERNAME/hudsonyardsdata-website.git

# Push
git push -u origin main
```

## Step 2: Enable GitHub Pages (2 minutes)

1. Go to your repository on GitHub
2. Click **Settings** → **Pages**
3. Under "Source", select **GitHub Actions**
4. Click **Save**

That's it! Your site will deploy automatically.

## Step 3: View Your Website (1 minute)

Wait 2-3 minutes, then visit:
```
https://YOUR_USERNAME.github.io/hudsonyardsdata-website/
```

🎉 Your website is live!

## Step 4: Connect Custom Domain (Optional)

See [DNS_MIGRATION_GUIDE.md](DNS_MIGRATION_GUIDE.md) for detailed instructions.

**Quick version:**

1. **In GitHub:** Settings → Pages → Custom domain → `hudsonyardsdata.com`

2. **At your DNS provider:** Add these A records:
   ```
   @ → 185.199.108.153
   @ → 185.199.109.153
   @ → 185.199.110.153
   @ → 185.199.111.153
   ```

3. **Add www CNAME:**
   ```
   www → YOUR_USERNAME.github.io
   ```

4. **Wait 24-48 hours** for DNS propagation

5. **Keep your email MX records** for Gmail Workspace!

## Daily Usage: Updating Your Website

### Quick Edit (GitHub Web Interface)

1. Go to your repository
2. Click on any HTML file (e.g., `index.html`)
3. Click the pencil icon (Edit)
4. Make changes
5. Scroll down → Commit changes
6. Wait 1-2 minutes → Changes are live!

### Advanced Edit (Local Computer)

```bash
# Make changes to any HTML/CSS files
nano index.html

# Commit and push
git add .
git commit -m "Updated homepage"
git push

# Site auto-deploys in 1-2 minutes!
```

## Common Tasks

### Change Site Colors

Edit `css/style.css`:
```css
:root {
    --primary-color: #1a5490;    /* Change this */
    --secondary-color: #2c7fb8;  /* And this */
}
```

### Add a New Page

1. Copy an existing page:
   ```bash
   cp our-story.html new-page.html
   ```

2. Edit the content in `new-page.html`

3. Add to navigation (edit the `<nav>` section in ALL HTML files):
   ```html
   <li><a href="new-page.html">New Page</a></li>
   ```

4. Commit and push!

### Add Images

1. Put images in `images/` folder
2. Reference in HTML:
   ```html
   <img src="images/logo.png" alt="Logo">
   ```

3. Commit and push the image files

## Need Help?

- **Full Documentation:** See [README.md](README.md)
- **DNS/Domain Help:** See [DNS_MIGRATION_GUIDE.md](DNS_MIGRATION_GUIDE.md)
- **GitHub Pages Docs:** https://docs.github.com/pages

## Troubleshooting

### Site not showing up?
- Wait 3-5 minutes after first push
- Check Actions tab for deployment status
- Ensure GitHub Pages is enabled in Settings

### Changes not appearing?
- Hard refresh: `Ctrl+F5` (Windows) or `Cmd+Shift+R` (Mac)
- Wait 2-3 minutes for deployment
- Check Actions tab for errors

### Custom domain issues?
- Takes 24-48 hours for DNS to propagate
- Use https://dnschecker.org to verify DNS
- Make sure CNAME file exists in repository

## What's Next?

1. ✅ Website is live!
2. 📝 Customize content in HTML files
3. 🎨 Adjust colors in CSS
4. 📸 Add your images
5. 🌐 Set up custom domain
6. 📧 Ensure email keeps working

**You're all set! Your website updates with every git push.** 🎉
