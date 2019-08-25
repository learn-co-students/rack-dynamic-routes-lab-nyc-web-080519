require 'pry'
class Application
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
  
        if req.path.match(/items/)
            item = req.path.split("/items/").last
            if @@items.find{|i| i.name == item}
              my_purchase = @@items.find{|i| i.name == item}
              resp.write my_purchase.price
            else
              resp.write "Item not found"
              resp.status = 400
            end
      else
          resp.write "Route not found"
          resp.status = 404
      end
      resp.finish
    end
  end