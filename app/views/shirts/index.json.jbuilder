json.array!(@shirts) do |shirt|
  json.extract! shirt, :id, :code, :label, :description, :ean, :profile, :collar, :breast_pocket, :wristband, :color, :cloth, :price, :link, :affiliate, :picture, :size_collar, :size_bust, :size_waist, :size_body, :size_arm, :size_shoulder, :size_back, :size_wrist, :sleeve
  json.url shirt_url(shirt, format: :json)
end
