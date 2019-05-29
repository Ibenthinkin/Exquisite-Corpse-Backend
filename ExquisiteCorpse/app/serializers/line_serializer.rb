class LineSerializer < ActiveModel::Serializer
  attributes :id, :content, :author, :color, :corpse_id
  belongs_to :corpse

end
