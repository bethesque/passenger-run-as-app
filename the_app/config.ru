puts "Running app"

map "/" do
  run -> (env) { [200, {}, ["Hello world"]]}
end
