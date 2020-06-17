# Description:
#   it is poop
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_SLACK_TOKEN needs to be set
#
# Commands:
#   poop, shit, crap, scat, shat
# 
# Author
#   dieseltravis, kingdonb
# 

module.exports = (robot) ->
  robot.hear /chorn|poo+p|shi+t|cra+p|s[ch]a+t/i, (msg) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "poop"
        channel: msg.message.rawMessage.channel
        timestamp: msg.message.id
      }
    
    if (queryData.timestamp?)
      msg.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          # error handling?
          return
