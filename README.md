## Brief
Docker image with Mattermost Bot (https://github.com/LPgenerator/mattermost\_bot)

## Environment variables
- `MATTERMOST_BOT_SSL_VERIFY`: whether to perform SSL cert verification, defaults to `True`
- `MATTERMOST_BOT_URL`: the Mattermost API URL (see below)
- `MATTERMOST_BOT_LOGIN`: the bot login
- `MATTERMOST_BOT_PASSWORD`: the bot password
- `MATTERMOST_BOT_TEAM`: the Mattermost team to join
- `MATTERMOST_BOT_DEBUG`: set to `True` to enable debug mode, defaults to `False`
- `MATTERMOST_BOT_PLUGINS_ONLY_DOC`: set to `True` to disable regexp in help message, defaults to `False`
- `MATTERMOST_BOT_WORKERS`: the bot number of workers, defaults to `10`

### Alternative to MATTERMOST\_BOT\_URL
- `MATTERMOST_DOMAIN`: the Mattermost domain (**without** `http://`)
- `MATTERMOST_API_VERSION`: the Mattermost API version, defaults to `v3`

## Volumes
- `/plugins`: the plugin files (see *Plugins*)

## Plugins
Plugins must be either in `/plugins` or in a direct subdirectory of `/plugins`. `/plugins` **must** contain a `__init__.py` file. Subdirectories not containing `__init__.py` file are allowed and will be ignored.
