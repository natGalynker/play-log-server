class ExerciseSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
end
