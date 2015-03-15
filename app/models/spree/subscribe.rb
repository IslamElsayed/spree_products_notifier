module Spree
	class Subscribe < ActiveRecord::Base
		belongs_to :user
		belongs_to :variant
		validates_presence_of :user, :variant
		validates_uniqueness_of :user_id, scope: :variant_id
	end
end
