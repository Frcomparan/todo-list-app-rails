class Task < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  # Haciendo más entendibles/intuitivos los niveles
  enum priority: { low: 0, medium: 1, high: 2 }
end
