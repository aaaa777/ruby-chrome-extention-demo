require "js"
puts "Hello, this is content_script!"

# change h1 text
document = JS.global[:document]
text = JS.try_convert("Example Page with ruby.wasm!")
document[:querySelector].call(:call, document, "h1")[:innerText] = text

# same code in JavaScript
# document.querySelector('h1').innerText = "Example Page with ruby.wasm!";


# set background color red
JS.global[:document][:body][:style][:backgroundColor] = JS.try_convert("crimson")

# in JS
# document.body.style.backgroundColor = "crimson";