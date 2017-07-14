require 'open-uri'

class Glossary < ActiveRecord::Base





    def gather_relevant_arr(term_block)
        # This method retrieves the terms and attributes in the relevancy list of 
        # a word that has been searched. The term_block only has the section that contains
        # terms in a particular relevancy list. The term_block's length is extened
        # because the longest word in the english language in about 56 characters long
        #  there in a word that is about 189,000 characters long but it isn't likely
        # that a person would encounter that word. 
        #
        # full_block and block_pointer have been added so that the method can gather
        # the attributes of the terms, which are: Complexity,Relevance, & Commonality
        # The words and their attributes are to be placced in a two dimentional array
        # so the can be push into a database. This data is sqlite for cloud9 but
        # will have to be converted to postgres for heroku using the postgress gem
        #
        # One thing it is important to keep in mind is that this method is in a 
        #  Each time this method 
        # is called it is only deal with a single term
        # Line 1: 
        # Line 2: 
        # Line 3: 
        # Line 4: 
        # Line 6: 
        # Line 7: 
        # Line 89: copy sub_block [1e2x234] to relevant [34x789] fro comparison in size at "line 5" 
        # Line 9: 
        # Line 10: 
        # Line 11: 
        # Line 12: 
        # Line 13: 
        # Line 14: 
        # Line 15: 
        # Line 16: 
        
        term = Array.new
        
        x    = 0
        #p "THIS IS HAPPENING #{term_block}"
     
        
        #term.clear
        
             until  term_block[x]  == "\"" do
             term.push(term_block[x])
             x += 1
             #p ">>>> #{term_block} "
                if x > 56 then 
                     break; 
                end
             end
            # p "#{term}"
        return term 
        
    end



    
    def relevant_B
        #So what we need to do is get the index at the begining of the block
        #Then get the index at the end on the block
        # after that we can use then to incapsulate "content"
        
        file = open("http://www.thesaurus.com/browse/#{hitone}")
        content = file.read
        start_block = content.index("<div class=\"relevancy-list\">")
        end_block  =  content.index("<div id=\"filter-0\"></div>")
        temp = content[start_block..end_block]
        return temp
        #pac = content.index("<div class=\"relevancy-list\">")
        #temp = Array.new
        #temp =content[78+pac..pac+100]
        
    
    end
    
  
    def sub_relevant
    
        #sub_block       = 
        sub_block = relevant_B
        end_sub_block = sub_block.index("</ul>")
        #sub_block[0..end_sub_block]
        #start_sub_block = sub_block.index("<div class=")
        #end_sub_block   = sub_block.index("</ul></div>")
        #word_count      = sub_block.scan("browse").length
        #sub_block_hold  = sub_block[start_sub_block..end_sub_block]
        #sub_block_hold
        #p relevant_B
        # p "START == #{start_sub_block} END == #{end_sub_block}"
        scanner = Array.new(20)
        scanner_iterator = 0
        term_instance = Array.new
        analog_row =0
        analog_column =0
        sub_block_analog = Array.new #= [[0],[0]] 
          
          
          until (scanner_iterator >= end_sub_block) do
             scanner.push(sub_block[scanner_iterator])  
      
        
            if scanner[0..5].join.include?("browse") then 
             p "#{scanner[0..20].join}"
            # p "#{sub_block[scanner_iterator-13..scanner_iterator+56]} >>>interator == #{scanner_iterator}"
               term_instance_block = sub_block[scanner_iterator-13..scanner_iterator+56]
               term_instance = gather_relevant_arr(term_instance_block)
               sub_block_analog.push([[term_instance.join],[ analog_row]])  
               analog_row += 1
                #p "NOT HERE sub_relevant"
            end
                 
             if scanner[0..10].join.include?("common-word") then 
                 common_word = true; 
                 sub_block_analog.push([[analog_column],[common_word]])
                 analog_column += 1
             end; 
                 
             if scanner[0..19].join.include?("quot;relevant-3&quot")  then  
                 relevant_num = scanner[14]; 
                 sub_block_analog.push([[analog_column],[relevant_num]])
                 analog_column += 1
             end;
             
             if scanner[0..15].join.include?("data-complexity=") then 
                 complexity_num = scanner[17]; 
                 sub_block_analog.push([[analog_column],[complexity_num]])
                 analog_column += 1
             end;
             
            
             
            
             scanner_iterator += 1
             scanner.shift
             
             #p scanner.join
             
          end
             puts sub_block_analog
             p "done! WORD:#{term_instance} COMMOM:#{common_word} RELEVANCE:#{relevant_num} COMPLEXITY:#{complexity_num} ARRAY: #{sub_block_analog }"
             
    
    end
    
    def db_work
        
        term = Glossary.find(3)
        reference = term.name
        reference
    
    end
    
    
    
end



