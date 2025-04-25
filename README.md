# 🕙 Mattermost Daily Reminder Bot (with holiday check)

![img.png](docs/img.png)

A lightweight daily reminder bot for your Mattermost - but **with respect for holidays** 😉  
Written in Bash. Simple, clean, and ready to plug into your `cron`.

## 🔧 How it works

1. The script gets today’s date.
2. It checks [openholidaysapi.org](https://openholidaysapi.org/) to see if today is a public holiday in Poland.
3. If it’s not - it sends a message to a selected Mattermost channel via webhook.

## 📦 Requirements

- a system with `bash`
- `curl` installed
- a working Mattermost incoming webhook
- (optional) `cron` for automation

## 🚀 Installation & usage

1. Copy `daily_reminder.sh` into your project or your bots directory.
2. Make it executable:

```shell
chmod +x daily_reminder.sh
```

3. Edit config variables at the top of the file:
```shell
WEBHOOK_URL="https://mattermost.yourdomain.com/hooks/abc"
CHANNEL="daily"
USERNAME="Grzegorz"
COUNTRY="PL"
```

4. Run it:
```shell
./daily_reminder.sh
```

### 🕰 Automate with cron

To run it every weekday at 09:58 (2 minutes before your daily starts):

```shell
58 9 * * 1-5 /path/to/daily_reminder.sh >> /var/log/daily_reminder.log 2>&1
```
📌 1-5 = Monday to Friday

🧪 Example message
```text
@channel
#### Time for our daily at *10:00* 🎉  
👉 Join us here 💻🎙️ [Google Meet link]  
**We’re starting in a moment – see you there! 👀**
```
🌍 Support for other countries and languages
Works with any country/language supported by the API – just change:

```shell
COUNTRY="DE"
```
You’ll find ISO code lists in the docs at openholidaysapi.org.

🤝 Contribute
Got ideas or improvements? PRs and issue reports are welcome!

📜 License
MIT - use it freely, just mention me or leave a ⭐ if you like it.

✉️ Author
Created by Jacek Labudda
Inspired by a simple rule: “don’t spam people on holidays” 😉