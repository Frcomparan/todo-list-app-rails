class Task < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  # Validando la presencia (aceptación de nulos) en la BD
  validates :title, presence: { message: 'El titulo debe estar presente' }
  validates :description, presence: { message: 'La descripción debe estar presente' }
  validates :priority, presence: { message: 'Debe asignar una prioridad a la tarea' }

  # Validación personalizada para la fecha de termino
  before_create :valid_due_date?

  # Haciendo más entendibles/intuitivos los niveles
  enum priority: { low: 0, medium: 1, high: 2 }

  # Creando scopes o atajos para los filtros
  scope :filter_by_date, -> { where due_date: Date.today }
  scope :filter_by_priority_low, -> { where priority: 0 }
  scope :filter_by_priority_medium, -> { where priority: 1 }
  scope :filter_by_priority_high, -> { where priority: 2 }

  def self.search_filter(filtering_param)
    results = self.where(nil)
    results = results.public_send("filter_by_#{filtering_param}")
    results
  end

  private

  # Función para validar que la fecha de termino no este en el pasado
  def valid_due_date?
    unless due_date > Date.today
      errors.add(:due_date, "La fecha no puede estar en le pasado")
    end
  end
end
