require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection

class User < ActiveRecord::Base
    has_many :memos
    has_many :mandalarts
    
    has_secure_password
    validates :mail,
     presence: true,
     format: {with:/\A.+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+\z/}
    validates :password,
     format: {with:/(?=.*?[a-z])(?=.*?[0-9])/},
     length: {in: 5..10}
end

class Memo < ActiveRecord::Base
    belongs_to :user
end

class Mandalart < ActiveRecord::Base
    has_many :cells
    belongs_to :user
end

class Cell < ActiveRecord::Base
    belongs_to :mandalart
end
