# Bing Image of the day Desktop Wallpaper on Mac OS

## Manual Install

A required dependency of this package is `jq` and `sleepwatcher`, install with [homebrew](https://brew.sh/) with:

```bash
brew install jq sleepwatcher
```

Clone the repository and run the install script.

```bash
git clone https://github.com/mgwidmann/bing-image-of-the-day.git
cd bing-image-of-the-day/
./install.sh
```

You will be prompted to allow for setting up the cron (a background process) which runs every day at 15:05 UTC (11:05 PM EST) to update the wallpaper. Additionally, since this won't work if the computer is not awake, a login script is also installed when the computer is logged in or unlocked. Click Allow to allow the install script to do this.

## Uninstall

```bash
git clone https://github.com/mgwidmann/bing-image-of-the-day.git
cd bing-image-of-the-day/
./uninstall.sh
cd ..
rm -rf bing-image-of-the-day
```

If you don't want to keep `jq` or `sleepwatcher` for other uses, remove them with [homebrew](https://brew.sh/) with:

```bash
brew remove jq sleepwatcher
```

All traces of this application have been removed from your system.