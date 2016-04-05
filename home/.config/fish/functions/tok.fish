function tok
	stoken | tr --delete '\n' | clipboard
echo 'token copied to clipboard'
end
