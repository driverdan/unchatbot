cheerio = require('cheerio')

module.exports = (robot) ->
  robot.respond /quimby|JBQ/i, (msg) ->
    robot.http("http://www.jbquimbys.com/menu.php").get() (error, response, body) ->
      msg.send body
      $ = cheerio.load(body)
      title = cleanText $("td#title").text()
      body = cleanText $("td#title").parent().next().html()
      body = body.split(/\<table[ \w\d"=%]+\>/)
      body = body.map (item) -> cleanItem(item)
      body = body.join("\n\n")
      msg.send "*#{title}*\n#{body}"


cleanText = (text) ->
  cleaned = text

  cleaned = cleaned.replace /\$ /g, "$$"
  cleaned = cleaned.replace /\ +/g, " "
  cleaned = cleaned.replace /&nbsp;/g, ""

cleanItem = (item) ->
  cleaned = cleanText(item)
  cleaned = cleaned.replace /<b>([\w \/\$.\d-]+)<\/b>/g, "*$1* "
  cleaned = cleaned.replace /<br ?\/>/g, ""
  cleaned = cleaned.replace /<\/table>/g, "\n"
  cleaned = cleaned.replace /<\/?(tr|td|img|\!)[- \w="\/.]*>/g, ""
