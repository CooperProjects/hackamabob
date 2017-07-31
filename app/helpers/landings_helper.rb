module LandingsHelper



        ########################################################################
        # This is the list of urls that will be used for The "TOdays News" Feed This method
        # simply reture an Array urls address to be use for the news feed. There are two
        # operation that must  be performed on this raw data. First the url must be check
        # to determine or ensure that:
        #
        
        # =>    1 - The data has been updated
        # =>    2 - The url is still active
        # =>    3 - The communication policy applied to content
        # =>    4 - The the content responds to user preferences
        
        # =>    5 - The search the updated entry database for keyterm priority.
        # =>    6 - Check the format of the feed 
    
        # Each of the feed entries will be logged into the database as a slugline if the 
        # headline is too long. If the headline in too short then space may be needed to be 
        # added to make sure that the size of the bootstrap thumbnail component, if the 
        # thumbanail component cant be asigned a min/max wieght and witdth.
        
        # The first compent will consist of simply tech news and bay area publications and
        # tech business and tech policy RSS feeds.


    def primary_rss_url_list
        list = Array.new
            list.push "http://www.sfgate.com/rss/feed/Business-and-Technology-News-448.php" #0
            list.push "http://feeds.feedburner.com/TechCrunch/startups" #0
            list.push "https://www.technologyreview.com/c/computing/rss/" #0
            list.push "http://feeds.feedburner.com/HBCUDigest"
        return list
    end
    
        ########################################################################
        #
        # => These are the backup RSS url list The same operations will be use for 
        # => these but an additional operations will be used to set prioity and a
        # => different operation is needed for the key word list, because these urls
        # => will have a differrent prioirty given that they will only provide content
        # => if meet the "subject matter relevency" criteria. 
           
    
    def secondary_rss_url_list
        list = Array.new
            list.push "https://news.ycombinator.com/rss" #0
            list.push "https://info.crunchbase.com/feed/" #0
            list.push "https://worksthatwork.com/rss" #0
            list.push "http://www.eyemagazine.com/?feed=rss2"
        return list
    end
    
        def rssFeed
        array_BastageFeed_landings_index = Array.new
        hash_BastageFeed_landings_index  = Hash.new
        i=0
        stage   = Feedjira::Feed.fetch_and_parse "https://www.technologyreview.com/c/computing/rss/"
            stage.entries.each do |stages|
                hash_BastageFeed_landings_index [i] = 
                {
                    title:          stages.title,
                    url:            stages.url,
                    summary:        stages.summary,
                    date:           stages.published,
                    entry_id:       stages.id,
                    description:    stages.content,
               }
                array_BastageFeed_landings_index << hash_BastageFeed_landings_index
                i += 1 
            end
        return hash_BastageFeed_landings_index
        end
end



