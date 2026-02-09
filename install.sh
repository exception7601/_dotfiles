
# Inspired by
# https://github.com/Homebrew/install/blob/750f6bd7d9ce63d9b47a5f3930d9408577c1c9ce/install.sh

set -eu

# Setup Xcodes

# Setup Homebrew
HOMEBREW_BIN=/usr/local/bin/brew
if [[ -f $HOMEBREW_BIN ]]&> /dev/null; then
  # Export Homebrew to the PATH so it's available to the setup script
  export PATH=$PATH:$HOMEBREW_BIN
  brew update
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

pushd ~

# Get the dotfiles repo
yes | git clone git@github.com:exception7601/_dotfiles.git  ~/.dotfiles

# cd ~/.dotfiles

# Run the setup script
./setup.sh

echo "✅ Basic setup done."
echo "Next steps for you:"
echo ""
echo "- Open Vim and run :PlugInstall"
echo ""

popd
