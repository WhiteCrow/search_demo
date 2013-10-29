class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uid
end
