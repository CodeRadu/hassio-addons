#!/usr/bin/with-contenv bashio

path_to_page=$(bashio::config 'page_folder_path')

echo Starting web server
node server.js $path_to_page
