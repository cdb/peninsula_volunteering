class Opportunity < ActiveRecord::Base
  validates_presence_of :title, :description, :date, :start_time, :end_time
  validates_numericality_of :number_of_positions
end
