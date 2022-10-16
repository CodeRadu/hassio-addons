# Configuring

- Create /config/mc/config/config.env with the following:

```
# Autosave interval in minutes (eg. 1, 5, 0.5)
AUTOSAVE_INTERVAL=5
# Auto download papermc server
DOWNLOAD_PAPERMC=true
# Papermc server version
PAPERMC_DOWNLOAD_VERSION=1.19.2
# Papermc server build
PAPERMC_DOWNLOAD_BUILD=214
# Auto start the server on host start
AUTOSTART=true
```

and customize your options

# SSH and SCP access

Use the ip of your home assistant, port set in addon config, user `server` and password set in addon config

The server files can be accessed at `/data/server` or at `/mcpanel/server`

The MCpanel configuration can bee accessed at `/config/mc/config/config.env` or at `/mcpanel/config/config.env`

# Warning

If you want to stop the addon, click shut down host in the MCpanel interface.
Not doing so will force stop the server and may corrupt data.
