json.array!(@white_labels) do |white_label|
  json.extract! white_label, :id
  json.url white_label_url(white_label, format: :json)
end
