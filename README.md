# Xray VLESS over WebSocket (No TLS) – Cloudflare Tunnel Ready

## نحوه راه‌اندازی:

1. ابتدا ریپو را در GitHub خودتان ایجاد و فایل‌ها را آپلود کنید.
2. سپس در Railway دیپلوی کنید و متغیرهای زیر را اضافه کنید:

   - `PORT`: 80 (یا هر پورت دلخواه)
   - هیچ تنظیمات اضافه دیگری لازم نیست.

3. از Cloudflare Tunnel برای اتصال دامنه استفاده کنید:
   - دامنه: `mg83.xyz`
   - Tunnel ID: `86426b29-852e-41ee-bfbd-5496da7c2770`

4. سپس از این لینک اتصال استفاده کنید:

vless://86426b29-852e-41ee-bfbd-5496da7c2770@mg83.xyz:80?path=/&encryption=none&security=none&type=ws#CF-Xray

---

## نکات مهم:
- از TLS استفاده نمی‌شود (برای عبور از فیلتر نیاز است که Cloudflare Tunnel فعال باشد).
- مطمئن شوید که Tunnel شما به Railway متصل است.
- 
