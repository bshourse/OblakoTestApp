class TodoSerializer < ActiveModel::Serializer
  attributes :id, :text, :isCompleted
  belongs_to :project
end
