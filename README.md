# disable-hyperthreading
Disable the annoying hyperthreaded cores

This systemd service is for disabling the fake cores (ie: hyperthreaded cores)
that comes with many processors nowadays.

The idea is to automatically shutdown those fake cores at boot while allowing
to enable them manually if necessary. Most of the time I don't benefit at all
of that techonoloy and I try no to keep useless stuff around.

## Installing
Copy `disable-ht.service` to `/etc/systemd/system/`

Copy `disableht.sh` to `/usr/local/sbin/`

Optional: make the service start at boot `systemctl enable disable-ht`

Optional: run it with `systemctl start disable-ht`

## Check it worked
```
$ systemctl is-active disable-ht
active
```

```
$ grep processor /proc/cpuinfo 
processor       : 0
processor       : 1
processor       : 2
processor       : 3
```

```
$ ls /sys/devices/system/node/node0/ | grep cpu
cpu0
cpu1
cpu2
cpu3
cpu4
cpu5
cpu6
cpu7
cpulist
cpumap
```


