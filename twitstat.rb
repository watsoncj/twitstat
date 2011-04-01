#!/usr/bin/env ruby

require 'rubygems'
require 'twitter'
require 'pp'

search = Twitter::Search.new

lettercount = Hash.new
visited=Array.new

('a'..'z').each do |c|
  lettercount[c] = 0
end

while visited.size < 1000000
  Twitter.public_timeline.each do |r|
#    puts r.language
    if !visited.include?(r.id)
      puts r
      r.text.downcase.each_char do |c|
        lettercount[c] = lettercount[c] + 1 if lettercount.keys.include?(c)
      end
      visited << r.id
    end
  end
  lettercount.sort.map { |k,v| puts "#{k}: #{v}" }
  puts "#{visited.size} tweets"
  sleep 61 
end
