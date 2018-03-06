require 'twitter'
require 'optparse'
require 'ChunkyText'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: app.rb [options]"

  opts.on('-b', '--book PATH', 'Twitter API Consumer Key') { |v| options[:book] = v }
  opts.on('-i', '--initial_timestamp TIMESTP', 'Initial timestamp') { |v| options[:timestamp] = v }
  opts.on('-k', '--consumer_key KEY', 'Twitter API Consumer Key') { |v| options[:consumer_key] = v }
  opts.on('-s', '--consumer_secret SOURCE', 'Twitter API Consumer Secret') { |v| options[:consumer_secret] = v }
  opts.on('-a', '--access_token TOKEN', 'Twitter API Access Token') { |v| options[:access_token] = v }
  opts.on('-t', '--access_token_secret SECRET', 'Twitter API Access Token Secret') { |v| options[:access_token_secret] = v }
  
end.parse!

client = Twitter::REST::Client.new do |config|
    config.consumer_key        = options[:consumer_key]
    config.consumer_secret     = options[:consumer_secret]
    config.access_token        = options[:access_token]
    config.access_token_secret = options[:access_token_secret]
end

offset = ((Time.now.to_i - options[:timestamp].to_i) / 3600).round

data = File.read(options[:book])
text = ChunkyText::Chunker.new(data, 145)
chunked = text.chunk_array

tweet = chunked[offset].gsub("\n", ' ').squeeze(' ').split(') ')
client.update(tweet[1])
