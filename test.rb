#!/usr/bin/env ruby

require 'rubygems'
require 'hpricot'

doc = Hpricot.XML(File.read("tunes.xml"))
songs = (doc/'dict/dict')[1..-1]

puts songs.

songs.each do |song|
  args = {}
  (song/'key').each do |e|
    key = e.inner_text.downcase.gsub(" ", "_").to_sym
    if [:name, :artist, :album, :genre, :track_number, :year].include?(key)
      value = e.next.inner_text
      args.merge!({key => value})
    end
  end

  puts "#{args[:album]}"
  # puts "#{args[:year]} - #{args[:artist]} - #{args[:album]} - #{args[:track_number]} - #{args[:name]}"
  # status << "."
  # puts status.to_s
end