export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/opt/homebrew/bin:/opt/homebrew/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/Library/TeX/texbin:$PATH"
export PATH="$PATH:/Applications/Obsidian.app/Contents/MacOS"


alias zshcfg='code ~/.zshrc'
alias auto-backup='"/Users/huaminghuang/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second-Brain/Scripts/auto-backup.sh" "$(pwd)"'
alias dotfiles='/usr/bin/git --git-dir=/Users/huaminghuang/.dotfiles/ --work-tree=/Users/huaminghuang'

fixicloudsync() {
  sudo killall bird
}

fixmicrophone () {
  sudo killall corespeechd
  sudo killall coreaudiod
}

fixaudio () {
  sudo rm /Library/Preferences/Audio/com.apple.audio.DeviceSettings.plist
  sudo rm /Library/Preferences/Audio/com.apple.audio.SystemSettings.plist
  sudo killall coreaudiod
}

dlvideo() {
  echo "Enter video url: "
  read url
  if [[ "$url" == *pornhub.com* ]]; then
    yt-dlp --referer 'https://www.pornhub.com' \
      -o "$HOME/Downloads/%(title)s.%(ext)s" "$url"
  else
    yt-dlp -o "$HOME/Downloads/%(title)s.%(ext)s" "$url"
  fi
}