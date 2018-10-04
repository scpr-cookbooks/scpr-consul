actions :delete
default_action :create

attribute :name,        kind_of: String
attribute :dir,         kind_of: String,               default: ''
attribute :hostname,    kind_of: String,               default: 'localhost'
attribute :match,       kind_of: [String, Regexp]
attribute :interval,    kind_of: String,               default: '10s'
attribute :path,        kind_of: String,               default: '/'
attribute :port,        kind_of: [String, Integer],    default: 80
attribute :name_suffix, kind_of: [String, FalseClass], default: 'web'
attribute :tags,        kind_of: Array,                default: ['web']
