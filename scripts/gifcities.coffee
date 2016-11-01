# Description:
#   searches archive.org's gifcities and returns a random result
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot gifcities [query]
#
# Author:
#   dieseltravis

module.exports = (robot) ->
  robot.respond /\gifcities(\s+me\b)?\s*(.*)/i, (msg) ->
    query = msg.match[2] || "gif"
    msg.http("https://wbgrp-svc060.us.archive.org/api/v1/gifsearch")
      .query(q: query)
      .get() (err, res, body) ->
        if err?
          console.log(err)
          console.log(res)
          console.log(body)
        if body?
          images = JSON.parse(body)
          if images?.length
            randMax = images.length - 1
            randomIndex = (Math.floor(Math.random() * randMax))
            oneImg = images[randomIndex]
            imgSrc = oneImg.gif
            msg.send "https://web.archive.org/web/" + imgSrc
            return
        
        msg.send "https://web.archive.org/web/20090822001545/http://geocities.com/giagkoud/underconstruction.gif"
        return
