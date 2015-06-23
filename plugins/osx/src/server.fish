# #!/usr/bin/env fish
# # . $_server_core
#
# set servermgr_version "0.1a"
# set servermgr_date "Dec 25 2012"
#
# # set server_debug false
# #
# # function srv_debug
# #     if test $server_debug = true
# #     	echo (yellow) $argv
# #     end
# # end
#
# function servermgr_help -d "Prints help for servermgr"
# echo "Usage: servermgr [ -hvd ] [ list | install | start | stop | status ] [ service ]"
# echo "-h, --help     display this message"
# echo "-v, --version  display version information"
# echo "-d, --debug    display debug information"
# echo ""
# end
#
# function servermgr_version -d "Prints version for servermgr"
# echo "Server Manager for Mac OS X"
# echo "Version: $servermgr_version -- $servermgr_date"
# end
#
# function servermgr_list -d "Lists servermgr services"
# 	# srv_debug "Debug"
# 	echo (green) "----------------------" (normal)
# 	echo (green) "  Available services  " (normal)
# 	echo (green) "----------------------" (normal)
# 	for service in $_server_services
# 	echo (green) [ $service ] (normal)
# 	end
# end
#
# function servermgr_install -d "Installs a service"
# 	set found false
# 	for service in $_server_services
# 		if test $argv = $service
# 			set found true
# 			linfo "Installing service : $argv"
# 			. $_server/services/$service/install
# 		end
# 	end
# 	if test $found = false
#     	lerror "Service not found : $argv"
#     end
# end
#
# function servermgr_parseoptions
# 	set numargs (count $argv)
# 	if test $numargs = 0
# 		servermgr_version
# 		servermgr_help
# 	else
# 		set counter 0;
# 		for arg in $argv
# 			set counter (math $counter+1)
# 			switch $arg
# 			case '-h' '--help'
# 				servermgr_help
# 				exit
# 			case '-v' '--version'
# 				servermgr_version
# 				exit
# 			case '-d' '--debug'
# 				set server_debug true
# 			case 'list'
# 				servermgr_list
# 				break
# 			case 'install'
# 				set cnt (math $counter + 1)
# 				servermgr_install "$argv[$cnt]"
# 				break
# 			case 'start'
# 				set cnt (math $counter + 1)
# 				servermgr_start "$argv[$cnt]"
# 				break
# 			case 'stop'
# 				set cnt (math $counter + 1)
# 				servermgr_stop "$argv[$cnt]"
# 				break
# 			case 'status'
# 				set cnt (math $counter + 1)
# 				servermgr_status "$argv[$cnt]"
# 				break
# 			case '*'
# 				lerror "unspecified command";
# 			end
# 			srv_debug $counter
# 			srv_debug $argv[$counter]
# 		end
# 	end
# end
#
# servermgr_parseoptions $argv;
#
# # if set -q argv[1]
#
# #   	switch $argv
#
# #   	case '-h'
# #   	servermgr_help
#
# #   	case '--help'
# #    	servermgr_help
#
# #   	case '-v'
# #   	servermgr_version
#
# #   	case '--version'
# #   	servermgr_version
#
# #   	case 'install'
# #   	servermgr_install $argv[2]
#
# #   	case '*'
# #     echo "unspecified command";
# #     servermgr_help
#
# # 	end
# # else
# # 	servermgr_version
# # 	servermgr_help
# # end
#
#
#
#
# # Usage: serveradmin [-dhvx] [list | start | stop | status | fullstatus | settings | command] [<service_key> [ = <value> ]]
#
# #   -h, --help     display this message
# #   -v, --version  display version info
# #   -d, --debug    print command
# #   -x, --xml      print output as XML plist
# # Examples:
# # serveradmin list
# # 	--Lists all services
# # serveradmin start afp
# # 	--Starts afp server
# # serveradmin stop ftp
# # 	--Stops ftp server
# # serveradmin status web
# # 	--Returns current status of the web server
# # serveradmin fullstatus web
# # 	--Returns more complete status of the web server
# # serveradmin settings afp
# # 	--Returns all afp configuration parameters
# # serveradmin settings afp:guestAccess
# # 	--Returns afp guestAccess attribute
# # serveradmin settings afp:guestAccess = yes
# # 	--Sets afp guestAccess to true
# # serveradmin settings
# # 	--Takes settings commands like above from stdin
# # serveradmin command afp:command = getConnectedUsers
# # 	--Used to perform service specific commands
# # serveradmin command
# # 	--Takes stdin to define generic command that requires other parameters
# set servermgr_version "0.1a"
# set servermgr_date "Dec 25 2012"
#
# function servermgr_help -d "Prints help for servermgr"
# echo "Usage: servermgr [ -hvd ] [ list | install | start | stop | status ] [ service ]"
# echo "-h, --help     display this message"
# echo "-v, --version  display version information"
# echo "-d, --debug    display debug information"
# echo ""
# end
#
# function servermgr_version -d "Prints version for servermgr"
# echo "Server Manager for Mac OS X"
# echo "Version: $servermgr_version -- $servermgr_date"
# end
#
# function servermgr_list -d "Lists servermgr services"
# 	echo (green) "----------------------" (normal)
# 	echo (green) "  Available services  " (normal)
# 	echo (green) "----------------------" (normal)
# 	for service in $_server_services
# 	echo (green) [ $service ] (normal)
# 	end
# end
#
# function servermgr_install -d "Installs a service"
# 	set found false
# 	for service in $_server_services
# 		if test $argv = $service
# 			set found true
# 			linfo "Installing service : $argv"
# 			. $_server/services/$service/install
# 		end
# 	end
# 	if test $found = false
#     	lerror "Service not found : $argv"
#    end
# end
#
# function servermgr_uninstall -d "Uninstalls a service"
# 	set found false
# 	for service in $_server_services
# 		if test $argv = $service
# 			set found true
# 			linfo "Unistalling service : $argv"
# 			. $_server/services/$service/uninstall
# 		end
# 	end
# 	if test $found = false
#     	lerror "Service not found : $argv"
#    end
# end
#
# function servermgr_parseoptions
# 	set numargs (count $argv)
# 	if test $numargs = 0
# 		servermgr_version
# 		servermgr_help
# 	else
# 		set counter 0;
# 		for arg in $argv
# 			set counter (math $counter+1)
# 			switch $arg
# 			case '-h' '--help'
# 				servermgr_help
# 				exit
# 			case '-v' '--version'
# 				servermgr_version
# 				exit
# 			case '-d' '--debug'
# 				set server_debug true
# 			case 'list'
# 				servermgr_list
# 				break
# 			case 'install'
# 				set cnt (math $counter + 1)
# 				servermgr_install "$argv[$cnt]"
# 				break
# 			case 'uninstall'
# 				set cnt (math $counter + 1)
# 				servermgr_uninstall "$argv[$cnt]"
# 				break
# 			case 'start'
# 				set cnt (math $counter + 1)
# 				servermgr_start "$argv[$cnt]"
# 				break
# 			case 'stop'
# 				set cnt (math $counter + 1)
# 				servermgr_stop "$argv[$cnt]"
# 				break
# 			case 'status'
# 				set cnt (math $counter + 1)
# 				servermgr_status "$argv[$cnt]"
# 				break
# 			case '*'
# 				lerror "unspecified command";
# 			end
# 			srv_debug $counter
# 			srv_debug $argv[$counter]
# 		end
# 	end
# end
#
# function servermgr
# 	servermgr_parseoptions $argv;
# end

