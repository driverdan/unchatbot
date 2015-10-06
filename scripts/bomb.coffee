# Description:
#   it looks like a clock but is probably a bomb
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   clock
# 
# Author
#   dieseltravis
# 

module.exports = (robot) ->
  robot.hear /\bclocks?\b/i, (msg) ->
    queryData =  {
        token: process.env.HUBOT_SLACK_TOKEN
        name: "bomb"
        channel: msg.message.rawMessage.channel
        timestamp: msg.message.id
      }
    
    if (queryData.timestamp?)
      msg.http("https://slack.com/api/reactions.add")
        .query(queryData)
        .post() (err, res, body) ->
          # error handling?
          return
