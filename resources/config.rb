actions :create, :delete, :add, :remove
default_action :create

attribute :templates, :kind_of => Array, :default => []
