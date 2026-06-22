# skills

Claude Code uchun shaxsiy skill'lar to'plami. Yangi mashinada yoki toza muhitda
bitta buyruq bilan o'rnatib ishlatish uchun.

## Skill'lar

| Skill | Tavsif |
|-------|--------|
| [`handoff`](handoff/SKILL.md) | Keyingi (toza kontekstli) agent ishni davom ettira olishi uchun `HANDOFF.md` hujjatini yozadi / yangilaydi. |
| [`use-handoff`](use-handoff/SKILL.md) | Reads an existing `HANDOFF.md` and restores the work in a fresh-context conversation. The inverse of `handoff`. |

## O'rnatish

Skill'larni `~/.claude/skills/` ga ko'chiradi.

### macOS / Linux

```sh
git clone https://github.com/<username>/skills.git
cd skills
./install.sh
```

### Windows (PowerShell)

```powershell
git clone https://github.com/<username>/skills.git
cd skills
pwsh ./install.ps1
```

Yoki `git` siz, to'g'ridan-to'g'ri internetdan:

```sh
curl -fsSL https://raw.githubusercontent.com/<username>/skills/main/install.sh | sh
```

> `<username>` ni o'z GitHub username'ingizga almashtiring.

## Ishlatish

Claude Code ichida skill nomini slash bilan chaqiring:

```
/handoff
/use-handoff [HANDOFF.md yo'li]
```

## Yangi skill qo'shish

1. Repo ichida `skill-nomi/SKILL.md` papka yarating.
2. `SKILL.md` boshiga `name` va `description` frontmatter yozing.
3. README jadvaliga qator qo'shing.
4. `./install.sh` qayta ishga tushiring.
