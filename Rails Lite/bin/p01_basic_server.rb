require 'rack'

# app = Proc.new do |env|
#   req = Rack::Request.new(env)
#   res = Rack::Response.new
#   res['Content-Type'] = 'text/html'
#   res.write("Hello world!")
#   res.finish
# end


# Rack::Server.start(
#   app: app,
#   Port: 3000
# )

# app = Proc.new do |env|
#   req = Rack::Request.new(env)
#   res = Rack::Response.new
#   res['Content-Type'] = 'text/html'
#   res.write("Hello world!")
#   res.finish
# end



class MyController 

    def initialize(req, res)
        @req = req
        @res = res
    end

    def my_render(content, content_type = "text/html")
        @res.write(content)
        @res['Content-Type'] = content_type
        nil
    end

    def execute
        if @req.path == "/i/love/app/academy"
            my_render "/i/love/app/academy"
        end
    end
end

app = Proc.new do |env|
    req = Rack::Request.new(env)
    res = Rack::Response.new
    MyController.new(req, res).execute
    res.finish
end


Rack::Server.start(
  app: app,
  Port: 3000
)