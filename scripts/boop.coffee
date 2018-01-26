# Description:
#   boop.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   boop
#
# Author:
#   dieseltravis

module.exports = (robot) ->
  robot.hear /\bboop\b/i, (msg) ->
    msg.http("https://mltshp.com/shake/boop/rss")
      .get() (err, res, body) ->
        if err?
          console.log(err)
          console.log(res)
          console.log(body)
        if body?
          allImgs = /<img\s*border="0"\s*src="[^#>\s]+"/ig
          getImgs = body.match(allImgs)
          randMax = getImgs.length - 1
          randomIndex = (Math.floor(Math.random() * randMax))
          oneImg = getImgs[randomIndex]
          thisImg = /<img\s*border="0"\s*src="([^#>\s]+)"/i
          shkImg = oneImg.match(thisImg)[1]
          shkUrl = shkImg
          
          msg.send shkUrl
          return

        msg.send "https://i.imgur.com/bDA2AnF.gif"
        return
