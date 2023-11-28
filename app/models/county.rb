class County < ActiveRecord::Base
    has_many :libraries, dependent: :destroy
end
