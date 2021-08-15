class Product < ApplicationRecord
    validates :title, presence:true
    validates :price, presence:true
    validates :describe, presence:true
    validates :is_active, presence:true
end
