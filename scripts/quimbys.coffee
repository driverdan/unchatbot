cheerio = require('cheerio')

module.exports = (robot) ->
  robot.respond /quimby|JBQ/i, (msg) ->
    msg.http("https://www.jbquimbys.com/menu").get() (error, response, body) ->
      if error
        msg.send error
      else
        $ = cheerio.load(body)
        title = cleanText $("td#title").text()
        body = cleanText $("td#title").parent().next().html()
        body = body.split(/\<table[ \w\d"=%]+\>/)
        body = body.map (item) -> cleanItem(item)
        body = body.join("\n\n")
        msg.send "*#{title}*#{body}"

cleanText = (text) ->
  cleaned = text

  cleaned = cleaned.replace /\$ /g, "$$"
  cleaned = cleaned.replace /\ +/g, " "
  cleaned = cleaned.replace /&nbsp;/g, ""

cleanItem = (item) ->
  cleaned = cleanText(item)
  cleaned = cleaned.replace /<b>([\w \/\$.\d\&-]+)<\/b>/g, "*$1* "
  cleaned = cleaned.replace /<br ?\/>/g, ""
  cleaned = cleaned.replace /<\/table>/g, "\n"
  cleaned = cleaned.replace /<\/?(tr|td|img|\!)[- \w="\/.\d\$\&]*>/g, ""
  cleaned = cleaned.replace "* *", "* - *"
  cleaned = cleaned.replace "H am", "Ham"
