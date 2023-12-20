#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
# ==============================================================================
# Home Assistant Community Add-on: Happy Bubbles
# Configures NGINX
# ==============================================================================
declare port
declare certfile
declare dns_host
declare ingress_interface
declare ingress_entry
declare ingress_port
declare keyfile

port=$(bashio::addon.port 80)
if bashio::var.has_value "${port}"; then
    bashio::config.require.ssl

    if bashio::config.true 'ssl'; then
#        certfile=$(bashio::config 'certfile')
#        keyfile=$(bashio::config 'keyfile')
echo "föörst"
#        mv /etc/nginx/servers/direct-ssl.disabled /etc/nginx/servers/direct.conf
#        sed -i "s#%%certfile%%#${certfile}#g" /etc/nginx/servers/direct.conf
#        sed -i "s#%%keyfile%%#${keyfile}#g" /etc/nginx/servers/direct.conf

    else
    echo "secööönd"
     #       mv /etc/nginx/servers/direct.disabled /etc/nginx/servers/direct.conf
    fi
    echo "sööörd"
#    ingress_entry=$(bashio::addon.ingress_entry)
#    sed -i "s#%%ingress_entry%%#${ingress_entry}#g" /etc/nginx/servers/direct.conf
fi

#ingress_port=$(bashio::addon.ingress_port)
#ingress_interface=$(bashio::addon.ip_address)
#sed -i "s/%%port%%/${ingress_port}/g" /etc/nginx/servers/ingress.conf
#sed -i "s/%%interface%%/${ingress_interface}/g" /etc/nginx/servers/ingress.conf
#
#dns_host=$(bashio::dns.host)
#sed -i "s/%%dns_host%%/${dns_host}/g" /etc/nginx/includes/resolver.conf
