old_version="$(curl http://localhost:3022/status | jq '.imageStatus' | jq 'keys[0]')"
curl http://localhost:3022/pullImage/$CI_VERSION ｜ jq '.'
echo "$(date "+%F-%H-%M-%S") start to check update status"
while :
do
    length="$(curl http://localhost:3022/status | jq '.imageStatus | length')"
    if [ $length == 1 ]; then
        current_version="$(curl http://localhost:3022/status | jq '.imageStatus' | jq 'keys[0]')"
        if [ "$current_version" == "$old_version" ]; then
          break
        fi
  fi
done
echo "$(date "+%F-%H-%M-%S") update image successfully"
curl http://localhost:3022/updateContainer