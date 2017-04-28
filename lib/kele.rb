# research why we needed to 
require 'httparty'
require 'json'
class Kele
    #research why we needed HTTParty here
    include HTTParty

    def self.new username, password
        @base_api_url = 'https://www.bloc.io/api/v1/'
        options = {
            body: {
                    email: username,
                    password: password
            }
        }
        # research why self did not work
        @sessions_url = @base_api_url + 'sessions'
        token = Kele.post(@sessions_url, options)
        hash_item = JSON.parse(token.body)
        @auth_token = hash_item["auth_token"]
        @user = hash_item["user"]
        self
    end
    
    def self.get_me
        user_url = @base_api_url + 'users/me'
        response = Kele.get(user_url, headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end
    
    def self.get_mentor_id
        user_url = @base_api_url + 'users/me'
        response = Kele.get(user_url, headers: { "authorization" => @auth_token })
        JSON.parse(response.body)["current_enrollment"]["mentor_id"]
    end
    
    
    def self.get_mentor_availability mentor_id
       mentor_availability_url = @base_api_url + 'mentors/'
       mentor_availability_url += mentor_id.to_s
       mentor_availability_url += '/student_availability'
       response = Kele.get(mentor_availability_url, headers: { "authorization" => @auth_token })
       JSON.parse(response.body)
    end
    
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
            
  def self.hi
    puts "Hello world!"
  end
    
end