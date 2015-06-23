function osx.user.list
  set -l searchusers "/Search/Users"
  set -l localnode "localhost"
  call $dscl $localnode -list $searchusers
end

function osx.user

  set -l searchusers "/Search/Users"
  set -l localnode "localhost"

  if arg $argv

    set -l user_result (call $grep -i $argv[1] (call $dscl $localnode -list $searchusers | psub))
    if not test -z "$user_result"
      out "$user_result"
      return 0
    else
      return 1
    end
  else
    out (user)
  end
end


function osx.user.create
usermanagement_erasevariables

set -l nargs (count $argv)
set -l rem (math "$nargs % 2")

if [ $rem -eq 0 -a $nargs -gt 1 ]
  set counter 1
  while [ $counter -le $nargs ]
    usermanagement_parseproperty $argv[$counter] $argv[(math $counter+1)]
    set counter (math $counter + 2)
  end
end

if test -z $username
  set good "no"
  while test $good = "no"
    ask "Please enter username"
    set -g username $result
    set -e result
    set -l temp (checkuser $username)
    if test -z $temp
      set good "yes"
    else
      lerror "Username ($temp) already exists."
    end
  end
end

if test -z $uniqueid
  set -l maxid (getmaxuniqueid)
  set -g uniqueid (math "$maxid + 1")
  linfo "Generated UniqueID is: $uniqueid"
end

if test -z $realname
  ask "Please enter $username's real name"
  set -g realname $result
  set -e result
end

if test -z $userhome
  ask "Please enter $username's home directory (/Users/$username)"
  if test -z $result
    set -g userhome "/Users/$username"
  else
    set -g userhome $result
    set -e result
  end
  # echo $userhome
end

if test -z $usershell
  ask "Please enter $username's Shell (/bin/bash)"
  if test -z $result
    set -g usershell "/bin/bash"
  else
    # check that shell exists!
    set -g usershell $result
    set -e result
  end
end

if test -z $userpasswd
  getnewpasswd
  set -g userpasswd $result
  set -e result
end

if test -z $createhome
  askyn "Create home directory for $username?"
  if [ $status -eq 0 ]
    set -g createhome "true"
  else
    set -g createhome "false"
  end
end

linfo "UniqueID   :   $uniqueid"
linfo "UserName   :   $username"
linfo "RealName   :   $realname"
linfo "UserHome   :   $userhome"
linfo "UserShell  :   $usershell"
linfo "UserPasswd :   $userpasswd"
linfo "CreateHome :   $createhome"

# askyn "Agree?"
# if [ $status -eq 0 ]
  linfo "Creating user ($username)"
  getdiradminpw
  call "$dscl -u $diradmin -P $diradminpasswd $node -create $users/$username"
  call "$dscl -u $diradmin -P $diradminpasswd $node -create $users/$username RealName $realname"
  call "$dscl -u $diradmin -P $diradminpasswd $node -create $users/$username PrimaryGroupID 20"
  call "$dscl -u $diradmin -P $diradminpasswd $node -create $users/$username UserShell $usershell"
  call "$dscl -u $diradmin -P $diradminpasswd $node -create $users/$username NFSHomeDirectory $userhome"
  call "$dscl -u $diradmin -P $diradminpasswd $node -create $users/$username UniqueID $uniqueid"
  call "$dscl -u $diradmin -P $diradminpasswd $node -passwd $users/$username $userpasswd"
  if test $createhome = "true"
    call "$sudo createhomedir -b -u $username"
  end

# else
  # lerror "Aborting..."
# end
usermanagement_erasevariables
return 0
end

function osx.user.delete
usermanagement_erasevariables

set -l nargs (count $argv)

if [ $nargs -eq 1 ]
set -g username "$argv[1]"
else
set -g username ""
end

if test -z $username
set good "no"
while test $good = "no"
  ask "Please enter username"
  set -g username $result
  set -e result
  set -l temp (checkuser $username)
  if test -n $temp
    set good "yes"
  else
    lerror "Username ($temp) does not exist."
    break
  end
end
end

linfo "UserName   :   $username"
# askyn "Delete ?"
# if [ $status -eq 0 ]
linfo "Deleting user ($username)"
getdiradminpw
call "$dscl -u $diradmin -P $diradminpasswd $node -delete $users/$username"
# else
# lerror "Aborting..."
# end

