require 'telegram/bot'
require './library/message_shaker'
require './library/database'
require './modules/listener'
require './modules/security'
require './modules/standart_messages'
require './modules/response'
require 'faker/japanese'


class HaikuGenerator

  def initialize
    super
    # Establishing webhook via @gem telegram/bot, using API-KEY
    Telegram::Bot::Client.run(TelegramOrientedInfo::API_KEY) do |bot|
      # Start time variable, for exclude message what was sends before bot starts
      start_bot_time = Time.now.to_i
      # Active socket listener
      bot.listen do |message|
        # Processing the new income message    #if that message sent after bot run.
        Listener.catch_new_message(message,bot) if Listener::Security.message_is_new(start_bot_time,message)
      end
    end
  end
end
# Bot start
HaikuGenerator.new

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