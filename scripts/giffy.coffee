# Description:
#   image links for common meme filenames
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   thatsracist.gif - links the "that's racist" gif
#   esoesracista.gif - links the "eso es racista" gif
#   underconstruction.gif - links a web 1.0 "under construction" gif
#   aaah.gif - links a screaming Lucille Bluth gif
#
# Author:
#   nathos at nathos dot com

thatsracist = [
  "http://i.imgur.com/kVeKphq.gif",
  "http://i.imgur.com/xV3sl.gif"
]

underconstruction = [
  "http://i.imgur.com/zoPG6pa.gif",
  "http://i.imgur.com/RDyyeQq.gif",
  "http://i.imgur.com/CuTTnPu.gif",
  "http://i.imgur.com/lzIHNlq.gif"
]

module.exports = (robot) ->
  robot.hear /that's racist|^thatsracist(.gif)?/i, (msg) ->
    msg.send msg.random thatsracist

  robot.hear /eso es racista|^esoesracista(.gif)?/i, (msg) ->
    msg.send "http://i.imgur.com/xmsoGe2.gif"

  robot.hear /under construction|^underconstruction(.gif)?/i, (msg) ->
    msg.send msg.random underconstruction

  robot.hear /^(a)\1{1,}h(.gif)?/i, (msg) ->
    msg.send "http://i.imgur.com/NIlGIxG.gif"
