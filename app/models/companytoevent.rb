class Companytoevent < ActiveRecord::Base
  belongs_to :company
  belongs_to :event
  has_many :jobs
  has_many :badges
  attr_accessible :company_id, :event_id, :lunch, :desk, :chair, :table, :trash, :clothesrack, :shelf, :stand_size
  # validates :lunch, :numericality => {:only_integer => true}
  # validates :desk, :numericality => {:only_integer => true}
  # validates :chair, :numericality => {:only_integer => true}
  # validates :table, :numericality => {:only_integer => true}
  # validates :trash, :numericality => {:only_integer => true}
  # validates :clothesrack, :numericality => {:only_integer => true}
  # validates :shelf, :numericality => {:only_integer => true}

end