fx_version 'adamant'

game 'gta5'

version '0.1'

server_scripts {
    'server/main.lua',
	'config.lua',
	'@mysql-async/lib/MySQL.lua'
}

client_scripts {
	'config.lua',
    'client/main.lua'
}
