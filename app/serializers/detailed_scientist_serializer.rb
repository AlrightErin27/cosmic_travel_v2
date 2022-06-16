class DetailedScientistSerializer < ActiveModel::Serializer
  attributes :id, :name, :field_of_study, :avatar, :planets
end
