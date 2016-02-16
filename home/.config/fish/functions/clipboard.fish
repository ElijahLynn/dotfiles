function clipboard
    #xsel --input --clipboard $argv
    xclip -selection clipboard
end
