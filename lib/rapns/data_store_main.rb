class DataStoreMain < ActiveRecord::Base
 
  # Tell Active Record (AR) to not look up for a table called like this class,
  # since this class is only used to add custom config for AR
  self.abstract_class = true
 
  databases = YAML::load(IO.read('config/database.yml'))
  establish_connection(databases[Rails.env])
 
end