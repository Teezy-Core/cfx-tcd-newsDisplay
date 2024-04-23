fx_version 'cerulean'
game 'gta5'

name "cfx-tcd-newsDisplay"
description "A Simple News Display Script"
author "Teezy Core Development"
version "1.0.0"

shared_scripts {
	'config.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

escrow_ignore {
	'server/*.lua',
	'client/*.lua',
	'config.lua'
}