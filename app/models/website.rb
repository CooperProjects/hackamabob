require 'open-uri'

class Website < ActiveRecord::Base

    def headline
        begin
            file = open("http://#{name}")
            content = file.read
            unless content.index("<h2").nil?
            #start_location = content.index(identifier)
            header_start = content.index("<h2") # + 4
            header_end = content.index("</h2>") # - 1
            p content[header_start..header_end]
                p "There is no h1 tag on {#name}"
            end
    
        rescue
        puts "you typed in something wrong try again"
        end 
    end
end
