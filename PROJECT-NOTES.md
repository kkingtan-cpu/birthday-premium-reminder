# 项目记录 Project notes: Birthday & Premium Reminder

This file is the project's memory: what was built, why, and what was decided. Add a new line under "Change log" whenever the app changes.

## 背景 Background
- Owner: an insurance agency manager in Malaysia. (Full private notes are kept outside this repository.)
- Problem: kept forgetting customer birthdays and overdue premiums.
- Fix: a phone-friendly web app that, every Monday, lists this week's birthdays, premiums due soon and overdue premiums, with ready-to-send messages in English and Chinese and a birthday card.

## 在哪里 Where things are
- Live app (private Claude link, shareable from its Share menu): https://claude.ai/artifact/FUjRb221CMVvRjmKczVqAN
- `reminder-app.html`: the whole app in one file. It also works when opened directly in a browser (needs internet for fonts and libraries).
- `HOW-TO-USE.md`: the owner's guide. `FOR-AGENTS.md`: the guide for agents (Chinese + English).
- Monday 8:30am reminder: a scheduled task in the owner's Claude desktop app (`monday-birthday-premium-reminder`).

## 输入 Input
- The agent portal's "Policy Listing" PDF, all pages. The portal splits long listings into several files of up to 500 records.
- One listing gives both birthdays (the policy holder's DOB) and premiums (due date, amount, status).
- The listing has **no phone numbers or emails**.
- The app also accepts Excel, CSV or pasted rows. Photos are not read; copy the text from them instead.

## 规则 Rules agreed
- Remind 3 days ahead; one run covers 7 days.
- Premium reminders only for **Inforce** policies. Skipped: lapsed, terminated, not yet in force, fully paid, premium waived.
- Overdue premiums are shown only up to 90 days; older ones are usually ILP premium holidays. This can be changed in Settings.
- No birthday wish to customers with no in-force policy, or whose policy record shows a death. If a family member's policy ended because of a death, the card shows a "please check" note.
- Several policies due on the same day go into one message with the total.
- Nothing is guessed: rows that can't be read are left out and listed under "Rows to check".
- The app never sends anything itself; the agent always presses Send in WhatsApp.
- Customer data is processed only on the device. **Real customer data must never be put into the published app or into this repository.**

## 用户的选择 Owner's choices
- Messages in **English + Chinese only** (Malay was removed on request).
- Birthday greetings are sent **together with the birthday card**. WhatsApp links carry text only, so the flow is: save or copy the card → open WhatsApp and send the greeting → attach the card. On phones that support it, "Share card + message" sends both at once.
- Card styles: 金色典雅 Elegant gold (default), 红色喜庆 Chinese red (福 under 55, 寿 at 55+), 花卉 Floral, 气球 Balloons.
- WhatsApp works without phone numbers: leave the number empty and pick the chat, or type it once and the app remembers it on that device.
- The owner asked to link ChatGPT for the card design. That isn't possible, so the cards were redesigned inside the app instead.

## 待办 Open ideas
- "Team mode" for the agents (a group-wide weekly summary): offered, not yet requested.

## 修改记录 Change log
- 2026-11-19: First version. Excel/CSV/PDF input, English + Malay messages, PDF export, Monday reminder.
- 2026-11-19: Added a reader for the Policy Listing PDF. Tested on a real listing on the owner's computer (customer data not stored here).
- 2026-11-19: Switched messages to English + Chinese.
- 2026-11-19: WhatsApp works without phone numbers.
- 2026-11-20: Four new birthday card styles; smaller PDF files.
- 2026-11-20: The birthday card is sent together with the greeting.
- 2026-11-20: Shared with agents; guide for agents added; moved to GitHub.
- 2026-11-20: Personal details removed; repository made public.
- 2026-11-21: Web page for the team on GitHub Pages (index.html, built from reminder-app.html by build-index.ps1).
- 2026-11-21: The loaded list is remembered on the phone (browser storage only, never uploaded); Clear saved list button; can be turned off in Settings.
- 2026-11-21: Installable on Android and iPhone home screens: app icon (calendar, cake and RM coin), manifest, Install app button.
- 2026-11-21: Install poster with QR code for the team (share/install-poster.png, share/qr-code.png).
- 2026-11-21: Branded QR code (share/qr-designed.png; share/qr-code.png now has the icon in the centre). Verified to decode.
