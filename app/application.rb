class Application
    # @@item = [{name: item, price: 3.42},{name: item2, price: 4.00}]
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
  
      if req.path.match(/items/)
        puts "#{}"
        req_item = req.path.split(/[\/]/).last
        resp_item = @@items.find{|it| it.name == req_item}
        if resp_item
            resp.write "#{req_item}'s item price is #{resp_item.price}"
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
  