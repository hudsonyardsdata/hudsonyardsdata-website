# Deployment Checklist for Hudson Yards Data Website

## Pre-Deployment (Do These First)

- [ ] **Review all HTML files** - Open each file to verify content
  - [ ] index.html - Check all sections display correctly
  - [ ] our-story.html - Verify story content
  - [ ] core-competencies.html - Review services
  - [ ] get-started.html - Confirm contact info
  - [ ] software-sonnets.html - Easter egg works

- [ ] **Test locally** (optional but recommended)
  ```bash
  cd hudsonyardsdata-website
  python3 -m http.server 8000
  # Open http://localhost:8000 in browser
  ```

- [ ] **Verify email address** in get-started.html
  - Current: contact@hudsonyardsdata.com
  - Update if different

## GitHub Setup

- [ ] **Create GitHub account** (if you don't have one)
  - Go to https://github.com/signup

- [ ] **Create new repository**
  - Repository name: `hudsonyardsdata-website`
  - Visibility: Public
  - Do NOT initialize with README
  - Do NOT add .gitignore
  - Do NOT choose a license

## Deployment Steps

### Option A: Using Deploy Script (Easiest)

- [ ] **Run the deployment script**
  ```bash
  cd hudsonyardsdata-website
  ./deploy.sh
  ```

- [ ] **Follow the prompts**
  - Enter your GitHub username when asked
  - Authenticate if prompted

### Option B: Manual Deployment

- [ ] **Initialize git repository**
  ```bash
  cd hudsonyardsdata-website
  git init
  git add .
  git commit -m "Initial commit: Hudson Yards Data website"
  git branch -M main
  ```

- [ ] **Add GitHub remote**
  ```bash
  git remote add origin https://github.com/YOUR_USERNAME/hudsonyardsdata-website.git
  ```

- [ ] **Push to GitHub**
  ```bash
  git push -u origin main
  ```

## GitHub Pages Configuration

- [ ] **Navigate to repository Settings**
  - URL: `https://github.com/YOUR_USERNAME/hudsonyardsdata-website/settings/pages`

- [ ] **Enable GitHub Pages**
  - Source: Select "GitHub Actions"
  - Click Save

- [ ] **Wait for deployment** (2-3 minutes)
  - Check Actions tab for progress
  - Green checkmark = success!

- [ ] **Test the live site**
  - URL: `https://YOUR_USERNAME.github.io/hudsonyardsdata-website/`
  - Verify all pages load
  - Test navigation
  - Check mobile responsiveness

## Custom Domain Setup (Optional - Do After Above Works)

- [ ] **Verify site works on GitHub Pages URL first!**

- [ ] **Add custom domain in GitHub**
  - Settings → Pages → Custom domain
  - Enter: `hudsonyardsdata.com`
  - Save

- [ ] **Verify CNAME file was created**
  - Check repository for CNAME file
  - Should contain: `hudsonyardsdata.com`

- [ ] **Configure DNS at your registrar**
  - See DNS_MIGRATION_GUIDE.md for detailed steps
  - Add 4 A records for GitHub Pages
  - Add www CNAME record
  - **KEEP email MX records!**

- [ ] **Wait for DNS propagation** (24-48 hours)
  - Check status: https://dnschecker.org
  - All regions should show GitHub IPs

- [ ] **Test custom domain**
  - Visit `http://hudsonyardsdata.com`
  - Verify it loads your site
  - Test www subdomain too

- [ ] **Enable HTTPS** (after DNS propagates)
  - Settings → Pages → Enforce HTTPS
  - Check the box
  - Wait a few minutes for certificate

- [ ] **Send test email**
  - Email yourself at your @hudsonyardsdata.com address
  - Verify email still works!

## Final Verification

- [ ] **Website loads** at final URL
- [ ] **HTTPS works** (padlock in browser)
- [ ] **All pages accessible**
- [ ] **Navigation works**
- [ ] **Mobile responsive**
- [ ] **Contact form/email correct**
- [ ] **Email still works**
- [ ] **No broken links**

## Post-Deployment

- [ ] **Update bookmarks/links**
  - Social media profiles
  - Email signatures
  - Business cards (eventually)

- [ ] **Monitor for 48 hours**
  - Check that emails keep arriving
  - Verify site stays online
  - Test from different devices/networks

- [ ] **Cancel Squarespace** (ONLY after everything works!)
  - Keep domain registration if Squarespace is your registrar
  - Cancel only the hosting/website service
  - Verify one more time before canceling

## Ongoing Maintenance

- [ ] **Set up Google Analytics** (optional)
  - See README.md for instructions

- [ ] **Schedule regular updates**
  - Review content quarterly
  - Update client list as needed
  - Refresh practice areas

- [ ] **Keep git repository updated**
  - Commit regularly with clear messages
  - Push changes frequently

## Emergency Rollback (If Something Goes Wrong)

If website goes down or DNS issues occur:

### Squarespace Still Active?

- [ ] Log into Squarespace
- [ ] Revert DNS records to original Squarespace settings
- [ ] Wait 1-2 hours for DNS to revert

### Need to Undo GitHub Changes?

- [ ] Remove custom domain from GitHub Pages settings
- [ ] Site will still work at github.io URL
- [ ] Fix issues and retry domain connection

## Troubleshooting Resources

- **GitHub Pages not working?**
  - Check: https://github.com/YOUR_USERNAME/hudsonyardsdata-website/actions
  - Look for red X (failed) or green checkmark (success)

- **DNS not propagating?**
  - Use: https://dnschecker.org
  - Enter: hudsonyardsdata.com
  - Should show GitHub IPs globally

- **Email stopped?**
  - Verify MX records at your DNS provider
  - Check: https://mxtoolbox.com/domain/hudsonyardsdata.com
  - Should show Google mail servers

## Success Criteria

You're done when:

✅ Website loads at desired URL  
✅ HTTPS enabled and working  
✅ All pages and navigation functional  
✅ Email continues to work normally  
✅ Mobile responsive design works  
✅ You can update content via git push  

## Notes & Observations

_Use this space to track any issues, decisions, or customizations:_

---
Last updated: [Date]
Completed by: [Your Name]
