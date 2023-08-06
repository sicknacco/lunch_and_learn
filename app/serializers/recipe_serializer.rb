class RecipeSerializer
  include JSONAPI::Serializer
  attributes :title, :url, :country, :image
end

## Gets called on in the recipes controller