class Todo < ApplicationRecord
  validates :name, presence: true #Validates that class Todo has a name parameter before the info goes into the database
  validates :description, presence: true
  
  
end