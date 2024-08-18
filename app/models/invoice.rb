class Invoice < ApplicationRecord
  has_many :products, dependent: :destroy

  filterrific( 
   available_filters: [
     :search_query,
     :dhemi_gte,
     :dhemi_lt
   ]
 )

 scope :search_query, lambda { |query|
  where("emit ILIKE ? or xnome ILIKE ?", "%#{query}%", "%#{query}%")
}

scope :dhemi_gte, lambda { |reference_time|
where('dhemi >= ?', reference_time)
}

scope :dhemi_lt, lambda { |reference_time|
where('dhemi < ?', reference_time)
}

end
