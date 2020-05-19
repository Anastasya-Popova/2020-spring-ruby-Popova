require "roda"

class App < Roda
  route do |r|
      # GET / request
      r.root do
          r.redirect "/hello"
      end

      # /hello branch
      r.on "hello" do
          # Set variable for all routes in /hello branch
          @greeting = "Hello"
      
         

          # GET /hello/world request
           r.get "world" do
              "#{@greeting} world!"
           end

          # /hello request
          r.is do
                # GET /hello request
                r.get do
                    "#{@greeting}!"
                end

              # POST /hello request
              r.post do
                  puts "Someone said #{@greeting}!"
                  r.redirect
               end
            end
        end
     

       # /get branch
       r.on "get" do
          # GET /get/rng request
          r.on "rng" do
            "#{@greeting} random value:"+ (rand(5101)-101).to_s

            # GET /get/sophisticated/rng?min&max request
             r.get "sophisticated" do
               " (rand(r.params['max']+1)-(r.params['min']+1)).to_s"
             end

          end
          
            
       end
    

      # /cool branch
      r.on "cool" do
      # GET /cool/hello/NAME/SURNAME request
      r.get "hello",String,String do |name,surname|
        "Hello, #{name} #{surname}"
        end 
      end
        
      # /calc branch
      r.on "calc" do
          # GET /calc/min/NUM_ONE/NUM_TWO request
          r.get "min",Integer,Integer do |num_one,num_two|
              if(num_one<num_two)
              "Min between #{num_one} and #{num_two} is #{num_one}"
              else
              "Min between #{num_one} and #{num_two} is #{num_two}"
              end 
          end
          # GET /calc/multiply/NUM_ONE/NUM_TWO request
          r.get "multiply",String,String do |num_one,num_two|
              "Multiply #{num_one} and #{num_two} is "+(num_one.to_f*num_two.to_f).to_s
          end
        end
     

     # GET /post/2011/02/16/hello
      r.get "post", Integer, Integer, Integer, String do |year, month, day, slug|
        "#{year}-#{month}-#{day} #{slug}" #=> "2011-02-16 hello"
      end

      r.on "a" do           # /a branch
        r.on "b" do         # /a/b branch
          r.is "c" do       # /a/b/c request
            r.get do
              "Request from a/b/c"
            end    # GET  /a/b/c request
            r.post do end   # POST /a/b/c request
          end
          r.get "d" do
            "Request from 'd'"
          end  # GET  /a/b/d request
          r.post "e" do end # POST /a/b/e request
        end
      end
  

      # /search?q=barbaz
      r.get "search" do
         "Searched for #{r.params['q']}" #=> "Searched for barbaz"
      end
    end
end