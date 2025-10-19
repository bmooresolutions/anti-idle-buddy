# Anti-Idle PowerShell Script

## TL;DR  
**Run this to keep your game from idling out while you stuff your face.**

---

## What It Does

This PowerShell script simulates activity on your computer to prevent idle timeouts in video games or other applications. Specifically, it:

- Jiggles your mouse slightly every 32 seconds.
- Holds down the **W** key for 4 seconds every cycle (to simulate movement).

This tricks your game into thinking you're still active, keeping you connected and in motion.

---

## How It Works

The script uses Windows APIs to:

- Move the mouse cursor by 1 pixel and back.
- Send virtual keypress events for the **W** key.
- Repeat these actions in a loop every 32 seconds.

It’s lightweight, easy to run, and doesn’t require any external software.

---

## How to Use

1. Open Notepad and paste the script contents.
2. Save the file as `anti-idle.ps1`.
3. Right-click the file and choose **Run with PowerShell**.
4. Leave it running in the background while you game, snack, or take a break.

> 💡 You may need to run PowerShell as Administrator depending on your system settings.

---

## Disclaimer

Use responsibly. Some games may consider this a form of automation and could penalize you. Always check the game's terms of service before using scripts like this.
