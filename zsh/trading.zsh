# ThinkorSwim Watchlist Converter
# Converts 🐻_*.txt files from ~/Downloads to ThinkorSwim format
tos() {
    local download_dir="$HOME/Downloads"
    local output_file="$download_dir/tos_watchlist.txt"
    local files=($download_dir/🐻_*.txt(N))
    
    if [[ ${#files[@]} -eq 0 ]]; then
        echo "No files matching 🐻_*.txt found in $download_dir"
        return 1
    fi
    
    local latest_file=${files[1]}
    if [[ ${#files[@]} -gt 1 ]]; then
        echo "Multiple files found. Using most recent:"
        latest_file=$(ls -t "${files[@]}" | head -1)
    fi
    
    echo "Processing: $(basename "$latest_file")"
    echo ""
    
    sed 's/[A-Z]*://g' "$latest_file" | tr ',' '\n' > "$output_file"
    
    echo "✓ Conversion complete!"
    echo "Output saved to: $output_file"
    echo ""
    echo "Tickers:"
    cat "$output_file"
    
    if [[ "$OSTYPE" == "darwin"* ]]; then
        cat "$output_file" | pbcopy
        echo ""
        echo "✓ Copied to clipboard!"
    fi
}

function gaps() {
  # Set up paths
  DOWNLOAD_DIR="$HOME/Downloads"
  PROGRAM_DIR="$HOME/Code/pristine_trader_gaps"
  # INPUT_FILE="Gaps  & Earnings - Gaps List.xlsx"
  INPUT_FILE="Gaps  & Earnings.xlsx"
  FORMATTED_OUTPUT="🕳️.txt"

  # Move downloaded file to watchlist directory
  rm -rf "$PROGRAM_DIR/$FORMATTED_OUTPUT" "$PROGRAM_DIR/$INPUT_FILE"
  mv "$DOWNLOAD_DIR/$INPUT_FILE" "$PROGRAM_DIR/"
  cd "$PROGRAM_DIR/"

  # Process data
  node converter.js

  # Move result back to downloads
  mv "$FORMATTED_OUTPUT" "$DOWNLOAD_DIR/"

  # Return to downloads directory
  cd "$DOWNLOAD_DIR/"

  echo "✅ Process complete! Filtered gaps file available in Downloads."
}

alias tiny="tinypng -k=REDACTED_TINYPNG_KEY_1"
alias tiny1="tinypng -k=REDACTED_TINYPNG_KEY_2"

alias t="tinypng *.(png|jpg|JPG)"
