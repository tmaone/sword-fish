function profile.print --description 'Prints the os profile information'
    info OS = "[$OS]"
    info KERNEL = "[$KERNEL]"
    info ARCH = "[$ARCH]"
    emit profile_print
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
