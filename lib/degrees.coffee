jsdom = require 'jsdom'

BASE_URL = "http://www.wunderground.com/cgi-bin/findweather/hdfForecast?query="
args = process.argv
zip  = if args[2] then args[2] else "11231"

jsdom.env BASE_URL + zip,
  ['http://code.jquery.com/jquery-1.5.min.js'],
  (errors, window) ->
    $    = window.jQuery
    high = $('.fctHiLow .b').html()
    low  = $('.fctHiLow').first().html().split('|')[1].split('°')[0].trim()

    console.log "Today's high: #{high}\nToday's low: #{low}"
