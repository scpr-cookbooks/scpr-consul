actions :delete
default_action :create

attribute :name,      kind_of:String
attribute :dir,       kind_of:String
attribute :hostname,  kind_of:String
attribute :match,     kind_of:[String,Regexp]
attribute :interval,  kind_of:String, default:"10s"
attribute :path,      kind_of:String, default:"/"