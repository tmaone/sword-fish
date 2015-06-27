#                                 .___              _____.__       .__
#   ________  _  _____________  __| _/    .__     _/ ____\__| _____|  |__  __
#  /  ___/\ \/ \/ /  _ \_  __ \/ __ |   __|  |___ \   __\|  |/  ___/  |  \ \ \
#  \___ \  \     (  <_> )  | \/ /_/ |  /__    __/  |  |  |  |\___ \|   Y  \ \ \
# /____  >  \/\_/ \____/|__|  \____ |     |__|     |__|  |__/____  >___|  / / /
#      \/                          \/                            \/     \/ /_/
function sword.logo

    function sword
        color lightblue
    end
    function plus
        color tomato
    end
    function fishc
        color yellowgreen
    end
    function arrow
        color dimgrey
    end

    set -l info_line (printf "%s%s %s %s %s%s" (set_color $fish_color_autosuggestion[1]) (host.name) (os) (os.kernel) (os.arch)(set_color normal))

    out.ln $info_line

    out.ln (sword)"                                .___"(plus)"           "(fishc)"  _____.__       .__ "(arrow)""
    out.ln (sword)"  ________  _  _____________  __| _/"(plus)"   .__     "(fishc)"_/ ____\__| _____|  |__ "(arrow)" __"
    out.ln (sword)" /  ___/\ \/ \/ /  _ \_  __ \/ __ | "(plus)" __|  |___ "(fishc)"\   __\|  |/  ___/  |  \ "(arrow)"\ \ "
    out.ln (sword)" \___ \  \     (  <_> )  | \/ /_/ | "(plus)"/__    __/ "(fishc)" |  |  |  |\___ \|   Y  \ "(arrow)"\ \ "
    out.ln (sword)"/____  >  \/\_/ \____/|__|  \____ | "(plus)"   |__|    "(fishc)" |__|  |__/____  >___|  / "(arrow)"/ /"
    out.ln (sword)"     \/                          \/ "(plus)"           "(fishc)"               \/     \/ "(arrow)"/_/"

    functions -e sword
    functions -e plus
    functions -e fishc
    functions -e arrow

end
