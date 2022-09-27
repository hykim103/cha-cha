require 'capybara/poltergeist'

session = Capybara::Session.new(:poltergeist)

session.visit('http://stackoverflow.com/')

puts session.document.title
