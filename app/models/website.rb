require 'open-uri'

class Website < ActiveRecord::Base

    def headline
        
      
    
    end
    
   
    




    def id_check
       
       look = indentifier
       # method is_TAG
       # tag = is_TAG(look)
       # method is_WORD
       # method is_GIBERISH
       # if tag == true
       # if word == true
       return # that the indentified checks out
    end

    def is_WORD
        what = file.open("http://thesaurus.com/browse/#{name}")
        if what.index("misspelling").nil? then
        word = false
        end
        return word
    end
    

    def is_TAG(look)
        if look.include("><") == 2 then
        tag = true
        end
        return tag 
    end




    def no_ID
       
       
        begin
                #p "#{name} , #{webiste} , #{identifier}"
                file = open("http://#{name}")
                content = file.read
                unless content.index("<h2").nil?
                #start_location = content.index(identifier)
                header_start = content.index("<h2") # + 4
                header_end = content.index("</h2>") # - 1
                p content[header_start..header_end]
                    #p "There is no h1 tag on {#name}"
                end
        
                rescue
                puts "you typed in something wrong try again"
        end 
    end
        
    def h2_scan
     begin
            #p "#{name} , #{webiste} , #{identifier}"
            file = open("http://#{name}")
            content = file.read
            unless content.index("<h2").nil?
            #start_location = content.index(identifier)
            header_start = content.index("<h2") # + 4
            header_end = content.index("</h2>") # - 1
            p content[header_start..header_end]
                #p "There is no h1 tag on {#name}"
            end
    
            rescue
            puts "you typed in something wrong try again"
     end 
    end
    
    def
     begin
            #p "#{name} , #{webiste} , #{identifier}"
            file = open("http://#{name}")
            content = file.read
            unless content.index("<h2").nil?
            #start_location = content.index(identifier)
            header_start = content.index("<h2") # + 4
            header_end = content.index("</h2>") # - 1
            p content[header_start..header_end]
                #p "There is no h1 tag on {#name}"
            end
    
            rescue
            puts "you typed in something wrong try again"
     end
    end
     
     
     begin
            #p "#{name} , #{webiste} , #{identifier}"
            file = open("http://#{name}")
            content = file.read
            unless content.index("<h2").nil?
            #start_location = content.index(identifier)
            header_start = content.index("<h2") # + 4
            header_end = content.index("</h2>") # - 1
            p content[header_start..header_end]
                #p "There is no h1 tag on {#name}"
            end
    
            rescue
            puts "you typed in something wrong try again"
     end 
    
    
    
    
end