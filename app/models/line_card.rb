class LineCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :team
end
