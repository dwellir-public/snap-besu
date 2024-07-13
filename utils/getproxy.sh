#!/bin/sh

get_proxy_options() {
    proxy_options=""

    for var in http https; do
        proxy=$(printenv "${var}_proxy")

        if [ -n "$proxy" ]; then
            # Remove trailing /
            proxy=$(echo "$proxy" | sed 's|/$||')
            # Extract hostname and port using POSIX-compatible tools
            proto="$(echo $proxy | sed -e's,^\(.*://\).*,\1,g')"
            url=$(echo $proxy | sed -e s,$proto,,g)
            hostname=$(echo $url | cut -d: -f1)
            port=$(echo $url | cut -d: -f2)
            proxy_options="${proxy_options} -D${var}.proxyHost=${hostname}"
            if [ -n "$port" ]; then
                proxy_options="${proxy_options} -D${var}.proxyPort=${port}"
            fi
        fi
    done

    echo "$proxy_options"
}

# Call the function and store the result
proxy_options=$(get_proxy_options)

# Print the proxy options
echo "$proxy_options"

