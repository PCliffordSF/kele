class Kele::Roadmaps

    def self.get_roadmap roadmap_id
        roadmap_id_url = @base_api_url + 'roadmaps/'
        roadmap_id_url += roadmap_id.to_s
        response = Kele.get(roadmap_id_url, headers: { "authorization" => @auth_token })
        puts "These are the checkpoint ids:"
        JSON.parse(response.body)["sections"][0]["checkpoints"].each {|id|
        puts id["id"]
        }
        @roadmaps = JSON.parse(response.body)
    end
    
    def self.get_checkpoint checkpoint_id
        checkpoint_id_url = @base_api_url + 'checkpoints/'
        checkpoint_id_url += checkpoint_id.to_s
        puts checkpoint_id_url
        response = Kele.get(checkpoint_id_url, headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end
    
end