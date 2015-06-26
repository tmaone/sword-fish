function file.empty --description 'Show empty files '
    if  test arg.count = 1
        find "$argv" -type f -empty
    else
        find . -type f -empty
    end
end