usermanagement_erasevariables
end

function osx.user.passwd
  log.info "Please enter password for ($USER) [enter break to stop]"
  set good "no"
  set -l searchnode "/Search"
  while [ $good = "no" ]
    read -l -p prompt.passwd evaluserpasswd
    if test $evaluserpasswd = "break"
      set good "exit"
      break
    end
    set passwdok (call $grep failed (call $dscl $searchnode -authonly $USER $evaluserpasswd | psub ))
    if [ "$passwdok" = "" ]
      set good "yes"
      set -g userpasswd $evaluserpasswd
    else
      log.error "Password failed, try again"
    end
  end
end



function osx.user.max-unique-id
  set -l node (osx.ldapnode)
  set -l users "/Users"
  call $tail -1 (call $sort -ug (call $awk '{print $2}' (call $dscl $node -list $users UniqueID | psub) | psub) | psub )
end

function osx.user.remove
usermanagement_erasevariables

set -l nargs (count $argv)

if [ $nargs -eq 2 ]
 set -g groupname "$argv[2]"
 set -g username "$argv[1]"
else
 set -g username ""
 set -g groupname ""
end

if test -z $username
 set good "no"
 while test $good = "no"
   ask "Please enter username"
   set -g username $result
   set -e result
   set -l temp (checkuser $username)
   if test -n $temp
     set good "yes"
   else
     lerror "Username ($temp) does not exist."
   end
 end
end

if test -z $groupname
 set good "no"
 while test $good = "no"
   ask "Please enter group name"
   set -g groupname $result
   set -e result
   checkgroup $groupname
   if test $status = 0
     set good "yes"
   else
     lerror "Group ($groupname) does not exist, cant't delete"
   end
 end
end

set -l temp (checkuser $username)
if test -n $temp
 linfo "Username ($temp) exists."
else
 lerror "Username ($temp) does not exist."
end

checkgroup $groupname
if test $status = 0
 linfo "Group ($groupname) exists."
else
 lerror "Group ($groupname) does not exist."
end

# askyn "Remove ?"
# if [ $status -eq 0 ]
linfo "Removing user ($username) to group ($groupname)"
getdiradminpw
 call "$dseditgroup -o edit -n $node -u $diradmin -P $diradminpasswd -d $username -t user $groupname"
# else
 # lerror "Aborting..."
# end
usermanagement_erasevariables
# dseditgroup -o edit -a vivek -t user developers
end


