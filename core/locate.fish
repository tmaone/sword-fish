set -xg locate_valid_search_terms "application" "applications" "app" "audio" "music" "bookmark" "bookmarks" "contact" "contacts" "email" "emails" "mail" "message" "mail" "messages" "folder" "folders" "font" "fonts" "event" "events" "todo" "todos" "image" "images" "movie" "movies" "pdf" "pdfs" "preferences" "presentation" "presentations"

function locate.is_valid
    if test (count $argv) -eq 1
        if contains "$argv[1]" $locate_valid_search_terms
            return 0
        else
            return 1
        end
    end
end

function locate --description 'locates a file on disk'
    set -l numargs (count $argv)
    switch $numargs
        case 1
            log.info "Searching for "(color.blue)"["(color.normal)"$argv[1]"(color.blue)"]"(color.normal)
            mdfind -name "$argv[1]" | sort
            set -l resultscnt (mdfind -name "$argv[1]" -count)
            log.info "Found $resultscnt results"
            return 1
        case 2
            if locate.is_valid "$argv[1]"
                log.info "Searching for $argv[1] "(color.blue)"["(color.normal)"$argv[2]"(color.blue)"]"(color.normal)
                mdfind "kind:$argv[1]" "$argv[2]"
                set -l resultscnt (mdfind "kind:$argv[1]" "$argv[2]" -count)
                log.info "Found $resultscnt results"
                return 1
            else
                error.invalid $argv[1]
                return 0
            end
        case '*'
            return 0
    end
end
