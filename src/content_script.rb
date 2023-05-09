require "js"
puts "Hello, this is content_script!"

# change h1 text
document = JS.global[:document]
document[:querySelector].call(:call, document, "h1")[:innerText] = JS.try_convert("Example Page with ruby.wasm!")

# same code in JavaScript
# document.querySelector('h1').innerText = "Example Page with ruby.wasm!";


# set background color red
JS.global[:document][:body][:style][:backgroundColor] = JS.try_convert("crimson")

# in JS
# document.body.style.backgroundColor = "crimson";