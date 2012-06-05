class Solution < ActiveRecord::Base
  attr_accessible :completed, :count, :end_word, :nodes, :start_word, :total_cost
end
