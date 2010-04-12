require 'sinatra'
require 'ripple'

class Comment
  include Ripple::Document
  property :author, String, :presence => true
  property :email, String, :presence => true
  property :url, String
  property :body, String, :presence => true
end

post '/comments' do
  comment = Comment.new(params["comment"])
  if comment.save
    puts "created comment: #{comment.body}"
    redirect request.referrer
  else
    raise comment.inspect
  end
end

get '/comments.js' do
  js = params["callback"].to_s
  comments_json = Comment.all.collect{|comment| "{\"body\":\"#{comment.body}\"}" }.join(',')
  js += "([#{comments_json}])"
end