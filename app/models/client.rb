class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships

   
    attribute :total_charges

    def total_charges
        self.memberships.sum{|m| m.charge}
    end

   
end
