class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item = @@items.find do |i|                     i.name == item_name
        end 
         resp.write "The price of your item is #{item.price}"
      else 
        resp.status = 400
        resp.write "Item not found"
      end 
    else 
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end #end of call method 
end #end of class