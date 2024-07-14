
Besu - Hyperledger Ethereum client.

### Configuration

    # Get the snap default configs
    sudo snap get besu

    # Set defaults service-args
    sudo snap set besu service-args="--network=mainnet --data-path=$SNAP_COMMON/data"

### Set snap not to restart besu after upgrade.

    sudo snap set endure=true

### Start the service

    sudo snap start besu

### Check logs from besu

    sudo snap logs besu -f

### Stop the service

    sudo snap stop besu

### Allow for external storage:
The snap supports using differnt data locations. Allowed locations defined by the snap interface removable-media.

    # Allow the snap to access external data locations
    sudo snap connect besu:removable-media

    # Configure the --data-path to an external location
    sudo snap set besu service-args="--network=mainnet --data-path=/mnt/besu/data"