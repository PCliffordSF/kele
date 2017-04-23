def initialize username, password
    @kele = Kele.new
    @kele.username = username
    @kele.password = password
    self.api_url = 'https://www.bloc.io/api/v1'
    #.token = self.class.post {email: :@kele.username, password: :password }
    
end