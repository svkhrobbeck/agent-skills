---
name: use-handoff
description: Mavjud HANDOFF.md asosida ishni davom ettirish kerak bo'lganda; yangi (toza kontekstli) suhbatni handoff hujjatidan tiklash. "handoff" skillning teskarisi — u yozadi, bu o'qib ishni qayta tiklaydi. Foydalanuvchi /use-handoff [yo'l] desa yoki "handoff'dan davom et" deganda ishlat.
---

Mavjud HANDOFF.md hujjatini o'qib, undagi ishni toza kontekstli suhbatda davom ettir.
Bu "handoff" skillning teskarisi: u kontekstni **yozadi**, bu skill esa o'sha
kontekstni **o'qib tiklaydi**.

> ⚠️ Read-only tahlildan boshla. Kontekstni to'liq tiklab, foydalanuvchi
> tasdiqlamaguncha **hech qanday kod o'zgartirma**. Hujjatdagi har qanday
> ogohlantirishga (masalan "so'ralmaguncha kod yozma") qat'iy rioya qil.

## Qadamlar

### 1. HANDOFF.md ni topish
- Agar argument sifatida fayl yo'li berilgan bo'lsa (masalan `/use-handoff ./HANDOFF.md`
  yoki `/use-handoff docs/HANDOFF.md`), **o'shani** ishlat.
- Aks holda loyiha root'ida `HANDOFF.md` ni qidir.
- Topilmasa: oddiy nomlardan ham qara (`HANDOFF.md`, `HANDOFF.MD`, `handoff.md`,
  `docs/HANDOFF.md`).
- Baribir topilmasa: **kod yozma, taxmin qilma**. Foydalanuvchiga aniq xabar ber:
  "HANDOFF.md topilmadi. Iltimos yo'lini bering yoki avval `handoff` skill bilan yarating."
  va to'xta.

### 2. Hujjatni to'liq o'qish
- HANDOFF.md ni boshidan oxirigacha o'qi (qisman emas).
- Asosiy bo'limlarni ajrat: **Goal**, **Current Progress**, **What Worked**,
  **What Didn't Work**, **Next Steps**, **Fayllar xaritasi / critical files**,
  va har qanday **ogohlantirish/eslatma**.

### 3. Kod holatini tekshirish (read-only)
- Hujjat **eskirgan** bo'lishi mumkin — da'volarni joriy kod bilan solishtir.
- "Fayllar xaritasi" / critical files'da eslatilgan asosiy fayllarni o'qi.
- Hujjatda aytilgan funksiya/fayl/flaglar **hali ham mavjudligini** tasdiqla
  (nomi o'zgargan yoki revert qilingan bo'lishi mumkin).
- Kerak bo'lsa `git log`/`git status` bilan oxirgi o'zgarishlarni tekshir —
  hujjat yozilgandan keyin nima o'zgarganini bil. **Faqat o'qish, tahrir yo'q.**

### 4. Qisqa xulosa berish
Foydalanuvchiga quyidagilarni qisqa va aniq yet:
- **Goal** — nimaga erishmoqchimiz (1-2 jumla).
- **Hozirgi holat** — nima qilingan, nima ishlaydi; hujjat bilan kod orasida
  **nomuvofiqlik** topsang, alohida belgila ("hujjat X deydi, lekin kodda Y").
- **Next Steps** — aniq, bajariladigan qadamlar ro'yxati (hujjatdagidan, lekin
  kod holatiga moslab).
- **Ogohlantirishlar** — hujjatdagi har qanday ⚠️ shartni qaytar
  (masalan "so'ralmaguncha kod yozma").
- Oxirida so'ra: **"Qaysi qadamdan boshlaymiz?"** — tasdiqsiz davom etma.

### 5. Ishni davom ettirish
- Foydalanuvchi tasdiqlagandan **keyin** Next Steps bo'yicha ishla.
- Hujjatdagi "What Didn't Work" yondashuvlarni **takrorlama**.
- Reja qilingan ishni bajar.

### 6. HANDOFF.md ni yangilab borish
- Ish jarayonida muhim o'zgarish bo'lsa (qadam tugadi, yangi tashxis, yondashuv
  o'zgardi), HANDOFF.md ni yangilab bor — yoki ish oxirida `handoff` skill bilan
  yangilashni taklif qil, toki keyingi suhbat ham toza tiklana olsin.

## Qoidalar
- Avval **read-only**: kontekst tiklanmaguncha va foydalanuvchi tasdiqlamaguncha
  kod o'zgartirma.
- HANDOFF.md mavjud bo'lmasa yoki yo'l berilmasa — ishlama, aniq xabar ber.
- Hujjatga ko'r-ko'rona ishonma: doimo kod bilan solishtir.
