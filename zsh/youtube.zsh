# IMPORTANT: Must be executed in ~/Movies/youtube/
# uploadTrade trade.mp4 tsla short 2 be
function upload() {
  local filename="$1"
  local ticker="$2"
  local bias="${3:-long}"
  local trade_num="${4:-0}"
  local result="${5:-w}"
  
  # Get the current date in the desired format
  local current_date=$(date +'%m/%d/%Y %A')
  
  # Construct the title using the current date and the formatted time
  local title="$current_date ${ticker:u} ${bias:u} (Trade-$trade_num ${result:u})"
  
  # Call the youtubeuploader command with the appropriate arguments
  echo "\nuploading:"
  echo "filename = $filename"
  echo "title = $title\n"

  youtubeuploader -filename "$filename" -title "$title" -metaJSON "meta.json"
}

# IMPORTANT: Must be executed in ~/Movies/youtube/
# uploadTrade trade.mp4 tsla short 2 be
function uploadY() {
  local filename="$1"
  local ticker="$2"
  local bias="${3:-long}"
  local trade_num="${4:-0}"
  local result="${5:-w}"
  
  # Get the current date minus one day in the desired format (macOS)
  local current_date=$(date -v-1d +'%m/%d/%Y %A')
  
  # Construct the title using the modified date and the formatted time
  local title="$current_date ${ticker:u} ${bias:u} (Trade-$trade_num ${result:u})"
  
  # Call the youtubeuploader command with the appropriate arguments
  echo "\nuploading:"
  echo "filename = $filename"
  echo "title = $title\n"

  youtubeuploader -filename "$filename" -title "$title" -metaJSON "meta.json"
}
