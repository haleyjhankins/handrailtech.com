# 🚀 Performance Optimization Guide - Handrail Tech Services

## ✅ Changes Already Implemented

### 1. **Font Optimization**
- Reduced Google Fonts from 10 weights to 2 (400, 700)
- Added `font-display: swap` to prevent blocking
- **Impact:** ~50-60KB reduction, faster text rendering

### 2. **Image Optimization - HTML Updates**
- Added `width` and `height` attributes to prevent layout shift
- Added `fetchpriority="high"` to logo and hero image
- Added `loading="lazy"` to below-fold images
- **Impact:** Better CLS score, faster LCP

### 3. **JavaScript Optimization**
- Added `defer` to navbar toggle script
- **Impact:** Faster page interactivity (TTI/TBT)

### 4. **Caching Headers (Netlify)**
- Added Cache-Control headers for static assets
- **Impact:** Faster repeat visits

---

## 📋 Next Steps to Reach 90+ Score

### PRIORITY 1: Convert Images to WebP (High Impact) ⭐️⭐️⭐️
**Current Issue:** JPG images are 2-3x larger than needed  
**Solution:** Run the image optimization script

```bash
chmod +x optimize-images.sh
./optimize-images.sh
```

Then update HTML to use WebP with fallbacks:

```html
<!-- Replace this -->
<img src="src/images/older-couple.jpg" alt="..." />

<!-- With this -->
<picture>
  <source srcset="src/images/older-couple.webp" type="image/webp">
  <img src="src/images/older-couple.jpg" alt="..." width="600" height="400" />
</picture>
```

**Expected Gain:** +10-15 points

---

### PRIORITY 2: Preload Critical Resources (Medium Impact) ⭐️⭐️
Add to `<head>`:

```html
<!-- Preload critical CSS -->
<link rel="preload" href="./css/tailwind.css" as="style">

<!-- Preload hero image -->
<link rel="preload" as="image" href="src/images/older-couple.webp" type="image/webp">

<!-- DNS prefetch for external booking -->
<link rel="dns-prefetch" href="https://handrailtechservices.zohobookings.com">
```

**Expected Gain:** +5-8 points

---

### PRIORITY 3: Minify and Compress (Medium Impact) ⭐️⭐️
Your build script already minifies CSS. Ensure Netlify compression is enabled:

Add to `netlify.toml`:
```toml
[[plugins]]
  package = "@netlify/plugin-lighthouse"

# Enable Brotli compression (usually automatic, but good to verify)
```

**Expected Gain:** +3-5 points

---

### PRIORITY 4: Reduce Third-Party Impact (Low-Medium) ⭐️
**Google Fonts** (already optimized ✓)  
**Zoho Bookings** - This external iframe/script may be slowing things down

Consider:
- Self-hosting a booking form
- Loading Zoho asynchronously: `<script async src="..."></script>`
- Using facade pattern (show button, load Zoho on click)

**Expected Gain:** +2-5 points

---

## 🎯 Expected Score After All Changes

| Current | After Images | After Preload | After 3rd Party |
|---------|-------------|---------------|-----------------|
| 66      | 76-81       | 81-89         | 85-93           |

---

## 🧪 Testing Your Changes

After each change:

```bash
# Rebuild
npm run build

# Deploy to Netlify
git add .
git commit -m "Performance optimizations"
git push
```

Then test with:
- **Lighthouse:** Chrome DevTools > Lighthouse > Mobile
- **PageSpeed Insights:** https://pagespeed.web.dev/
- **WebPageTest:** https://www.webpagetest.org/

---

## 💡 Additional Quick Wins

1. **Add meta theme-color** (helps perceived performance):
   ```html
   <meta name="theme-color" content="#4A7C7E">
   ```

2. **Service Worker** (advanced - for later):
   - Cache assets offline
   - Instant repeat visits

3. **Consider reducing Tailwind scope**:
   - Currently 16KB is good, but you can use PurgeCSS if it grows

---

## 📊 What Lighthouse Measures

- **LCP** (Largest Contentful Paint): Hero image load time
- **TBT** (Total Blocking Time): JavaScript execution
- **CLS** (Cumulative Layout Shift): Image dimensions prevent this
- **FCP** (First Contentful Paint): How fast anything appears
- **SI** (Speed Index): How quickly content is visually populated

---

## 🆘 Need Help?

If you get stuck, common issues:
- **Images not loading:** Check file paths after WebP conversion
- **Fonts broken:** Verify Google Fonts URL
- **Cache not working:** Clear browser cache + hard reload (Cmd+Shift+R)
