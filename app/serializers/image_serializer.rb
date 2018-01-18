class ImageSerializer < ActiveModel::Serializer
  attributes :id, :name, :img
  has_one :user
end
