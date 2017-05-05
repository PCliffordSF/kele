# research why we needed to 
require 'httparty'
require 'json'
require 'kele/roadmaps'

class Kele
    #research why we needed HTTParty here
    #instance methods
    include HTTParty
    #class methods
    extend Roadmaps

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
        puts '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
        puts @sessions_url
        puts options
        token = Kele.post(@sessions_url, options)
        
        hash_item = JSON.parse(token.body)
        p hash_item
        @auth_token = hash_item["auth_token"]
        puts '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
        @user = hash_item["user"]
        puts @auth_token
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
    
            
  def self.hi
    puts "Hello world!"
  end
    
end

