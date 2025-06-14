# Xray + Caddy for Railway

این پروژه برای دیپلوی آسان Xray (VLESS + WebSocket) با Caddy (TLS خودکار) روی Railway هست.

## تنظیمات

- **AUUID**: (اختیاری) اگر UUID خاصی می‌خوای، قبل از دیپلوی تعریفش کن.
- **PORT**: (اختیاری) پورت داخلی Caddy، پیش‌فرض 8080.

## Deploy در Railway

1. ریپو رو Fork کن یا خودت Push کن.
2. در Railway، New Project → Deploy from GitHub.
3. در قسمت Variables:
   - `AUUID`: UUID یا بذارش خالی باشه خودش می‌سازه
   - `PORT`: 8080
4. Deploy رو بزن.

## لینک VLESS

اگر دامنه‌ات مثلاً `myapp.up.railway.app` باشه، لینک:
