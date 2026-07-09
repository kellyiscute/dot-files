function updateQQ
    set data $(curl 'https://cdn-go.cn/qq-web/im.qq.com_new/latest/rainbow/pcConfig.json' \
        -H 'accept: */*' \
        -H 'origin: https://im.qq.com' \
        -H 'priority: u=1, i' \
        -H 'referer: https://im.qq.com/' \
        -H 'sec-ch-ua: "Not(A:Brand";v="8", "Chromium";v="144", "Brave";v="144"' \
        -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36' \
        -s \
    | jq '.Linux')

    set newVer $(echo $data | jq -r '.version')
    set dlUrl $(echo $data | jq -r '.x64DownloadUrl.appimage')

    echo "{ \"ver\": \"$ver\", \"dl\": \"$dl\" }"

  touch .ver # Ensure .ver file exists
  set curVer (cat .ver)
  if test -z "$curVer"
      echo "No version found, updating..."
  else if [ "$curVer" = "$newVer" ]
      echo "Already up to date."
      exit 0
  else
    echo "New version found: $newVer (current: $curVer), updating..."
    echo "Downloading new version from $dlUrl"
    set tmp (mktemp tmp-qq.XXXXXX)
    wget -O $tmp "$dlUrl"
    echo "Copying new version"
    sudo cp $tmp /opt/QQ/QQ.AppImage
    echo "Writing new version"
    echo $newVer > .ver
    echo "Cleaning up"
    rm $tmp
    echo "Update complete."
  end

end
