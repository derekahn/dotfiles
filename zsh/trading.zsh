function gaps() {
  # Set up paths
  DOWNLOAD_DIR="$HOME/Downloads"
  PROGRAM_DIR="$HOME/code/gaps-list/"
  INPUT_FILE="Gaps  & Earnings - Gaps List.csv"
  FORMATTED_OUTPUT="🕳️ gaps.csv"

  # Move downloaded file to watchlist directory
  mv "$DOWNLOAD_DIR/$INPUT_FILE" "$PROGRAM_DIR/"
  cd "$PROGRAM_DIR/"

  # Clean up previous files
  rm -f complete_list.csv \
    price_cache.json \
    volume_cache.json \
    filtered_list_report.txt \
    filtered_list.csv \
    2>/dev/null || true

  # Process data
  echo "Formatting data..."
  node format.js

  echo "Filtering tickers..."
  node filter.js

  # Move result back to downloads
  cp filtered_list.csv "$FORMATTED_OUTPUT"
  mv "$FORMATTED_OUTPUT" "$DOWNLOAD_DIR/"

  # Return to downloads directory
  cd "$DOWNLOAD_DIR/"

  echo "✅ Process complete! Filtered gaps file available in Downloads."
}

function earn() {
  # Set up paths
  DOWNLOAD_DIR="$HOME/Downloads"
  PROGRAM_DIR="$HOME/code/earnings-list/"
  INPUT_FILE="Gaps  & Earnings - Earnings List.csv"
  FORMATTED_OUTPUT="💰 earnings.csv"

  # Move downloaded file to watchlist directory
  mv "$DOWNLOAD_DIR/$INPUT_FILE" "$PROGRAM_DIR/"
  cd "$PROGRAM_DIR/"

  # Clean up previous files
  rm -f earnings.csv \
    2>/dev/null || true

  # Process data
  echo "Formatting data..."
  node format.js

  # Move result back to downloads
  cp earnings.csv "$FORMATTED_OUTPUT"
  mv "$FORMATTED_OUTPUT" "$DOWNLOAD_DIR/"

  # Return to downloads directory
  cd "$DOWNLOAD_DIR/"

  echo "✅ Process complete! Formated earnings file available in Downloads."
}

alias tiny="tinypng -k=REDACTED_TINYPNG_KEY_1"
alias tiny1="tinypng -k=REDACTED_TINYPNG_KEY_2"

alias t="tinypng *.(png|jpg|JPG)"
