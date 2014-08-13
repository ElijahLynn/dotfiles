function glc
	git log --pretty=format:%s -1 | xsel -i --clipboard
end
