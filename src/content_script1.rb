require "js"
puts "Hello, this is content_script1!"

# 見出しの文字を変える
document = JS.global[:document]
document[:querySelector].call(:call, document, "h1")[:innerText] = JS.try_convert("Rubyで動いたよ!")
