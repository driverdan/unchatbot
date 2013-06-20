# Description:
#   Find out where Ben is
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   where is (ben|rubiety) - Find out where he is

module.exports = (robot) ->
  robot.hear /where is (ben|rubiety)/i, (msg) ->
    msg.http("http://www.whereintheworldisben.com/location.json")
      .get() (err, res, body) ->
        msg.send "#{msg.match[1]} is in #{JSON.parse(body).location}"
