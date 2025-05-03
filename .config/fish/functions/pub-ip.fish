function publicIp; 
  set -l ip $(curl https://ipinfo.io/ip)
  echo public ip: $ip
end;
