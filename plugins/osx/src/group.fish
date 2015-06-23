function osx.group

	if test (count $argv) = 1
		set -l node (get.ldapnode)
		set -l result (call $dseditgroup -o read -n $node -t group $argv[1] ^&1)
		echo $result
		if test "$result" = "Group not found."
			echo not found
			return 1
		else
			echo found
			return 0
		end
	end
	# call $tail -1 (call $sort -ug (call $awk '{print $2}' (call $dscl $node -list $users UniqueID | psub) | psub) | psub )
  # dseditgroup -o read -n /LDAPv3/127.0.0.1 -t group workgro
  # call $grep "Group not found"
end



function osx.group.create

usermanagement_erasevariables
set -l nargs (count $argv)

if [ $nargs -eq 1 ]
  set -g groupname "$argv[1]"
else
  set -g groupname ""
end

if test -z $groupname
  ask "Please enter group name"
  set -g groupname $result
  set -e result
end

checkgroup $groupname
if test $status = 1
  linfo "Group ($groupname) does not exist, can create."
else
  lerror "Group ($groupname) already exists."
end

linfo "Group   :   $groupname"
# askyn "Create ?"
# if [ $status -eq 0 ]
  linfo "Creating Group ($groupname)"
  getdiradminpw
  call "$dseditgroup -o create -n $node -u $diradmin -P $diradminpasswd -r $groupname $groupname"
# else
  # lerror "Aborting..."
# end
usermanagement_erasevariables
# dseditgroup create -n /Local/Default -r “Local Admins2″ ladmins2
# $dseditgroup -o create -n $node -u myusername -P mypassword  -r "realname"  -a
end

function osx.group.delete
usermanagement_erasevariables

set -l nargs (count $argv)

if [ $nargs -eq 1 ]
set -g groupname "$argv[1]"
else
set -g groupname ""
end

if test -z $groupname
ask "Please enter group name"
set -g groupname $result
set -e result
end

checkgroup $groupname
if test $status = 0
linfo "Group ($groupname) exists"
else
lerror "Group ($groupname) does not exist"
end

linfo "Group   :   $groupname"
# askyn "Delete ?"
# if [ $status -eq 0 ]
linfo "Deleting Group ($groupname)"
getdiradminpw
call "$dseditgroup -o delete -n $node -u $diradmin -P $diradminpasswd -r $groupname $groupname" > /dev/null
# else
# lerror "Aborting..."
# end
usermanagement_erasevariables
end
