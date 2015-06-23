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

function osx.user.password
linfo "Please enter password for $USER (enter break to stop)"
set good "no"
while [ $good = "no" ]
  read -p promptpasswd evaluserpasswd
  if test $evaluserpasswd = "break"
    set good "exit"
    break
  end
  set passwdok (call $grep failed (call $dscl $searchnode -authonly $USER $evaluserpasswd | psub ) )
  if [ "$passwdok" = "" ]
    set good "yes"
    set -g userpasswd $evaluserpasswd
  else
    lerror "Password failed, try again"
  end
end
end


function osx.user.max-unique-id
  set -l node (osx.ldapnode)
  set -l users "/Users"
  call $tail -1 (call $sort -ug (call $awk '{print $2}' (call $dscl $node -list $users UniqueID | psub) | psub) | psub )
end
