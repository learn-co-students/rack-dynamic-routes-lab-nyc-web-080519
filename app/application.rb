
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      item_obj_arr = @@items.select {|obj| obj.name == item}
      if item_obj_arr.length > 0
        item_obj = item_obj_arr.first
        resp.write "#{item_obj.name} costs #{item_obj.price}"
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end  # ends IF statement about path match


    resp.finish
  end  # ends Call(env) method
end  # ends Application class