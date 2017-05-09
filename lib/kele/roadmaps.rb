module Roadmaps

    def get_roadmap roadmap_id
        roadmap_id_url = @base_api_url + 'roadmaps/'
        roadmap_id_url += roadmap_id.to_s
        response = Kele.get(roadmap_id_url, headers: { "authorization" => @auth_token })
        JSON.parse(response.body)["sections"][0]["checkpoints"].each {|id|
        }
        @roadmaps = JSON.parse(response.body)
    end
    
    def get_checkpoint checkpoint_id
        checkpoint_id_url = @base_api_url + 'checkpoints/'
        checkpoint_id_url += checkpoint_id.to_s
        response = Kele.get(checkpoint_id_url, headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end
    
    def get_messages page_number = 0
        page_number = page_number 
        get_messages_url = @base_api_url + '/message_threads'
        options = { :body => {:page => page_number}, :headers => { "authorization" => @auth_token } }
        response = Kele.get(get_messages_url, options)
        JSON.parse(response.body)
    end
    
    def create_message(subject, stripped_text)
           @post_message_url = @base_api_url + "messages"
           
       options = { :body => {:sender => @user["email"],
                             :recipient_id => get_mentor_id,
                             #:token => nil,
                             :subject => subject,
                             "stripped-text" => stripped_text}, 
                    :headers => { "authorization" => @auth_token }
           
       }
       
        response = Kele.post(@post_message_url, options)
    end
    
end
