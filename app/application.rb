class Application

  @@items = [Item.new("Apples",2.00), Item.new("Oranges",2.50)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if !req.path.match(/items/)
      resp.status=404
      resp.write "Route not found"
    else
      n = req.path.split("/items/").last
      if item =@@items.find{|item| item.name == n}
        resp.write item.price
      else 
        resp.status = 400
        resp.write "Item not found"
      end
    end
    resp.finish
  end

end