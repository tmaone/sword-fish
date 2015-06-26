if not functions -q _profile_event
  profile.init
end

function profile --description 'Profiles the Operating System'

    # profile os

    # out.ln profiling

    set -xg OS (os)
    set -xg KERNEL (os.kernel)
    set -xg ARCH (os.arch)

    set -xg PLATFORM {$OS}-{$ARCH}-{$KERNEL}

    if test "$OS" = linux
      if not test -z (call $uname -a | grep -i 'synology')
        set -xg OS syno
      end
    end

    debug "profile [$OS] [$KERNEL] [$ARCH] [$PLATFORM]"

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
