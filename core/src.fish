function src

end


#!/bin/sh

#comment
# 
# dev_projects=(cognitron-git cognitron-monads homeos)
# dev_project_url=(git@github.com:msds/cognitron.git git@monads.info:cognitron.git git@monads.info:homeos.git)
#
# process_args(){
# NO_ARGS=0
# SUPP_ARGS=1
# if [ ! $# -eq "$SUPP_ARGS" ]; then usage ;
# 	echo "enter one command" ;
# else
# 	arg=$1
# 	#echo arg is $1;
# 	# if [ $arg == "init" ]; then init ; fi
# 	# if [ $arg == "update" ]; then update ; fi
# 	if [ $arg == "commit" ]; then commit ; fi
# 	# if [ $arg == "clean" ]; then clean ; fi
# 	# if [ $arg == "usage" ]; then usage ; fi
# 	# if [ $arg == "sub-pull" ]; then sub_pull ; fi
# 	# if [ $arg == "sub-push" ]; then sub_push ; fi
# 	# if [ $arg == "sub-add" ]; then sub_add ; fi
# 	# if [ $arg == "sub-commit" ]; then sub_commit ; fi
# 	# if [ $arg == "sub-checkin" ]; then sub_checkin ; fi
# 	# if [ $arg == "init" ]; then echo "doing init -> " ; fi
# fi
# }
#
# usage(){
# 	echo "Usage: `basename $0` <command>"
# 	echo "You must specify a command"
# 	echo "Try './src status' for more information."
# 	#exit $E_OPTERROR
# 	echo "Available commands are : commit"
# }
#
# init(){
# i=0;
# 	for project in ${dev_projects[@]}
# 	do
# 		echo $project "->" ${dev_project_url[$i]}
# 		if [ ! -d $project ] ; then
# 		echo mkdir $project;
# 		else
# 			echo $project exists;
# 		fi
# 		echo git submodule add ${dev_project_url[$i]} $project;
# 		git submodule add ${dev_project_url[$i]} $project;
# 		let i++;
# 	done
# 	echo git submodule init;
# 	git submodule init;
# 	echo git submodule update;
# 	git submodule update;
# 	sub_pull;
# }
#
# sub_pull(){
# #git pull && git submodule init && git submodule update && git submodule status
# echo " foreach submodule pull changes "
# 	i=0;
# 	for project in ${dev_projects[@]}
# 	do
# 		echo pushing $project "->" ${dev_project_url[$i]}
# 		if [ ! -d $project ] ; then
# 			echo $project does not exist;
# 		else
# 			echo $project exists.;
# 		fi
# 		cd $project;
# 			git pull;
# 		cd ..;
# 		let i++;
# 	done
# 	git submodule foreach git status;
# }
#
# sub_push(){
#
# 	i=0;
# 	for project in ${dev_projects[@]}
# 	do
# 		echo pushing $project "->" ${dev_project_url[$i]}
# 		if [ ! -d $project ] ; then
# 			echo $project does not exist;
# 		else
# 			echo $project exists.;
# 		fi
# 		cd $project;
# 			git push;
# 		cd ..;
# 		let i++;
# 	done
# 	git submodule foreach git status;
#
# }
#
# sub_add(){
# 	i=0;
# 	for project in ${dev_projects[@]}
# 	do
# 		echo pushing $project "->" ${dev_project_url[$i]}
# 		if [ ! -d $project ] ; then
# 			echo $project does not exist;
# 		else
# 			echo $project exists.;
# 		fi
# 		cd $project;
# 			git add . ;
# 		cd ..;
# 		let i++;
# 	done
# 	git submodule foreach git status;
# }
#
# #sub_commit(){
# 	#i=0;
# 	#for project in ${dev_projects[@]}
# 	#do
# 	#	echo pushing $project "->" ${dev_project_url[$i]}
# 	#	if [ ! -d $project ] ; then
# 	#			echo $project does not exist;
# 	#	else
# 	#			echo $project exists.;
# 	#	fi
# 	#	cd $project;
# 	#		git commit -a -m "automated commit";
# 	#	cd ..;
# 	#	let i++;
# 	#done
# 	#git submodule foreach git status;
# #}
#
# sub_checkin(){
# #git pull && git submodule init && git submodule update && git submodule status
# echo "cheking changes "
# 	sub_add;
# 	sub_commit;
# 	sub_push;
# }
#
# clean(){
#
# #git pull && git submodule init && git submodule update && git submodule status
# echo " cleaning "
#
# while true; do
#     read -p "Do you wish to commit and push changes for submodules before cleaning?" yn
#     case $yn in
#         [Yy]* ) sub_checkin; break;;
#         [Nn]* ) break;;
#         * ) echo "Please answer yes or no.";;
#     esac
# done
#
# 	i=0;
# 	for project in ${dev_projects[@]}
# 	do
# 		echo pushing $project "->" ${dev_project_url[$i]}
# 		if [ ! -d $project ] ; then
# 			echo $project does not exist;
# 		else
# 			echo $project exists ;
# 		fi
# 		echo rm -rf $project/*
# 		let i++;
# 	done
#
# echo " cleaning "
# }
#
# update(){
# echo "updating... "
# 	git pull;
# 	sub_pull;
# }
#
# commit(){
# echo "commiting... "
# 	#sub_checkin ;
# 	git add . ;
# 	git commit -a -m "automated commit";
# 	git push;
# }
#
# make_all(){
# echo "making all... "
# current=$(pwd)
# curr_files="$current"/*
#
# #"$PATH_TO_DIRECTORY"/*
#
# echo "$current"
#
# for file in  ${curr_files[@]};
# do
# 	if [ -d $file ] ; then
# 		#echo "its a folder : $file"
# 		cd $file
# 		if [ -f "Makefile" ]; then
# 			echo "executing make -f $file"
# 	 		make
# 		#else
# 		#	echo "no... $file"
# 		fi
# 		cd $current
# 	#else
# 		#echo "its not a folder"
# 	fi
# done
# }
#
# make_clean(){
# echo "making all clean ... "
# current=$(pwd)
# curr_files="$current"/*
#
# #"$PATH_TO_DIRECTORY"/*
#
# echo "$current"
#
# for file in  ${curr_files[@]};
# do
# 	if [ -d $file ] ; then
# 		#echo "its a folder : $file"
# 		cd $file
# 		if [ -f "Makefile" ]; then
# 			echo "executing make clean"
# 	 		make clean
# 		#else
# 		#	echo "no... $file"
# 		fi
# 		cd $current
# 	#else
# 		#echo "its not a folder"
# 	fi
# done
# }
#
#
#
#
# process_args "$@"
#
#
#




# #!/bin/sh
# src=./
# for dir in `ls "$src/"`
# do
# 	# echo $dir
#   if [ -d $src/$dir/.git ]; then
#   	echo "$src/$dir/.git"
#   	echo "OK!"
#     #uh oh - $dir will never match paths with spaces
#   fi
# done



# main ()
# {
# E_OPTERROR=65
# while getopts ":sicnvh" Option
# do
# 	case $Option in

# 		s )
# 			hostname=`echo $@`
# 			hostname2=`echo $hostname|awk '{print $2}'`
# 			echo $hostname2
# 			a=`nmap $hostname2`
# 			echo hashah
# 		;;

# 		i )
# 			echo interactivemode_func
# 		;;

#                 c )
#                     echo   add_serv
#                 ;;
# 		n )
# 		echo	non_interactivemode_func
# 		;;

# 		v )
# 		echo	version_func
# 		;;

# 		h )
# 			echo help_func
# 		;;

# 		* )
# 			echo "Unimplemented option chosen"
# 		;;
# 	esac
# done

# shift $(($OPTIND - 1))

# }
