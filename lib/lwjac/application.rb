post '/comments' do
  comment = Comment.new(params["comment"])
  comment.save
  redirect request.referrer
end

get '/comments.js' do
  js = params["callback"].to_s
  json = Yajl::Encoder.encode(Comment.all_to_json)
  js += "(#{json})"
end