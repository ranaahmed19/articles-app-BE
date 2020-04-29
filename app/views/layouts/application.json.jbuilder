json.success response.successful?
if response.successful?
  json.data JSON.parse(yield)
else
  json.errors do
    json.code response.status
    json.message @message
  end
end
