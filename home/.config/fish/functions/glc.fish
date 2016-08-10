function glc --description 'Git log the last commit into the clipboard'
	git log --pretty=format:%s -1 | xsel -i --clipboard
end
