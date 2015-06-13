cheerio = require('cheerio')

module.exports = (robot) ->
  robot.respond /scottcomic( me)? (.*)/i, (msg) ->
    msg.http("http://coral.subsonicradio.com:23280/c/").get() (error, response, body) ->
      $ = cheerio.load(body)
      msg.send "http://coral.subsonicradio.com:23280" + $("a[name=#{msg.match[2]}]").next().next().attr("src")
