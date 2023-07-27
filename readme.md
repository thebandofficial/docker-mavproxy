# MAVProxy container

## Relay local Seral device to UDP

For ```/dev/ttyUSB0```:
```bash
docker run --rm --device=/dev/ttyUSB0 -v $(pwd):/var/log/mavproxy/ --net=host -it mavproxy /bin/bash -c "run_mavproxy --master=/dev/ttyUSB0,57600 --out=udp:127.0.0.1:14550 --out=udp:127.0.0.1:14551"
```


For ```/dev/ttyAMA0```:
```bash
docker run --rm --device=/dev/ttyAMA0 -v $(pwd):/var/log/mavproxy/ --net=host -it mavproxy /bin/bash -c "run_mavproxy --master=/dev/ttyAMA0,57600 --out=udp:127.0.0.1:14550 --out=udp:127.0.0.1:14551"
```

For ```/dev/ttyACM0```:
```bash
docker run --rm --device=/dev/ttyACM0 -v $(pwd):/var/log/mavproxy/ --net=host -it mavproxy /bin/bash -c "run_mavproxy --master=/dev/ttyACM0,57600 --out=udp:127.0.0.1:14550 --out=udp:127.0.0.1:14551"
```

Usb connection and Broadcast:
```bash
 docker run \
    --name mavproxy-broadcast-ACM0 \
    --rm \
    --device=/dev/ttyACM0 \
    -v $(pwd):/var/log/mavproxy/ \
    --net=host \
    -it mavproxy \
    /bin/bash -c "run_mavproxy \ 
        --master=/dev/ttyACM0,57600
        --out=udpbcast:10.0.0.255:14550 \
        --out=udpbcast:10.0.0.255:14551"
```

Board direct conncetion and broadcast
```bash
 docker run \
      --name mavproxy-broadcast-THS0 \
      --rm \
      --device=/dev/ttyTHS0 \
      -v $(pwd):/var/log/mavproxy/ \
      --net=host
      -it mavproxy \
      /bin/bash -c "run_mavproxy \ 
        --master=ttyTHS0,57600
        --out=udpbcast:10.0.0.255:14550 \
        --out=udpbcast:10.0.0.255:14551"
```

For QA with ```/dev/ttyACM0```:
```bash
docker run \
        --name mavproxy-qa \
        --device=/dev/ttyACM0 \
        -v $(pwd):/var/log/mavproxy/ \
        --net=host \
        -d \
        --restart unless-stopped \
        -it mavproxy \
        /bin/bash -c "run_mavproxy \
                --master=/dev/ttyACM0,57600 \
                --out=udp:10.0.0.34:14550 \
                --out=udp:10.0.0.34:14551"
```
Attache QA doker 
```bash
docker attach mavproxy-qa 
```


Delete logs
```bash
sudo rm -rf 202*
```
Teroubleshooting:
```bash
lsusb
ls /dev/ttyACM*
```



## More information
* [MAVProxy installation manual](https://ardupilot.org/mavproxy/)
