#!/usr/bin/env ruby

require "curb"
require "nokogiri"

http = Curl.get("http://en.wikipedia.org/wiki/Main_Page") do |http|
  http.headers["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36"
end

html = Nokogiri::HTML(http.body_str)

puts "Today's featured article:"
html.css("#mp-tfa p").each do |node|
    sections_html = Nokogiri::HTML(node.inner_html)
      para = node.text
      puts para
end

puts "\n", "Did you know:"
html.css("#mp-dyk ul li").each do |node|
    sections_html = Nokogiri::HTML(node.inner_html)
    para = node.text
    puts para
end

puts "\n", "On this day:"
html.css("#mp-otd ul li").each do |node|
    sections_html = Nokogiri::HTML(node.inner_html)
    para = node.text
    puts para
end
