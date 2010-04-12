require 'sinatra'

class Comment
  attr_accessor :body

  def self.all
    @comments ||= []
  end

  def save
    self.class.all << self
  end
end

post '/comments' do
  comment = Comment.new
  comment.body = params["body"]
  comment.save
  puts "created comment: #{comment.body}"
  redirect request.referrer
end

get '/comments.js' do
  js = params["callback"].to_s
  comments_json = Comment.all.collect{|comment| "{\"body\":\"#{comment.body}\"}" }.join(',')
  js += "([#{comments_json}])"
end