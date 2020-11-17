json.extract! profile, :id, :email, :password, :first_name, :surname, :dob, :bio, :picture_url, :created_at, :updated_at
json.url profile_url(profile, format: :json)
