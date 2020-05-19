# frozen_string_literal: true

require 'tty-prompt'
require 'chunky_png'
require_relative '..\lib\my_complex'

def get_num(str)
    values = str.split
    r = values[0].chomp.strip.to_i
    c = values[1].chomp.strip.to_i
    MyComplex.new(r, c)
end

def main
 png = ChunkyPNG::Image.new(100, 100, ChunkyPNG::Color::WHITE)
 # png[1,1] = ChunkyPNG::Color.rgba(10, 20, 30, 128)
 # png[2,1] = ChunkyPNG::Color('black @ 0.5')
 #png.circle(100, 100, 25,, stroke_color = ChunkyPNG::Color::BLACK,
 #    fill_color = ChunkyPNG::Color.rgb(255, 0, 0))
 #prompt = TTY::Prompt.new
 #first = get_num(prompt.ask('Enter first complex number @real @imaginary > ', require: true))
 #png[first.real,first.imaginary] = ChunkyPNG::Color('black @ 0.5')
 
 png.line_xiaolin_wu(0, 50, 100, 50, ChunkyPNG::Color.rgb(0, 0, 255), inclusive = true)
 png.line_xiaolin_wu(50, 0, 50, 100, ChunkyPNG::Color.rgb(0, 0, 255), inclusive = true)
 prompt = TTY::Prompt.new
 first = get_num(prompt.ask('Enter first complex number @real @imaginary > ', require: true))
 png[first.real+50,first.imaginary+50] = ChunkyPNG::Color('black @ 0.5')
 

 png.save('filename.png', interlace: true)
end 

main if __FILE__ == $PROGRAM_NAME