#
# set usermgr_version "$hos_version"
#
# function usermgr_help -d "Prints help for servermgr"
# 	log.info "Usage: usermanagement [ command ] [ args ... ]"
# 	log.info ""
# 	log.info "  Available Commands  "
#   log.info "  ------------------  "
#   log.info ""
#   log.info "  createuser   -- Creates a new user "
#   log.info "  creategroup  -- Creates a new group "
#   log.info "  deleteuser   -- Deletes a user "
#   log.info "  deletegroup  -- Deletes a group "
#   log.info "  adduser      -- Adds user to group"
#   log.info "  removeuser   -- Removes user from group"
#   log.info ""
#   log.info "  Arguments "
#   log.info "  --------- "
#   log.info ""
# end
#
# function usermgr_version -d "Prints version for servermgr"
# 	log.info "Home OS User Management"
# 	log.info "Version: $usermgr_version"
# end
#
# function usermgr_debug
#   log.debug "mode is $usermgr_mode"
#   log.debug "node is $usermgr_node"
#   log.debug "diradmin is $usermgr_diradmin"
#   log.debug "dscl is ($dscl)"
#   log.debug "dseditgroup is ($dseditgroup)"
# end
#
# function usermgr_init
#
#   find.program "dscl"
#   find.program "dseditgroup"
#
#   set -g defaultgroups "staff" "Workgroup"
#   set -g admingroup "admin"
#   set -g searchnode "/Search"
#   set -g users "/Users"
#   set -g groups "/Groups"
#
#   set -g usermgr_mode (get.ldapmode)
#
#   set -g usermgr_diradmin (get.diradmin)
#
#   set -g usermgr_node (get.ldapnode)
#   debug usermgr_debug
# end
#
# function usermgr_erasevariables
#   set  -e uniqueid
#   set  -e username
#   set  -e realname
#   set  -e userhome
#   set  -e usershell
#   set  -e userpasswd
#   set  -e createhome
#   set  -e groupname
#   # set  -e diradminpasswd
#   return 0
# end
#
# function usermgr_parseproperty
#   set -l numargs (count $argv)
#   if [ $numargs -gt 1 ]
#     switch $argv[1]
#       case 'uid'
#         set -g uniqueid $argv[2]
#       case 'user'
#         set -g username $argv[2]
#       case 'real'
#         set -g realname $argv[2]
#       case 'home'
#         set -g userhome $argv[2]
#       case 'shell'
#         set -g usershell $argv[2]
#       case 'passwd'
#         set -g userpasswd $argv[2]
#       case 'create'
#         set -g createhome $argv[2]
#     end
#   end
# end
#
# function usermgr_createuser
#
#   usermgr_erasevariables
#
#   set -l nargs (count $argv)
#   set -l rem (math "$nargs % 2")
#
#   if [ $rem -eq 0 -a $nargs -gt 1 ]
#     set counter 1
#     while [ $counter -le $nargs ]
#       usermgr_parseproperty $argv[$counter] $argv[(math $counter+1)]
#       set counter (math $counter + 2)
#     end
#   end
#
#   if test -z $username
#     set good "no"
#     while test $good = "no"
#       ask "Please enter username"
#       set -g username $askresult
#       set -e askresult
#       check.user $username
#       if test $status = 0
#         set good "yes"
#       else
#         log.error "Username ($username) already exists."
#       end
#     end
#   end
#
#   if test -z $uniqueid
#     set -l maxid (get.maxuniqueid)
#     set -g uniqueid (math "$maxid + 1")
#     log.info "Generated UniqueID is: $uniqueid"
#   end
#
#   if test -z $realname
#     ask "Please enter $username's real name"
#     set -g realname $askresult
#     set -e askresult
#   end
#
#   if test -z $userhome
#     ask "Please enter $username's home directory (/Users/$username)"
#     if test -z $askresult
#       set -g userhome "/Users/$username"
#     else
#       set -g userhome $askresult
#       set -e askresult
#     end
#     # echo $userhome
#   end
#
#   if test -z $usershell
#     ask "Please enter $username's Shell (/bin/bash)"
#     if test -z $askresult
#       set -g usershell "/bin/bash"
#     else
#       # check that shell exists!
#       set -g usershell $askresult
#       set -e askresult
#     end
#   end
#
#   if test -z $userpasswd
#     get.newpasswd
#     set -g userpasswd $passwdresult
#     set -e passwdresult
#   end
#
#   if test -z $createhome
#     askyn "Create home directory for $username?"
#     if [ $status -eq 0 ]
#       set -g createhome "true"
#     else
#       set -g createhome "false"
#     end
#   end
#
#   log.info  "UniqueID   :   $uniqueid"
#   log.info  "UserName   :   $username"
#   log.info  "RealName   :   $realname"
#   log.info  "UserHome   :   $userhome"
#   log.info  "UserShell  :   $usershell"
#   log.info  "UserPasswd :   $userpasswd"
#   log.info  "CreateHome :   $createhome"
#
#   # askyn "Agree?"
#   # if [ $status -eq 0 ]
#     log.info "Creating user ($username)"
#     get.diradminpasswd
#     echo $diradminpasswd
#     # exit
#
#     call "$dscl -u $usermgr_diradmin -P $diradminpasswd $usermgr_node -create $users/$username"
#     call "$dscl -u $usermgr_diradmin -P $diradminpasswd $usermgr_node -create $users/$username RealName $realname"
#     call "$dscl -u $usermgr_diradmin -P $diradminpasswd $usermgr_node -create $users/$username PrimaryGroupID 20"
#     call "$dscl -u $usermgr_diradmin -P $diradminpasswd $usermgr_node -create $users/$username UserShell $usershell"
#     call "$dscl -u $usermgr_diradmin -P $diradminpasswd $usermgr_node -create $users/$username NFSHomeDirectory $userhome"
#     call "$dscl -u $usermgr_diradmin -P $diradminpasswd $usermgr_node -create $users/$username UniqueID $uniqueid"
#     call "$dscl -u $usermgr_diradmin -P $diradminpasswd $usermgr_node -passwd $users/$username $userpasswd"
#     if test $createhome = "true"
#       call "$sudo createhomedir -b -u $username"
#     end
#     set -e diradminpasswd
#   # else
#     # lerror "Aborting..."
#   # end
#   usermgr_erasevariables
#   return 0
# end
#
# function usermgr_creategroup
#
#   usermgr_erasevariables
#   set -l nargs (count $argv)
#
#   if [ $nargs -eq 1 ]
#     set groupname "$argv[1]"
#   else
#     set groupname ""
#   end
#
#   if test -z $groupname
#     ask "Please enter group name"
#     set groupname $askresult
#     set -e askresult
#   end
#
#   check.group $groupname
#
#   if test $status = 1
#     log.info "Group ($groupname) does not exist, can create."
#   else
#     log.error "Group ($groupname) already exists."
#   end
#
#   log.info "Group   :   $groupname"
#   # askyn "Create ?"
#   # if [ $status -eq 0 ]
#     log.info "Creating Group ($groupname)"
#     get.diradminpasswd
#     call "$dseditgroup -o create -n $usermgr_node -u $usermgr_diradmin -P $diradminpasswd -r $groupname $groupname"
#     set -e diradminpasswd
#   # else
#     # lerror "Aborting..."
#   # end
#   usermgr_erasevariables
# end
#
# function usermgr_deleteuser
#
#   usermgr_erasevariables
#
#   set -l nargs (count $argv)
#
#   if [ $nargs -eq 1 ]
#     set username "$argv[1]"
#   else
#     set username ""
#   end
#
#   if test -z $username
#     set good "no"
#     while test $good = "no"
#       ask "Please enter username"
#       set -g username $askresult
#       set -e askresult
#       check.user $username
#       if test $status = 0
#         set good "yes"
#       else
#         log.error "Username ($username) does not exist."
#         break
#       end
#     end
#   end
#
#   log.info "UserName   :   $username"
#   # askyn "Delete ?"
#   # if [ $status -eq 0 ]
#     log.info "Deleting user ($username)"
#     get.diradminpasswd
#     call "$dscl -u $usermgr_diradmin -P $diradminpasswd $usermgr_node -delete $users/$username"
#   # else
#     # lerror "Aborting..."
#   # end
#
#   usermgr_erasevariables
# end
#
#
# function usermgr_deletegroup
#
#   usermgr_erasevariables
#
#   set -l nargs (count $argv)
#
#   if [ $nargs -eq 1 ]
#     set  groupname "$argv[1]"
#   else
#     set  groupname ""
#   end
#
#   if test -z $groupname
#     ask "Please enter group name"
#     set  groupname $askresult
#     set -e askresult
#   end
#
#   check.group $groupname
#   if test $status = 0
#     log.info "Group ($groupname) exists"
#   else
#     log.error "Group ($groupname) does not exist"
#   end
#
#   log.info "Group   :   $groupname"
#   # askyn "Delete ?"
#   # if [ $status -eq 0 ]
#     log.info "Deleting Group ($groupname)"
#     get.diradminpasswd
#     call "$dseditgroup -o delete -n $usermgr_node -u $usermgr_diradmin -P $diradminpasswd -r $groupname $groupname" > /dev/null
#   # else
#     # lerror "Aborting..."
#   # end
#   usermgr_erasevariables
# end
#
#
# function usermgr_adduser
#
#  usermgr_erasevariables
#
#   set -l nargs (count $argv)
#
#   if [ $nargs -eq 2 ]
#     set  groupname "$argv[2]"
#     set  username "$argv[1]"
#   else
#     set username ""
#     set  groupname ""
#   end
#
#  if test -z $username
#     set good "no"
#     while test $good = "no"
#       ask "Please enter username (break to exit)"
#       set -g username $askresult
#       set -e askresult
#       check.user $username
#       if test $status = 0 -o $username = "break"
#         set good "yes"
#       else
#         log.error "Username ($username) does not exist."
#       end
#     end
#   end
#
#   if test -z $groupname
#     set good "no"
#     while test $good = "no"
#       ask "Please enter group name"
#       set -g groupname $askresult
#       set -e askresult
#       check.group $groupname
#       if test $status = 0
#         set good "yes"
#       else
#        log.error "Group ($groupname) does not exist, cant't delete"
#       end
#     end
#   end
#
#   check.user $username
#   if test $status = 0
#     log.info "Username ($username) exists."
#   else
#     log.error "Username ($username) does not exist."
#   end
#
#   check.group $groupname
#   if test $status = 0
#     log.info "Group ($groupname) exists."
#   else
#     log.error "Group ($groupname) does not exist."
#   end
#
#   # askyn "Add ?"
#   # if [ $status -eq 0 ]
#   log.info "Adding user ($username) to group ($groupname)"
#   get.diradminpasswd
#     call "$dseditgroup -o edit -n $usermgr_node -u $usermgr_diradmin -P $diradminpasswd -a $username -t user $groupname"
#   # else
#     # lerror "Aborting..."
#   # end
#   usermgr_erasevariables
# end
#
# function usermgr_removeuser
#
#  usermgr_erasevariables
#
#   set -l nargs (count $argv)
#
#   if [ $nargs -eq 2 ]
#     set groupname "$argv[2]"
#     set  username "$argv[1]"
#   else
#     set  username ""
#     set  groupname ""
#   end
#
#  if test -z $username
#     set good "no"
#     while test $good = "no"
#       ask "Please enter username"
#       set username $askresult
#       set -e askresult
#       check.user $username
#       if test $status = 0
#         set good "yes"
#       else
#         log.error "Username ($username) does not exist."
#       end
#     end
#   end
#
#   if test -z $groupname
#     set good "no"
#     while test $good = "no"
#       ask "Please enter group name"
#       set -g groupname $askresult
#       set -e askresult
#       check.group $groupname
#       if test $status = 0
#         set good "yes"
#       else
#         log.error "Group ($groupname) does not exist, cant't delete"
#       end
#     end
#   end
#
#   check.user $username
#   if test $status = 0
#     log.info "Username ($username) exists."
#   else
#     log.error "Username ($username) does not exist."
#   end
#
#   check.group $groupname
#   if test $status = 0
#     log.info "Group ($groupname) exists."
#   else
#     log.error "Group ($groupname) does not exist."
#   end
#
#   # askyn "Remove ?"
#   # if [ $status -eq 0 ]
#   log.info "Removing user ($username) to group ($groupname)"
#   get.diradminpasswd
#     call "$dseditgroup -o edit -n $usermgr_node -u $usermgr_diradmin -P $diradminpasswd -d $username -t user $groupname"
#   # else
#     # lerror "Aborting..."
#   # end
#   usermgr_erasevariables
#   # dseditgroup -o edit -a vivek -t user developers
# end
#
#
# function usermgr
#
#   usermgr_version
#   usermgr_init
#
#   set -l numargs (count $argv)
#   if [ $numargs -gt 0 ]
#
#     if [ $numargs -gt 1 ]
#       set args $argv[2..(count $argv)]
#       # ldebug $args
#     else
#       set args
#       # ldebug $args
#     end
#
#   switch $argv[1]
#     case 'createuser'
#       usermgr_createuser $args
#       return 0
#     case 'creategroup'
#       usermgr_creategroup $args
#       return 0
#     case 'deleteuser'
#       usermgr_deleteuser $args
#       return 0
#     case 'deletegroup'
#       usermgr_deletegroup $args
#       return 0
#     case 'adduser'
#       usermgr_adduser $args
#       return 0
#     case 'removeuser'
#       usermgr_removeuser $args
#       return 0
#     case '*'
#       err.novalid
#       return 1
#   end
#
#   else
#     err.noenough
#     usermgr_help
#     return 1
#   end
#
#   debug usermgr_debug
# end
#
#
# function usermanagement_parseproperty
#   set -l numargs (count $argv)
#   if [ $numargs -gt 1 ]
#     switch $argv[1]
#       case 'id'
#         set -g uniqueid $argv[2]
#       case 'user'
#         set -g username $argv[2]
#       case 'real'
#         set -g realname $argv[2]
#       case 'home'
#         set -g userhome $argv[2]
#       case 'shell'
#         set -g usershell $argv[2]
#       case 'passwd'
#         set -g userpasswd $argv[2]
#       case 'create'
#         set -g createhome $argv[2]
#     end
#   end
# end
#
#
# function usermanagement_init
#
#   set -g defaultgroups "staff" "Workgroup"
#   set -g admingroup "admin"
#   set -g searchnode "/Search"
#   set -g users "/Users"
#   set -g groups "/Groups"
#
#   set -g mode (getldapmode)
#
#   if test $mode = "ldap"
#     set -g diradmin "diradmin"
#   else
#     set -g diradmin $USER
#   end
#
#   set -g node (getldapnode)
#
#   debugfn usermanagement_debug
#
# end
#
# function usermanagement_erasevariables
#   set  -e uniqueid
#   set  -e username
#   set  -e realname
#   set  -e userhome
#   set  -e usershell
#   set  -e userpasswd
#   set  -e createhome
#   set  -e groupname
#   # set  -e diradminpasswd
#   return 0
# end
#
# function usermanagement_debug
#   ldebug "mode is $mode"
#   ldebug "node is $node"
#   ldebug "diradmin is $diradmin"
#   ldebug "dscl is ($dscl)"
#   ldebug "dseditgroup is ($dseditgroup)"
# end
#
# function findldap
# 	set ldapmode (call "$dsclprogram localhost -list /" | grep LDAPv3)
# 	if test $ldapmode = "LDAPv3"
# 		set -xg ldapmode "ldap"
# 		set -xg node $ldapnode
# 		set -xg ldapauthuser $diradmin
# 		sinfo LDAPv3 node detected
# 	else
# 		set -xg ldapmode "local"
# 		set -xg node $localnode
# 		set -xg ldapauthuser $USER
# 		sinfo Local node detected
# 	end
# end
#
# function promptpasswd
# 	set_color red; echo -n password ; set_color normal ; echo -n " > "
# end
#
# function newpasswd
# 	sinfo "Please enter new password for $argv (enter break to stop)"
# 	set good "no"
# 	set newpasswd1
# 	set newpasswd2
# 	set newpasswd
# 	while [ $good = "no" ]
# 		read -p promptpasswd newpasswd1
#
# 		if test $newpasswd1 = "break"
# 			set good "exit"
# 			break
# 		end
#
# 		sinfo "Please enter again new password for $argv (enter break to stop)"
# 		read -p promptpasswd newpasswd2
# 		debug $passwdok
# 		if [ "$newpasswd1" = "$newpasswd2" ]
# 			set good "yes"
# 			set -xg newpasswd $newpasswd1
# 		else
# 			serror "Passwords do not match failed, try again"
# 		end
# 	end
# end
#
# function getadminpw
# 	sinfo "Please enter password for $ldapauthuser (enter break to stop)"
# 	set good "no"
# 	while [ $good = "no" ]
# 		read -p promptpasswd authpasswd
#
# 		if test $authpasswd = "break"
# 			set good "exit"
# 			break
# 		end
# 		debug $dsclprogram  $searchnode $ldapauthuser $authpasswd
# 		set passwdok (call "$dsclprogram $searchnode -authonly $ldapauthuser $authpasswd" | grep failed )
# 		debug $passwdok
# 		if [ "$passwdok" = "" ]
# 			set good "yes"
# 			set -xg authpasswd $authpasswd
# 		else
# 			serror "Password failed, try again"
# 		end
# 	end
# 	# call $dsclprogram -u $
# end
#
# function getmaxid
# 	debug maxid is $maxid
# 	# set -xg maxid (call $dsclprogram $node -list $users UniqueID | awk '{print $2}' | sort -ug | tail -1)
# 	debug $dsclprogram
# 	debug $node
# 	debug $users
# 	call "$dsclprogram $node -list $users UniqueID"
# 	set -xg maxid (call "$dsclprogram $node -list $users UniqueID" | awk '{print $2}' | sort -ug | tail -1)
# 	debug maxid is $maxid
# end
#
# function initusermanagement
# 	debug Initialising usermanagement
# 	set -xg diradmin "diradmin"
# 	set -xg defaultgroups "staff" "workgroup"
# 	set -xg admingroup "admin"
#
# 	set -xg searchnode "/Search"
# 	set -xg localnode "/"
# 	set -xg ldapnode "/LDAPv3/127.0.0.1"
# 	set -xg users "/Users"
# 	set -xg groups "/Groups"
#
# 	set -xg dsclprogram (which dscl)
# 	debug dsclprogram is $dsclprogram
#
# 	set -xg maxid 0
# 	set node
# 	set ldapmode
# 	set ldapauthuser
# 	set authpasswd
#
# 	findldap
# 	debug "usermanagement initialisation done"
# 	# getadminpw
# end
#
# function novalid
# 	serror "Not a valid argument."
# 	exit
# end
#
# function noenough
# 	serror "Not enough arguments"
# 	exit
# end
#
# function createuser
#
# 	sinfo "Creating user ($argv[1])"
# 	getmaxid
# 	debug $maxid
# 	set newuserid (math $maxid + 1)
# 	debug $newuserid
# 	set newusername $argv[1]
# 	set newrealname $argv[1]
# 	set newusershell (/bin/sh)
# 	set NFSHomeDirectory /Users/$newusername
# 	set -l nargs  (count $argv)
# 	debug $nargs
# 	if [ $nargs -eq 1 ]
# 		newpasswd
# 		set newuserpasswd $newpasswd
# 	end
# 	if [ $nargs -eq 2 ]
# 		set newuserpasswd $argv[2]
# 	end
# 	set newuserprimarygroup 20
#
# 	sinfo "UniqueID: 		$newuserid"
# 	sinfo "UserName: 		$newusername"
# 	sinfo "RealName: 		$newrealname"
# 	sinfo "UserShell: 		$newusershell"
# 	sinfo "HomeDirectory: 	$NFSHomeDirectory"
# 	sinfo "PrimaryGroup: 	$newuserprimarygroup"
# 	sinfo "Password: 		$newuserpasswd"
#
# 	ask "agree?"
# 	if test $status = 0
# 		debug OK
# 		getadminpw
# 		debug $dsclprogram $ldapauthuser $authpasswd $node $newuserpasswd
# 		call "$dsclprogram -u $ldapauthuser -P $authpasswd $node -create $users/$newusername"
# 		call "$dsclprogram -u $ldapauthuser -P $authpasswd $node -create $users/$newusername RealName $newrealname"
# 		call "$dsclprogram -u $ldapauthuser -P $authpasswd $node -create $users/$newusername PrimaryGroupID $newuserprimarygroup"
# 		call "$dsclprogram -u $ldapauthuser -P $authpasswd $node -create $users/$newusername UserShell $newusershell"
# 		call "$dsclprogram -u $ldapauthuser -P $authpasswd $node -create $users/$newusername NFSHomeDirectory $NFSHomeDirectory"
# 		call "$dsclprogram -u $ldapauthuser -P $authpasswd $node -create $users/$newusername UniqueID $newuserid"
# 		call "$dsclprogram -u $ldapauthuser -P $authpasswd $node -passwd $users/$newusername $newuserpasswd"
# 		sudo createhomedir -b -u $newusername
# 	else
# 		debug ABORT
# 	end
# 	#newpasswd$dsclprogram $node
#
# 	# exit
# end
#
# function creategroup
# 	sinfo "Creating group ($argv)"
# 	getadminpw
# 	debug $dsclprogram $ldapauthuser $authpasswd $node $newuserpasswd $argv
# 	call "$dsclprogram -u $ldapauthuser -P $authpasswd $node -create $groups/$argv"
# 	call "$dsclprogram -u $ldapauthuser -P $authpasswd $node -create $groups/$argv gid 400"
# # 	dscl . create /Groups/ladmins
# # dscl . create /Groups/ladmins RealName “Local Admins”
# # dscl . create /Groups/ladmins passwd “*”
# # dscl . create /Groups/ladmins gid 400
# # dscl . create /Groups/ladmins GroupMembership localadmin
# # dscl . append /Groups/ladmins GroupMembership 2ndlocaladmin
#
# 	# exit
# end
#
# function deleteuser
# 	sinfo "Deleting user ($argv)"
# 	getadminpw
# 	debug $dsclprogram $ldapauthuser $authpasswd $node $newuserpasswd $argv
# 	call "$dsclprogram -u $ldapauthuser -P $authpasswd $node -delete $users/$argv"
# 	sudo rm -rf $argv
# 	# exit dscl -u diradmin -P anoncircledot /LDAPv3/127.0.0.1 -delete /Users/git
# end
#
# function deletegroup
# 	sinfo "Deleting group ($argv)"
# 	# exit
# end
#
# function adduser
# 	sinfo "Adding user ($argv[1]) to group  ($argv[2])"
# 	getadminpw
# 	debug $dsclprogram $ldapauthuser $authpasswd $node $newuserpasswd $argv[1] $argv[2]
# 	call "$dsclprogram -u $ldapauthuser -P $authpasswd $node -append $groups/$argv[2] $argv[1]"
# # 	dscl . create /Groups/ladmins
# # dscl . create /Groups/ladmins RealName “Local Admins”
# # dscl . create /Groups/ladmins passwd “*”
# # dscl . create /Groups/ladmins gid 400
# # dscl . create /Groups/ladmins GroupMembership localadmin
# # dscl . append /Groups/ladmins GroupMembership 2ndlocaladmin
# 	# exit
# end
#
# function removeuser
# 	sinfo "Removing user ($argv[1]) from group  ($argv[2])"
# 	# exit
# end
#
# function usermanagement
#
# 	initusermanagement
#
# 	set nargs (count $argv)
# 	debug has $nargs arguments : $argv
# 	if [ $nargs -gt 1 ]
# 		switch $argv[1]
# 			debug first argument is $argv[1]
# 			case '-u' 'createuser'
# 				debug createuser
# 				if [ $nargs -eq 2 ]
# 					debug "one argument for create user  $argv[2]"
# 					createuser $argv[2]
# 				else if [ $nargs -eq 3 ]
# 					debug "two arguments for create user  $argv[2] $argv[3]"
# 					createuser $argv[2] $argv[3]
# 				else
# 					noenough
# 				end
# 			case '-g' 'creategroup'
# 				if [ -n $argv[2] ]
# 					creategroup $argv[2]
# 				else
# 					noenough
# 				end
# 			case '-du' 'deleteuser'
# 				if [ -n $argv[2] ]
# 					deleteuser $argv[2]
# 				else
# 					noenough
# 				end
# 			case '-dg' 'deletgroup'
# 				if [ -n $argv[2] ]
# 					deletegroup $argv[2]
# 				else
# 					noenough
# 				end
# 			case '-a' 'adduser'
# 				if [ $nargs -eq 3 ]
# 					#-a -n $argv[2] -a -n $argv[3] ]
# 					adduser $argv[2] $argv[3]
# 				else
# 					noenough
# 				end
# 			case '-r' 'removeuser'
# 				if [  $nargs -eq 3 ]
# 					# -a -n $argv[2] -a -n $argv[3] ]
# 					removeuser $argv[2] $argv[3]
# 				else
# 					noenough
# 				end
# 			case '*'
# 				novalid
# 			end
#
# 	else
# 		noenough
# 	end
#
# end
#
#
# set -g usermanagement_version "0.1a"
#
# function usermanagement_help -d "Prints help for servermgr"
# echo "Usage: usermanagement [ command ] [ args ... ]"
# echo ""
# echo "  Available Commands  "
# echo "  ------------------  "
# echo ""
# echo "  createuser   -- Creates a new user "
# echo "  creategroup  -- Creates a new group "
# echo "  deleteuser   -- Deletes a user "
# echo "  deletegroup  -- Deletes a group "
# echo "  adduser      -- Adds user to group"
# echo "  removeuser   -- Removes user from group"
# echo ""
# echo "  Arguments "
# echo "  --------- "
# echo ""
# end
#
# function usermanagement_version -d "Prints version for servermgr"
# echo "User Management for Mac OS X"
# echo "Version: $usermanagement_version"
# end
#
# function usermanagement
#
# usermanagement_version
# usermanagement_init
#
# set -l numargs (count $argv)
# if [ $numargs -gt 0 ]
#
#   if [ $numargs -gt 1 ]
#     set args $argv[2..(count $argv)]
#     # ldebug $args
#   else
#     set args
#     # ldebug $args
#   end
#
#   switch $argv[1]
#     case 'createuser'
#       createuser $args
#       return 0
#     case 'creategroup'
#       creategroup $args
#       return 0
#     case 'deleteuser'
#       deleteuser $args
#       return 0
#     case 'deletegroup'
#       deletegroup $args
#       return 0
#     case 'adduser'
#       adduser $args
#       return 0
#     case 'removeuser'
#       removeuser $args
#       return 0
#     case '*'
#       errnovalid
#   end
# else
#   errnoenough
#   usermanagement_help
#   return 1
# end
#
# end
#
#
#
# # echo $authpasswd