#
# set servicemgr_version "$hos_version"
#
# function servicemgr_help -d "Prints help for servicemgr"
# log.info "Usage: servicemgr [ -hvd ] [ list | install | start | stop | status ] [ service ]"
# log.info "-h, --help     display this message"
# log.info "-v, --version  display version information"
# end
#
# function servicemgr_version -d "Prints version for servicemgr"
# log.info "Home OS Service Manager"
# log.info "Version: $servicemgr_version"
# end
#
# function servicemgr_getservices
# 	set -e services
# 	cd $services_path
# 	set -l serv_folders (find . -type d | tr -d './')
# 	for folder in $serv_folders
# 		if test -n "$folder"
# 			set -g services $services $folder
# 		end
# 	end
# 	log.debug "Server services: $services"
# 	cd $hosdir
# end
#
# function servicemgr_list -d "Lists servicemgr services"
# 	echo (color.green) "----------------------"
# 	echo (color.normal) "  Available services  "
# 	echo (color.green) "----------------------"
# 	for service in $services
# 		echo (color.green) [ (color.normal) $service (color.green)] (color.normal)
# 	end
# end
#
# function servicemgr_install -d "Installs a service"
# 	set found false
# 	for service in $services
# 		if test $argv[1] = $service
# 			set found true
# 			log.info "Installing service : $argv"
# 			. $services_path/$service/install
# 		end
# 	end
# 	if test $found = false
#     	log.error "Service not found : $argv"
#    end
# end
#
# function servicemgr_uninstall -d "Uninstalls a service"
# 	set found false
# 	for service in $_server_services
# 		if test $argv = $service
# 			set found true
# 			linfo "Unistalling service : $argv"
# 			. $_server/services/$service/uninstall
# 		end
# 	end
# 	if test $found = false
#     	lerror "Service not found : $argv"
#    end
# end
#
# function servicemgr_parseoptions
# 	set numargs (count $argv)
# 	if test $numargs = 0
# 		servicemgr_version
# 		servicemgr_help
# 	else if test $numargs -gt 0 -a $numargs -le 2
# 		switch $argv[1]
# 		case '-h' '--help'
# 			servicemgr_help
# 			exit
# 		case '-v' '--version'
# 			servermgr_version
# 			exit
# 		case 'list'
# 			servicemgr_list
# 		case 'install'
# 			servicemgr_install "$argv[2]"
# 		case 'uninstall'
# 			servicemgr_uninstall "$argv[2]"
# 		case 'start'
# 			servicemgr_start "$argv[2]"
# 		case 'stop'
# 			servicemgr_stop "$argv[2]"
# 		case 'status'
# 			servicemgr_status "$argv[2]"
# 		case '*'
# 			err.novalid
# 		end
# 	else if test $numargs -gt 2
# 		err.toomany
# 	else
# 		err.novalid
# 	end
#
# end
#
# function servicemgr
# 	servicemgr_getservices
# 	servicemgr_parseoptions $argv;
# end

function osx.apache.start
  	call $sudo apachectl start
end

function osx.apache.stop
  	call $sudo apachectl stop
end
