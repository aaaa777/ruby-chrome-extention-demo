require "js"
puts "Hello, this is content_script2!"

# 背景色を赤にする
JS.global[:document][:body][:style][:backgroundColor] = JS.try_convert("red")