# Hudson Yards Data Website

Modern, git-based static website for Hudson Yards Data (formerly Charles River Data).

## 🚀 Quick Start

This website automatically deploys to GitHub Pages when you push to the `main` branch.

### Initial Setup

1. **Create a new GitHub repository:**
   ```bash
   # On GitHub.com, create a new repository named 'hudsonyardsdata-website'
   # Don't initialize with README, .gitignore, or license
   ```

2. **Push this code to GitHub:**
   ```bash
   cd hudsonyardsdata-website
   git init
   git add .
   git commit -m "Initial commit: Hudson Yards Data website"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/hudsonyardsdata-website.git
   git push -u origin main
   ```

3. **Enable GitHub Pages:**
   - Go to your repository on GitHub
   - Click **Settings** → **Pages**
   - Under "Source", select **GitHub Actions**
   - The site will deploy automatically!

## 📁 Project Structure

```
hudsonyardsdata-website/
├── index.html              # Home page
├── our-story.html          # About page
├── core-competencies.html  # Services overview
├── get-started.html        # Contact/engagement page
├── software-sonnets.html   # Easter egg page
├── css/
│   └── style.css          # Main stylesheet
├── js/
│   └── (future JS files)
├── images/
│   └── (your images here)
├── .github/
│   └── workflows/
│       └── deploy.yml     # Automated deployment
└── README.md              # This file
```

## ✏️ Editing Content

### Method 1: Edit HTML Directly (Simplest)

Edit the HTML files directly:

```bash
# Edit homepage
nano index.html

# Commit and push
git add index.html
git commit -m "Updated homepage hero text"
git push
```

The site will automatically redeploy within 1-2 minutes.

### Method 2: Edit via GitHub Web Interface

1. Navigate to any HTML file on GitHub
2. Click the pencil icon (Edit)
3. Make your changes
4. Commit directly to `main` branch
5. Site auto-deploys!

## 🎨 Customizing Design

The entire design is controlled by `css/style.css`. Key variables are at the top:

```css
:root {
    --primary-color: #1a5490;    /* Main brand color */
    --secondary-color: #2c7fb8;  /* Secondary accent */
    --accent-color: #41b6c4;     /* Highlight color */
}
```

Change these to match your brand colors!

## 🌐 Custom Domain Setup (hudsonyardsdata.com)

### Step 1: Configure DNS (at your domain registrar)

Add these DNS records for `hudsonyardsdata.com`:

```
Type    Name    Value
A       @       185.199.108.153
A       @       185.199.109.153
A       @       185.199.110.153
A       @       185.199.111.153
CNAME   www     YOUR_USERNAME.github.io
```

### Step 2: Configure GitHub Pages

1. Go to repository **Settings** → **Pages**
2. Under "Custom domain", enter: `hudsonyardsdata.com`
3. Check "Enforce HTTPS" (after DNS propagates, ~24 hours)

### Step 3: Add CNAME file

```bash
echo "hudsonyardsdata.com" > CNAME
git add CNAME
git commit -m "Add custom domain"
git push
```

### Step 4: Migrate from Squarespace

1. **Wait for DNS propagation** (24-48 hours)
2. **Test the new site** at `https://hudsonyardsdata.com`
3. **Cancel Squarespace** once confirmed working
4. **Update Google Workspace** if needed (DNS records for email)

## 📧 Preserving Email (Gmail Workspace)

Make sure to keep these DNS records for email:

```
Type    Name    Value                   Priority
MX      @       aspmx.l.google.com      1
MX      @       alt1.aspmx.l.google.com 5
MX      @       alt2.aspmx.l.google.com 5
MX      @       alt3.aspmx.l.google.com 10
MX      @       alt4.aspmx.l.google.com 10
TXT     @       v=spf1 include:_spf.google.com ~all
```

⚠️ **Important:** Your email will continue working as long as you keep the MX records pointing to Google.

## 🔧 Advanced: Adding New Pages

1. **Create new HTML file:**
   ```bash
   cp our-story.html new-page.html
   ```

2. **Edit the content:**
   ```bash
   nano new-page.html
   # Update the title, content, etc.
   ```

3. **Add to navigation** (edit header in each HTML file):
   ```html
   <nav>
       <ul>
           <li><a href="index.html">Home</a></li>
           <li><a href="our-story.html">Our Story</a></li>
           <li><a href="new-page.html">New Page</a></li>
           ...
       </ul>
   </nav>
   ```

4. **Commit and push:**
   ```bash
   git add new-page.html
   git commit -m "Added new page"
   git push
   ```

## 🧪 Testing Locally

Want to preview changes before pushing?

```bash
# Option 1: Python simple server
cd hudsonyardsdata-website
python3 -m http.server 8000

# Visit http://localhost:8000 in your browser

# Option 2: VS Code Live Server extension
# Just right-click index.html → "Open with Live Server"
```

## 📊 Adding Analytics

To add Google Analytics:

1. Get your Google Analytics tracking ID
2. Add before `</head>` in each HTML file:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

## 🔐 Security Notes

- GitHub Pages serves over HTTPS automatically
- No server-side code = minimal attack surface
- No database = no SQL injection risk
- Static files only = fast and secure

## 📈 Performance

- ✅ Fast loading (no server processing)
- ✅ Global CDN via GitHub
- ✅ Mobile responsive design
- ✅ SEO-friendly HTML structure

## 🆘 Troubleshooting

### Site not deploying?

1. Check Actions tab for errors
2. Ensure GitHub Pages is enabled
3. Verify branch is `main`

### Custom domain not working?

1. Wait 24-48 hours for DNS propagation
2. Check DNS records at [DNS Checker](https://dnschecker.org)
3. Ensure CNAME file exists in repository

### Changes not showing?

1. Hard refresh: `Ctrl+F5` (Windows) or `Cmd+Shift+R` (Mac)
2. Clear browser cache
3. Wait 2-3 minutes for deployment

## 📞 Support

- **GitHub Issues:** Open an issue in this repository
- **GitHub Pages Docs:** https://docs.github.com/pages

## 📝 License

Copyright © 2025 Hudson Yards Data. All rights reserved.
