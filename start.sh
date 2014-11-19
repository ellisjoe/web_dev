python -m SimpleHTTPServer >>log/server.log 2>&1 &
echo $! >server.pid

coffee --watch --compile --output lib/ src/ >>log/coffee.log 2>&1 &
echo $! >coffee.pid
