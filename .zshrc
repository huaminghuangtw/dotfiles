export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:/usr/local/bin:/opt/homebrew/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/Library/TeX/texbin:$PATH"
export PATH="$PATH:/Applications/Obsidian.app/Contents/MacOS"

alias zshcfg='code ~/.zshrc'
alias auto-backup='"/Users/huaminghuang/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second-Brain/Scripts/auto-backup.sh" "$(pwd)"'
alias upload-to-r2='python3 "/Users/huaminghuang/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second-Brain/Scripts/upload-to-r2.py" "$(pwd)"'
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

dlyt() {
  local url="$1"
  if [[ -z "$url" ]]; then
    echo "usage: dlyt <url>" >&2
    return 1
  fi

  brew upgrade yt-dlp

  local choice audio=0
  while :; do
    echo "Download as [v]ideo or [a]udio? "
    read -r choice || return 1
    case "${choice:l}" in
      v) audio=0; break ;;
      a) audio=1; break ;;
      *) echo "Please enter 'v' or 'a'." >&2 ;;
    esac
  done

  local args=(-o "$HOME/Downloads/%(title)s.%(ext)s")
  if (( audio )); then
    args+=(-t aac)
  else
    args+=(-t mp4)
  fi

  if [[ "$url" == *pornhub.com* ]]; then
    yt-dlp --referer 'https://www.pornhub.com' "${args[@]}" "$url"
  else
    yt-dlp "${args[@]}" "$url"
  fi
}