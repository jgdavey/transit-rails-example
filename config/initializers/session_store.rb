# Be sure to restart your server when you modify this file.

require 'java'

java.lang.Class.for_name('javax.crypto.JceSecurity').get_declared_field('isRestricted').tap{|f| f.accessible = true; f.set nil, false}

Rails.application.config.session_store :cookie_store, key: '_transit-ruby-example_session'
