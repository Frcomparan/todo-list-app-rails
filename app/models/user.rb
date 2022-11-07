class User < ApplicationRecord
  # Configuración default de -DEVICE GEM-
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Asignación de la relación entre usuario y tareas
  has_many :tasks, foreign_key: :owner_id
end
