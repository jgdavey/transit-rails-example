require 'lib/clojure-1.6.0.jar'
require 'java'

java_import "clojure.java.api.Clojure"

load_clj = Clojure.var("clojure.core", "load-file")

load_clj.invoke("lib/foo.clj")
# Dir["lib/**/*.clj"].each do |clj|
#   puts "Loading #{clj}"
#   load_clj.invoke(clj)
# end

hello = Clojure.var("foo", "hello")
hello.invoke("World")
