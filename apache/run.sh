#!/bin/bash

source /etc/apache2/envvars
exec apache2 -D FOREGROUND

sh /set_env.sh
