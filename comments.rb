require 'sinatra'
require 'ripple'
require 'yajl'

class Comment
  include Ripple::Document
  property :author, String, :presence => true
  property :email, String, :presence => true
  property :url, String
  property :body, String, :presence => true

  def to_json
    attributes.merge("id" => key)
  end

  def self.all_to_json
    all.collect(&:to_json)
  end
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
  json = Yajl::Encoder.encode(Comment.all_to_json)
  js += "(#{json})"
end