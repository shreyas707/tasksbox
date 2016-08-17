json.array!(@departments) do |department|
  json.extract! department, :id
  json.url department_url(department, format: :json)
end
