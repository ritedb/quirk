#!/bin/bash
RKB="./target/release/quirk"
WORKING_PATH="/tmp/quirk"
rm -rf $WORKING_PATH
SLED_PATH="$WORKING_PATH/sled"
WORKLOAD="$WORKING_PATH/workload"
mkdir -p $SLED_PATH

# generate workload, key size: 32 bytes, value size: 16 KB, batch: 3 puts, batch nums: 30000, read nums: 5000
# ./quirk-bench.sh 16384 30000 5000
$RKB generate_workload "{\"batch\":[{\"put\":[32,$1]},{\"put\":[32,$1]},{\"put\":[32,$1]}]}" $2 > $WORKLOAD

printf "===start==="
printf "\nrun batch put on sled\n"
cat $WORKLOAD | $RKB run sled $SLED_PATH | $RKB report
printf "\nrun random read on sled\n"
cat $WORKLOAD | $RKB sample_workload "{\"exists\":32}" $3 | $RKB run sled $SLED_PATH | $RKB report
printf "\n===end===\n"
