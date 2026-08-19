# ThinkorSwim Watchlist Converter
# Converts emoji-prefixed .txt files from ~/Downloads to ThinkorSwim format

# Generic watchlist processor
_process_watchlist() {
  local emoji="$1"
  local download_dir="$HOME/Downloads"
  local output_file="$download_dir/tos_watchlist.txt"
  local files=($download_dir/${emoji}_*.txt(N))

  if [[ ${#files[@]} -eq 0 ]]; then
    echo "No files matching ${emoji}_*.txt found in $download_dir"
    return 1
  fi

  local latest_file=${files[1]}
  if [[ ${#files[@]} -gt 1 ]]; then
    echo "Multiple files found. Using most recent:"
    latest_file=$(ls -t "${files[@]}" | head -1)
  fi

  echo "Processing: $(basename "$latest_file")"
  echo ""

  sed 's/[A-Z]*://g' <"$latest_file" | tr ',' '\n' >"$output_file"

  echo "✓ Conversion complete!"
  echo "Output saved to: $output_file"
  echo ""
  echo "Tickers:"
  cat "$output_file"

  if [[ "$OSTYPE" == "darwin"* ]]; then
    pbcopy <"$output_file"
    echo ""
    echo "✓ Copied to clipboard!"
  fi
}

bear() { _process_watchlist "🐻"; }
bull() { _process_watchlist "🐂"; }
watchlist() { _process_watchlist "👀"; }

alias tiny='tinypng -k="$TINYPNG_API_KEY"'
alias tiny1='tinypng -k="$TINYPNG_API_KEY_2"'
alias t='tinypng -k="$TINYPNG_API_KEY" *.(png|jpg|JPG)'

# API keys / tokens / webhooks live in zsh/secrets.zsh (gitignored)
alias hh='hedgehog -k "$HEDGEHOG_API_KEY"'
