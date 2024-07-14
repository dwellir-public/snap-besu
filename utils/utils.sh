#!/bin/sh

# Logs to journalctl. Watch with e.g. journalctl -t SNAP_NAME -f
log()
{
    logger -t ${SNAP_NAME} -- "$1"
}

restart_besu()
{
    besu_status="$(snapctl services besu)"
    current_status=$(echo "$besu_status" | awk 'NR==2 {print $3}')
    if [ "$current_status" = "active" ]; then
        snapctl restart besu
    fi
}
