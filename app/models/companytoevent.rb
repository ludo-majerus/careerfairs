class Companytoevent < ActiveRecord::Base
  before_save :set_default_lunch
  before_save :set_default_desk
  before_save :set_default_chair
  before_save :set_default_table
  before_save :set_default_trash
  before_save :set_default_clothesrack
  before_save :set_default_shelf

  belongs_to :company
  belongs_to :event
  has_many :jobs
  has_many :badges

  attr_accessible :company_id, :event_id, :lunch, :desk, :chair, :table, :trash, :clothesrack, :shelf, :stand_size

  def set_default_lunch
    self.lunch = "0" unless self.lunch
  end

   def set_default_desk
    self.desk = "0" unless self.desk  
  end

   def set_default_chair
    self.chair = "0" unless self.chair  
  end

  def set_default_table
    self.table= "0" unless self.table  
  end

   def set_default_trash
    self.trash = "0" unless self.trash  
  end

   def set_default_clothesrack
    self.clothesrack = "0" unless self.clothesrack  
  end

   def set_default_shelf
    self.shelf = "0" unless self.shelf  
  end

end