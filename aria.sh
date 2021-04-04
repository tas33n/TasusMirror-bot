TRACKERS=$(curl -Ns https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt | awk '$1' | tr '\n' ',')

aria2c \
--allow-overwrite=true \
--bt-max-peers=0 \
--bt-tracker="[$TRACKERS]" \
--check-certificate=false \
--daemon=true \
--enable-rpc \
--follow-torrent=mem \
--max-concurrent-downloads=4 \
--max-connection-per-server=10 \
--max-overall-download-limit=0 \
--max-overall-upload-limit=1K \
--min-split-size=10M \
--rpc-listen-all=false \
--rpc-listen-port=6800 \
--rpc-max-request-size=1024M \
--seed-time=0.01 \
--split=10
