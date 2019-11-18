json.extract! deck, :id, :vitality, :rank, :name, :description, :theme_id, :stars, :is_private, :parent_id, :created_at, :updated_at
json.url deck_url(deck, format: :json)
