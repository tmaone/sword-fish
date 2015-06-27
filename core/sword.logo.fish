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

    out.ln (sword)"                                .___"(plus)"           "(fishc)"  _____.__       .__ "(arrow)""
    out.ln (sword)"  ________  _  _____________  __| _/"(plus)"   .__     "(fishc)"_/ ____\__| _____|  |__ "(arrow)" __"
    out.ln (sword)" /  ___/\ \/ \/ /  _ \_  __ \/ __ | "(plus)" __|  |___ "(fishc)"\   __\|  |/  ___/  |  \ "(arrow)"\ \ "
    out.ln (sword)" \___ \  \     (  <_> )  | \/ /_/ | "(plus)"/__    __/ "(fishc)" |  |  |  |\___ \|   Y  \ "(arrow)"\ \ "
    out.ln (sword)"/____  >  \/\_/ \____/|__|  \____ | "(plus)"   |__|    "(fishc)" |__|  |__/____  >___|  / "(arrow)"/ /"
    out.ln (sword)"     \/                          \/ "(plus)"           "(fishc)"               \/     \/ "(arrow)"/_/"(set_color normal)

    functions -e sword
    functions -e plus
    functions -e fishc
    functions -e arrow

end
