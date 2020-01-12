MATCHED_PEER=""
MATCHED_PROJ=""

for tbl in $(cat proj.txt)
do 
    echo "$tbl"
    gcloud config set project $tbl

    array=($(gcloud compute networks peerings list | awk '{print $4}' | awk '{if(NR>1)print}'))
    echo "\n\n"

    for p1 in $(echo $array)
    
    do
      echo " peering $p1"
      if [ "$PEER_SEARCH" = "$p1" ]
      then
      echo "\n"
      echo "matched@@@@@@"
      MATCHED_PEER=$p1
      MATCHED_PROJ=$tbl
      echo "$p1"
      break
      fi
      continue
    done
done

echo "\n\n\"
echo "Matched peer $MATCHED_PEER and proj $MATCHED_PROJ"
