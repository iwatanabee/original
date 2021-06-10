require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection

class User < ActiveRecord::Base
    has_secure_password
    
    has_many :memos
    has_many :workspaces
end

class Memo < ActiveRecord::Base
    belongs_to :user
end

class Workspace < ActiveRecord::Base
    has_many :cells
    belongs_to :user
end

class Cell < ActiveRecord::Base
    belongs_to :workspace
end
