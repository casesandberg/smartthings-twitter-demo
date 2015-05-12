Twitter = require('node-tweet-stream')
chalk = require('chalk')
request = require('request')



settings =
  # Twitter App Info
  consumer_key: '4C3TaZb0CQ0c4iw9b1AsOXIY9'
  consumer_secret: '1jjqGE1bfQ6gTAeMfLrpnBDzeJMmpCy5ZWcHX7ELhGD8Gbk2n6'
  token: '20654202-RTVFGGHLBeyEwcLQ23bSAQ4cuTYCxUK2x5Sye5qY7'
  token_secret: 'FBVktAPXuC1vQMxbdT2Tiie6ArNO8kCP7XUwTY4fdbplK'

  # Account or keyword to watch:
  track: '@smartthingsdev #IoTWorld2015'

  # Post to here:
  url: 'https://graph.api.smartthings.com/api/<ID>/hue'



stream = new Twitter
  consumer_key: settings.consumer_key
  consumer_secret: settings.consumer_secret
  token: settings.token
  token_secret: settings.token_secret

stream.track settings.track
console.log chalk.dim('.'), chalk.dim('\n.'), chalk.dim('\n.'), chalk.dim('\n.')
console.log 'Tweets Matching:', chalk.blue(settings.track)
console.log chalk.dim('\u2500')

stream.on 'tweet', (tweet) ->
  console.log chalk.bold(tweet.user.screen_name)
  console.log tweet.text
  request.post settings.url, text: tweet.text, (err, res, body) ->
    console.log err if err
  console.log chalk.dim('\u2500')

stream.on 'error', (err) ->
  console.log err
