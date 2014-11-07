cheerio = require('cheerio')
request = require('request') 

module.exports = (robot) ->
  robot.respond /scottcomic( me)? (.*)/i, (msg) ->
    request
      uri: "http://coral.subsonicradio.com:23280/c/"
    , (error, response, body) ->
      $ = cheerio.load(body)
      msg.send $("a[name=#{msg.match[2]}]").next().next().attr("src")

