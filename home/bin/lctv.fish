#! /usr/bin/fish

if test (pgrep "obs")
        set viewer_count (curl  https://www.livecoding.tv/livestreams/elijahlynn/stats.json | jq .views_live)
	echo ' - '  $viewer_count

else
	echo " -"
end

