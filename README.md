# Besu - snap

Besu

## Building the snap

Clone the repo, then build with snapcraft

```
sudo snap install snapcraft --classic
cd snap-besu
snapcraft pack --use-lxd --debug --verbosity=debug # Takes some time.
```

## Releasing

When a commit is made to the main branch a build will start in launchpad and if successful release to the edge channel.
To promote further follow the instructions in [this document](TESTING.md)

Promoting can be done either from [this webpage](https://snapcraft.io/besu/releases)
or by running
`snapcraft release besu <revision> <channel>`

NOTE: This is not ready at the moment. Realeasing section will be updated once its ready.

## System requirements


## Install snap

`sudo snap install <snap-file> --devmode`
or from snap store
`sudo snap install besu`

### Configuration
TODO
#### service-args

default=--base-path=$SNAP_COMMON/besu_base --name=<hostname>

Example:

    sudo snap set besu service-args="--foobar"


#### endure

default=false

If true the Besu service will not be restarted after a snap refresh.
Note that the Besu service will still be restarted as the result of changing service-args, etc.

Use this when restarts should be avoided e.g. when running a validator.

### Start the service

`sudo snap start besu`

### Check logs from besu

`sudo snap logs besu -f`

### Stop the service

`sudo snap stop besu`

### Alternatively - use systemd

`sudo systemctl <stop|start> snap.besu.besu-daemon.service`
