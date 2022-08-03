class Gym < ApplicationRecord
    has_many :memberships, dependent: :destroy
    has_many :clients, through: :memberships

    validates :client_id, uniqueness:{scope: :gym_id}
end
