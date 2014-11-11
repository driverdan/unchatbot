cheerio = require('cheerio')
iconv   = require('iconv-lite')
charset = require('charset')
request = require('request')

module.exports = (robot) ->
  robot.respond /quimby|JBQ/i, (msg) ->
    request.get {url:"http://www.jbquimbys.com/menu.php", encoding: 'binary'}, (error, response, body) ->
      enc = charset(response.headers, body)
      msg.send enc
      if enc != 'utf-8'
        html = iconv.decode(new Buffer(body, 'binary'), enc)
      else
        html = body
      $ = cheerio.load(html)
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
