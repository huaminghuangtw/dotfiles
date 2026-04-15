export PATH=/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/opt/homebrew/bin:/opt/homebrew/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR="code -w"

export GPG_TTY=$(tty)
export PATH="/Library/TeX/texbin:$PATH"
export PATH=$PATH:/Users/huaminghuang/Library/Python/3.9/bin/

alias zshconfig='code ~/.zshrc'
alias disable-animations='defaults write -g NSAutomaticWindowAnimationsEnabled -bool false'
alias killcsd='killall corespeechd'
alias auto-backup='"/Users/huaminghuang/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second-Brain/Scripts/auto-backup.sh" "$(pwd)"'
# pnpm
export PNPM_HOME="/Users/huaminghuang/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
alias dotfiles='/usr/bin/git --git-dir=/Users/huaminghuang/.dotfiles/ --work-tree=/Users/huaminghuang'
