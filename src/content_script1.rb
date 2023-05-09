require "js"
puts "Hello, this is content_script1!"

# change h1 text
document = JS.global[:document]
document[:querySelector].call(:call, document, "h1")[:innerText] = JS.try_convert("Rubyで動いたよ!")

# same code in JavaScript
# document.querySelector('h1').innerText = "Rubyで動いたよ!";


# set background color red
JS.global[:document][:body][:style][:backgroundColor] = JS.try_convert("red")

# in JS
# document.body.style.backgroundColor = "red";