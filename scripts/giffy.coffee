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
#   goodgrief.gif - links a sad George Michael gif
#   popcorn.gif - links a Gus eating popcorn gif
#   yay.gif|hooray.gif - links an Anchorman team gif
#   iwillkillyou.gif - links a Steve Carrell will kill you gif
#   imout.gif - links a Homer has seen enough gif
#   disgonbgud.gif - links a "dis gon b gud" gif
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
  robot.hear /that's racist|^thatsracist(.gif)?$/i, (msg) ->
    msg.send msg.random thatsracist

  robot.hear /eso es racista|^esoesracista(.gif)?$/i, (msg) ->
    msg.send "http://i.imgur.com/xmsoGe2.gif"

  robot.hear /under construction|^underconstruction(.gif)?$/i, (msg) ->
    msg.send msg.random underconstruction

  robot.hear /^(a)\1{1,}h(.gif)?$/i, (msg) ->
    msg.send "http://i.imgur.com/NIlGIxG.gif"

  robot.hear /good grief|^goodgrief(.gif)?$/i, (msg) ->
    msg.send "http://i.imgur.com/eWytvqb.gif"

  robot.hear /pops popcorn|^popcorn(.gif)?$|^popspopcorn(.gif)?$|^guspopcorn(.gif)?$|^popcorngus(.gif)?$/i, (msg) ->
    msg.send "http://i.imgur.com/GQRnYf8.gif"

  robot.hear /hooray|yay\!|^yay(.gif)?$|^hooray(.gif)?$/i, (msg) ->
    msg.send "http://i.imgur.com/mBHknsc.gif"

  robot.hear /i will kill you|^iwillkillyou(.gif)?$/i, (msg) ->
    msg.send "http://i.imgur.com/dwbfY45.gif"

  robot.hear /i'm out|^imout(.gif)?$/i, (msg) ->
    msg.send "http://i.imgur.com/veHeUoP.gif"

  robot.hear /dis gon b gud|^disgonbgud(.gif)?$/i, (msg) ->
    msg.send "http://i.imgur.com/rFVchf2.gif"



