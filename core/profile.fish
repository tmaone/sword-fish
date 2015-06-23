function profile.init
  find.program uname
  find.program sed
  profile
end

function profile --description 'Profiles the Operating System'

    # profile os

    set -xg OS (call $uname -s | call $sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/')

    set -xg KERNEL (call $uname -r)
    set -xg ARCH (call $uname -m)
    set -xg PLATFORM {$OS}-{$ARCH}-{$KERNEL}

    if test "$OS" = linux
      if not test -z (call $uname -a | grep -i 'synology')
        set -xg OS syno
      end
    end

    # set -xg OS_NAME (sw_vers  -productName)
    # set -xg OS_VERSION (sw_vers  -productVersion)
    # set -xg OS_BUILD (sw_vers  -buildVersion)
    #
    # set -xg OS_VER {$OS_NAME} {$OS_VERSION} {$OS_BUILD}

    # log.debug "OS       [$OS_VER]"
    # log.debug "Platform [$PLATFORM]"

    # profile host
    # set -xg HOST_NAME (host.name)
    # set -xg hostlocal (hostname -s)
    # set -xg hostext (extension "$host")

    # profile net
    # TODO
end

function profile.print --description 'Prints the os profile information'
    info OS = "[$OS]"
    info KERNEL = "[$KERNEL]"
    info ARCH = "[$ARCH]"
    # profile
    # out.ln (color color_info)\$(color color_normal) "[$PLATFORM]"
    # out.ln (color color_info)OS(color color_normal) "[$OS]"
    # out.ln (color color_info)OS(color color_normal) "[$OS]"

    # printf "%s\n" (color.green)"OS Version"(color.normal)"  $OS_VER"
    # printf "%s\n" (color.green)"OS Platform"(color.normal)" $PLATFORM"
    # printf "%s\n" (color.green)"Host Name"(color.normal)"   $HOST_NAME"
    # echo (color.green)"OS"(color.blue)"       ["(color.normal)"$os"(color.blue)"]"(color.normal)
    # echo (color.green)"KERNEL"(color.blue)"   ["(color.normal)"$kernel"(color.blue)"]"(color.normal)
    # echo (color.green)"MACH"(color.blue)"     ["(color.normal)"$mach"(color.blue)"]"(color.normal)
    # echo (color.green)"PLATFORM"(color.blue)" ["(color.normal)"$platform"(color.blue)"]"(color.normal)
    # echo (color.green)"HOST"(color.blue)"     ["(color.normal)"$host"(color.blue)"]"(color.normal)
end
