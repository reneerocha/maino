class Invoice < ApplicationRecord
    has_many :products, dependent: :destroy
end
