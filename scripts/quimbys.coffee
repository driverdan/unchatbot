cheerio = require('cheerio')
request = require('request') 

module.exports = (robot) ->
  robot.respond /quimby|JBQ/i, (msg) ->
    request
      uri: "http://www.jbquimbys.com/menu.php"
    , (error, response, body) ->
      $ = cheerio.load(body)
      msg.send $("td#title").text() + $("td#title").parent().next().text()

