require 'pry'

class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        if req.path.include?("/item")
            item_to_price = req.path.split("/")[-1]
            @@items.each do |item|
                if item.name == item_to_price
                    resp.write item.price
                    resp.status = 200
                    break
                end
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