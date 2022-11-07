class Task < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  # Validando la presencia (aceptación de nulos) en la BD
  validates :title, presence: { message: 'El titulo debe estar presente' }
  validates :description, presence: true, presence: { message: 'La descripción debe estar presente' }
  validates :priority, presence: true, presence: { message: 'Debe asignar una prioridad a la tarea' }

  # Validar que los valores de prioridad solo puede estar entre 0 y 2
  validates :priority, numericality: { in: 0..2, message: 'La prioridad esta fuera de rango' }

  # Validación personalizada para la fecha de termino
  validate :valid_due_date?

  # Haciendo más entendibles/intuitivos los niveles
  enum priority: { low: 0, medium: 1, high: 2 }

  private

  # Función para validar que la fecha de termino no este en el pasado
  def valid_due_date?
    unless due_date > Date.today
      errors.add(:due_date, "La fecha no puede estar en le pasado")
    end
  end
end
