class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :category, :name, :description, :duration, :user_id, :done,
             :editable

  def editable
    scope == object.user
  end
end
