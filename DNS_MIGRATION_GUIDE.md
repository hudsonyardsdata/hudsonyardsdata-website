# DNS Migration Guide: Squarespace → GitHub Pages

## Overview

This guide walks you through migrating `hudsonyardsdata.com` from Squarespace to GitHub Pages while preserving your Gmail Workspace email.

## ⏱️ Timeline

- **DNS Changes:** 5-10 minutes
- **Propagation:** 24-48 hours
- **Total Migration:** 2-3 days (to be safe)

## 🎯 Prerequisites

- [ ] GitHub repository created and deployed
- [ ] Website tested at `https://YOUR_USERNAME.github.io/hudsonyardsdata-website`
- [ ] Access to your domain registrar (where you manage DNS)
- [ ] Backup of current DNS settings (screenshot recommended)

## 📋 Step-by-Step Migration

### Phase 1: Preparation (Do This First!)

#### 1.1 Document Current DNS Settings

Log into your domain registrar and **take screenshots** of all current DNS records for `hudsonyardsdata.com`. You'll need these if anything goes wrong.

#### 1.2 Identify Your Domain Registrar

Squarespace might be your registrar, OR you might have registered elsewhere (GoDaddy, Namecheap, Google Domains, etc.).

To find out:
- Check your Squarespace billing - do you pay for domain registration?
- OR use [WHOIS lookup](https://whois.domaintools.com/) to find the registrar

#### 1.3 Get Email DNS Records

You MUST preserve these for Gmail to keep working. Current Gmail Workspace records should look like:

```
Type    Name/Host       Value/Points To             Priority/TTL
MX      @              aspmx.l.google.com          1
MX      @              alt1.aspmx.l.google.com     5
MX      @              alt2.aspmx.l.google.com     5
MX      @              alt3.aspmx.l.google.com     10
MX      @              alt4.aspmx.l.google.com     10
TXT     @              v=spf1 include:_spf.google.com ~all
CNAME   _domainkey     XXXX._domainkey.gappssmtp.com
```

**Save these records!** You'll re-add them after migration.

### Phase 2: Add CNAME to GitHub

#### 2.1 Create CNAME File in Repository

```bash
cd hudsonyardsdata-website
echo "hudsonyardsdata.com" > CNAME
git add CNAME
git commit -m "Add custom domain configuration"
git push origin main
```

#### 2.2 Configure in GitHub Settings

1. Go to your repository on GitHub
2. Click **Settings** → **Pages**
3. Under "Custom domain", enter: `hudsonyardsdata.com`
4. Click **Save**
5. **DO NOT** check "Enforce HTTPS" yet (wait for DNS to propagate)

### Phase 3: Update DNS Records

#### 3.1 Log Into Domain Registrar

Access your DNS management interface at your registrar (Squarespace, GoDaddy, etc.)

#### 3.2 Add GitHub Pages A Records

Add these four A records pointing to GitHub Pages:

```
Type    Name/Host    Value              TTL
A       @            185.199.108.153    3600
A       @            185.199.109.153    3600
A       @            185.199.110.153    3600
A       @            185.199.111.153    3600
```

**Notes:**
- `@` means root domain (hudsonyardsdata.com)
- Some registrars might want you to leave Name/Host blank
- TTL 3600 = 1 hour (use lower value like 300 for faster propagation)

#### 3.3 Add WWW CNAME Record

```
Type     Name/Host    Value                              TTL
CNAME    www          YOUR_USERNAME.github.io            3600
```

Replace `YOUR_USERNAME` with your actual GitHub username.

#### 3.4 Re-Add Email (MX) Records

⚠️ **CRITICAL:** Re-add ALL your Gmail Workspace MX records:

```
Type    Name/Host    Value                      Priority
MX      @            aspmx.l.google.com         1
MX      @            alt1.aspmx.l.google.com    5
MX      @            alt2.aspmx.l.google.com    5
MX      @            alt3.aspmx.l.google.com    10
MX      @            alt4.aspmx.l.google.com    10
```

#### 3.5 Re-Add Email TXT Records

```
Type    Name/Host    Value
TXT     @            v=spf1 include:_spf.google.com ~all
```

And any DKIM records (usually a CNAME starting with `_domainkey`)

#### 3.6 Remove Old Squarespace Records

**ONLY AFTER** adding new GitHub + Email records:
- Delete any old A records pointing to Squarespace IPs
- Delete any CNAMEs pointing to Squarespace (except email-related ones)
- Keep all Google email records!

### Phase 4: Wait and Verify

#### 4.1 Check DNS Propagation

Use [DNS Checker](https://dnschecker.org) to verify:
- Enter `hudsonyardsdata.com`
- Check A records show GitHub IPs
- Should propagate within 1-48 hours

#### 4.2 Test Email

Send yourself a test email to verify Gmail still works:
```
your-email@hudsonyardsdata.com
```

#### 4.3 Test Website

Once DNS propagates, visit:
- `http://hudsonyardsdata.com` (should redirect to HTTPS)
- `http://www.hudsonyardsdata.com` (should also work)

#### 4.4 Enable HTTPS

After DNS fully propagates (24-48 hours):
1. Go to GitHub repository **Settings** → **Pages**
2. Check **"Enforce HTTPS"**
3. Wait a few minutes for certificate issuance

### Phase 5: Cleanup

#### 5.1 Cancel Squarespace

Once you've verified:
- ✅ Website loads at hudsonyardsdata.com
- ✅ Email still works
- ✅ HTTPS is enabled

Then you can safely cancel Squarespace hosting.

**Keep domain registration** if Squarespace is your registrar!

#### 5.2 Update Bookmarks/Links

Update any external links pointing to:
- Old Squarespace URLs
- Internal documentation
- Social media profiles

## 🔧 Registrar-Specific Instructions

### If Using Squarespace as Registrar

1. Go to Squarespace → Settings → Domains
2. Click on hudsonyardsdata.com
3. Click **DNS Settings**
4. Follow Phase 3 instructions above

### If Using Google Domains / Google Workspace

1. Go to [domains.google.com](https://domains.google.com)
2. Click your domain → DNS
3. Follow Phase 3 instructions

### If Using GoDaddy

1. Log into GoDaddy
2. My Products → DNS
3. Follow Phase 3 instructions

### If Using Namecheap

1. Log into Namecheap
2. Domain List → Manage → Advanced DNS
3. Follow Phase 3 instructions

## ⚠️ Common Issues

### Issue: Email stops working

**Solution:** 
- Verify all MX records are correct
- Check SPF and DKIM records
- Gmail takes 5-10 minutes to update

### Issue: Website shows 404

**Solution:**
- Verify CNAME file exists in repository
- Check GitHub Pages settings show correct domain
- Wait longer for DNS propagation

### Issue: Mixed content warnings

**Solution:**
- Ensure all links use HTTPS
- Enable "Enforce HTTPS" in GitHub Pages

### Issue: Website shows old Squarespace content

**Solution:**
- Clear browser cache (Ctrl+F5)
- Check DNS propagation status
- Verify A records point to GitHub

## 📞 Support Resources

- **GitHub Pages:** https://docs.github.com/pages
- **Google Workspace:** https://support.google.com/a/
- **DNS Checker:** https://dnschecker.org
- **WHOIS Lookup:** https://whois.domaintools.com

## ✅ Final Checklist

- [ ] Backed up current DNS settings
- [ ] Created CNAME file in repository
- [ ] Added GitHub Pages A records
- [ ] Added www CNAME record
- [ ] Re-added ALL email MX records
- [ ] Re-added email TXT/DKIM records
- [ ] Removed old Squarespace records
- [ ] Verified DNS propagation
- [ ] Tested email functionality
- [ ] Tested website loads correctly
- [ ] Enabled HTTPS enforcement
- [ ] Cancelled Squarespace hosting

## 🎉 Success!

Your website should now be:
- ✅ Hosted on GitHub Pages
- ✅ Accessible at hudsonyardsdata.com
- ✅ Automatically deploying on git push
- ✅ Email still working perfectly
- ✅ Secured with HTTPS

Congratulations on your migration!
