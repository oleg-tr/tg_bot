class HaikuGenerator
    module Listener
      # This module assigned to processing all standart messages
      module StandartMessages
        def process
          case Listener.message.text
          when '/haiku'
            Response.std_message 'Ща'
          else 
            Response.inline_message 'окстись, гайдзин'
          end
        end
  
        module_function(
          :process
        )
      end
    end
  end