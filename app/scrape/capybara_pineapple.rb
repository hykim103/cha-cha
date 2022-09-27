require 'selenium-webdriver'
require 'nokogiri'
require 'capybara'

puts 'Destroy all database...'
DanceClass.destroy_all

puts 'Create Pineapple Studio Object'
pineapple = Studio.create!(
  name: 'Pineapple Dance Studios',
  country: 'United Kingdom',
  city: 'London',
  address: '7 Langley St, London WC2H 9JA',
  url: 'https://www.pineapple.uk.com',
  image_url: 'https://cdn.shopify.com/s/files/1/0640/8011/files/pineapple_logo_s_7cb430c4-581a-403e-83a6-21bacfc4637e.png?v=1614741592'
)

puts 'Open the website...'
# Configurations
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.javascript_driver = :chrome
Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver = :selenium
end

# Visit
browser = Capybara.current_session
driver = browser.driver.browser

browser.visit 'https://www.pineapple.uk.com/pages/timetable'

puts 'Load the website...'
loop do
  sleep(20)
  break if driver.execute_script('return document.readyState') == 'complete'
end

puts 'Scrape sessions...'
doc = Nokogiri::HTML(driver.page_source)
sessions = doc.css('div.bw-widget__sessions > div.bw-widget__day > div.bw-session')
puts sessions.count
if sessions.count.positive?
  sessions.each do |session|
    puts 'Save Genre database'
    genre_name = session.css('div.bw-session__basics > div.bw-session__info > div.bw-session__group1 > div.bw-session__name').children[1].text.match(/^(.+) -/)[1]
    genre_name = 'Ballroom' if genre_name == 'World'
    genre = if Genre.find_by(name: genre_name).nil?
              Genre.create!(name: genre_name)
            else
              Genre.find_by(name: genre_name)
            end

    puts 'Save in DanceClass database...'

    DanceClass.create!(
      studio: pineapple,
      genre:,
      genre_name: session.css('div.bw-session__basics > div.bw-session__info > div.bw-session__group1 > div.bw-session__name').children[2].text.match?(/^(.+)\(/) ? session.css('div.bw-session__basics > div.bw-session__info > div.bw-session__group1 > div.bw-session__name').children[2].text.match(/^(.+)\(/)[1].strip : session.css('div.bw-session__basics > div.bw-session__info > div.bw-session__group1 > div.bw-session__name').children[2].text.match(/^(.+) £/)[1].strip,
      level: session.css('div.bw-session__basics > div.bw-session__info > div.bw-session__group1 > div.bw-session__name').text.match?(/\((.+)\)/) ? session.css('div.bw-session__basics > div.bw-session__info > div.bw-session__group1 > div.bw-session__name').text.match(/\((.+)\)/)[1].strip : 'Beg',
      weekday: DateTime.strptime(session.css('div.bw-session__basics > div.bw-session__info > div.bw-session__time > div.bw-session__column > span.hc_time > time.hc_starttime')[0].attributes['datetime'].value, '%Y-%m-%dT%H:%M').wday,
      start_time: DateTime.strptime(session.css('div.bw-session__basics > div.bw-session__info > div.bw-session__time > div.bw-session__column > span.hc_time > time.hc_starttime')[0].attributes['datetime'].value, '%Y-%m-%dT%H:%M'),
      end_time: DateTime.strptime(session.css('div.bw-session__basics > div.bw-session__info > div.bw-session__time > div.bw-session__column > span.hc_time > time.hc_endtime')[0].attributes['datetime'].value, '%Y-%m-%dT%H:%M'),
      instructor: session.css('div.bw-session__basics > div.bw-session__info > div.bw-session__group2 > div.bw-session__staff').text.strip,
      price: session.css('div.bw-session__basics > div.bw-session__info > div.bw-session__group1 > div.bw-session__name').text.match(/\d+/)[0].to_i,
      url: 'https://www.pineapple.uk.com/pages/timetable'
    )
  end
end

puts 'Completed!'
