require_relative "config/environment"
require 'httparty'

$redis.config('SET', 'notify-keyspace-events', 'KEA')

$redis.psubscribe('__keyevent@0__:expired') do |on|
  on.pmessage do |pattern, event, key|
  $event = key.split('_').first.to_s
  case $event
    when "auto:temp"
      Archive.stat

      url = 'https://temp.rifa-max.com/refresh'

      HTTParty.get(url)
    else
      puts "Event has not been defined: #{$event}. Events defined are: auto:temp"
    end
  end
end