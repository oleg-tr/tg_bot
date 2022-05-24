#require 'telegram/bot'
#require './library/message_shaker'
#require './library/database'
#require './modules/listener'
#require './modules/security'
#require './modules/standart_messages'
#require './modules/response'
require 'faker/japanese'

Faker::Config.locale = :ja
n = Faker::Name.name

def haiku
  File.readlines("library/haiku.txt").sample
end

def date_created
  #code here
end

3.times { puts haiku }

puts(n.romaji)