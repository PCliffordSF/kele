# research why we needed to require httparty here
require 'httparty'
class Kele
    #research why we needed HTTParty here
    include HTTParty

    def self.new username, password
        api_url = 'https://www.bloc.io/api/v1/sessions'
        options = {
            body: {
                    email: username,
                    password: password
            }
        }
        # research why self did not work
        token = Kele.post(api_url, options)
        self
    end
    
  def self.hi
    puts "Hello world!"
  end
    
end