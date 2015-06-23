
function mysqlmgr_unload
	if test -n "(call $grep installed (mysqlmgr install | psub))"
		mysqlmgr_status
		if test $status = 0
			port.unload mysql5
		else
			log.info "mysql is not loaded"
		end
	else
		log.error "mysql not installed"
	end
end

function mysqlmgr_load
	if test -n "(call $grep installed (mysqlmgr install | psub))"
		mysqlmgr_status
		if test $status = 1
			port.load mysql5
		else
			log.info "mysql is already loaded"
		end
	else
		log.info "mysql not installed, installing"
		mysqlmgr_install
		if test $status = 0
			port.load mysql5
		else
			log.error "mysql failed to install"
		end
	end
end

function mysqlmgr_status
	set -l mysqlstatus (ps -e | grep mysql5 | grep /opt/local)
	if test -n "$mysqlstatus"
		log.info running
		return 0
	else
		log.info not running
		return 1
	end
end

function mysqlmgr_uninstall
	if test -n "(call $grep mysql5 (call $port installed | psub))"
		port.uninstall mysql_select mysql5-server mysql5
	end
	if test -L "$hos_bin/mysql"
		call "rm -f $hos_bin/mysql"
	end
	if test -L "$hos_bin/mysqldump"
		call "rm -f $hos_bin/mysqldump"
	end
	if test -L "$hos_bin/mysqladmin"
		call "rm -f $hos_bin/mysqladmin"
	end
	if not test -n "(call $grep mysql5 (call $port installed | psub))" -a -L "$hos_bin/mysql" -a -L "$hos_bin/mysqldump" -a -L "$hos_bin/mysqladmin"
		echo uninstalled
	else
		echo failed
	end
end
# 	sudo -u mysql mysql_install_db5
function mysqlmgr_install
	if test -n "(call $grep mysql5 (call $port installed | psub))"
		port.require mysql5 mysql5-server mysql_select
	end
	if not test -L "$hos_bin/mysql"
		call "ln -s /opt/local/bin/mysql5 $hos_bin/mysql"
	end
	if not test -L "$hos_bin/mysqldump"
		call "ln -s  /opt/local/bin/mysqldump5 $hos_bin/mysqldump"
	end
	if not test -L "$hos_bin/mysqladmin"
		call "ln -s  /opt/local/lib/mysql5/bin/mysqladmin $hos_bin/mysqladmin"
	end

	find.program "mysql_install_db5"
	call "$sudo -u mysql $mysql_install_db5"

	find.program "mysqladmin"
	call "$mysqladmin -u root password ''"

	if test -n "(call $grep mysql5 (call $port installed | psub))" -a -L "$hos_bin/mysql" -a -L "$hos_bin/mysqldump" -a -L "$hos_bin/mysqladmin"
		echo installed
		return 0
	else
		echo failed
		return 1
	end
end

function mysql_exec
	echo "$argv"
	mysql -u root -e "$argv"
end

function mysqlmgr
	if test (count $argv) = 1
		switch $argv[1]
			case install
				mysqlmgr_install
			case uninstall
				mysqlmgr_uninstall
			case load
				mysqlmgr_load
			case unload
				mysqlmgr_unload
			case status
				mysqlmgr_status
			case '*'
				err.novalid
		end
	else if test (count $argv) -gt 1
				switch $argv[1]
				case exec
					mysql_exec $argv[2..(count $argv)]
				case '*'
					err.novalid
				end
			end
end
