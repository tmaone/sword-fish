function download

end

function download.images
  wget -r -l1 --no-parent -nH -nd -P/tmp -A".gif,.jpg" $argv[1] # download all images from a site
end

function download.web
	wget --random-wait -r -p -e robots=off -U mozilla $argv[1]
end

function download.youtube

end

function download.youtube.audio
	youtube-dl -x --audio-format mp3 --audio-quality 0 $argv[1]
end

