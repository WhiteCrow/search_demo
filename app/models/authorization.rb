class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uid
  validates_presence_of :provider, :uid
  validates_uniqueness_of :uid, :scope => :provider
end
