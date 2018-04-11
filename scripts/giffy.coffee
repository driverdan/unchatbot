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
  "http://i.imgur.com/kVeKphq.gif"
  "http://i.imgur.com/xV3sl.gif"
  "http://i2.kym-cdn.com/photos/images/newsfeed/000/157/122/f.gif"
]

underconstruction = [
  "http://i.imgur.com/zoPG6pa.gif"
  "http://i.imgur.com/RDyyeQq.gif"
  "http://i.imgur.com/CuTTnPu.gif"
  "http://i.imgur.com/lzIHNlq.gif"
]

orly = [
  "http://i.imgur.com/a7bmz.jpg"
  "http://www.animateit.net/data/media/august2009/th_orly.gif"
]

winner = [
  "http://drpop.org/wp-content/uploads/2010/11/wehaveawinner_img__620x300.jpg"
]

yay = [
  "http://i.imgur.com/mBHknsc.gif"
  "http://media.tumblr.com/tumblr_ljvvxcQGj71qf86qm.gif"
  "http://media.tumblr.com/tumblr_m0f55scWAv1qmwb38.gif"
  "http://mitadmissions.org/images/mit-blogs/yay.gif"
  "http://media.tumblr.com/tumblr_m5oh7k978u1rrvu1a.gif"
]

fuckyou = [
  "http://i.imgur.com/MwTNGr8.gif"
]

holdbutts = [
  "http://butt.holdings/hold-onto-your-butts.gif"
  "http://i.imgur.com/JpXxCBz.png"
  "http://i.imgur.com/JSk5Dmn.png"
]

module.exports = (robot) ->
  robot.hear /that'?s ?racist(.gif)?$/i, (msg) ->
    msg.send msg.random thatsracist

  robot.hear /eso ?es ?racista(.gif)?$/i, (msg) ->
    msg.send "http://i.imgur.com/xmsoGe2.gif"

  robot.hear /under ?construction(.gif)?$/i, (msg) ->
    msg.send msg.random underconstruction

  robot.hear /^(a)\1{1,}h(.gif)?$/i, (msg) ->
    msg.send "http://i.imgur.com/NIlGIxG.gif"

  robot.hear /good ?grief(.gif)?$/i, (msg) ->
    msg.send "http://i.imgur.com/eWytvqb.gif"

  robot.hear /pops popcorn|^popcorn(.gif)?$|^popspopcorn(.gif)?$|^guspopcorn(.gif)?$|^popcorngus(.gif)?$/i, (msg) ->
    msg.send "http://i.imgur.com/GQRnYf8.gif"

  robot.hear /\bhooray\b|\byay\b/i, (msg) ->
    msg.send msg.random yay

  robot.hear /i ?will ?kill ?you(.gif)?$/i, (msg) ->
    msg.send "http://i.imgur.com/dwbfY45.gif"

  robot.hear /i'?m ?out(.gif)?$/i, (msg) ->
    msg.send "http://i.imgur.com/veHeUoP.gif"

  robot.hear /dis ?gon ?b ?gud(.gif)?$/i, (msg) ->
    msg.send "http://i.imgur.com/rFVchf2.gif"

  robot.hear /o ?rly\??$/i, (msg) ->
    msg.send msg.random orly

  robot.hear /we have a winner$/i, (msg) ->
    msg.send msg.random winner

  robot.hear /fuck you$/i, (msg) ->
    msg.send msg.random fuckyou

  robot.hear /hold on\s?to your butts$/i, (msg) ->
    msg.send msg.random holdbutts
