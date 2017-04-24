class Kele

    def self.new username, password
        self.username = username
        self.password = password
        self.api_url = 'https://www.bloc.io/api/v1/sessions'
        options = {
            body: {
                    email: username,
                    password: password
            }
        }
        self.token = self.class.post(api_url, options)
        self
    end
    
  def self.hi
    puts "Hello world!"
  end
    
end