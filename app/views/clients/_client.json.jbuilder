json.extract! client, :id, :full_name, :cpf, :birthday, :doctor_id, :created_at, :updated_at
json.url client_url(client, format: :json)
