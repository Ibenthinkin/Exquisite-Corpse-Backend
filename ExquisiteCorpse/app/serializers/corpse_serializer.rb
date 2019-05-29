class CorpseSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :lines
end
