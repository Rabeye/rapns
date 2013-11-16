module Rapns
  class App < DataStoreMain
    self.table_name = 'rapns_apps'

    if Rapns.attr_accessible_available?
      attr_accessible :name, :environment, :certificate, :password, :connections, :auth_key
    end

    has_many :notifications, :class_name => 'Rapns::Notification', :dependent => :destroy

    validates :name, :presence => true, :uniqueness => { :scope => [:type, :environment] }
    validates_numericality_of :connections, :greater_than => 0, :only_integer => true
  end
end
