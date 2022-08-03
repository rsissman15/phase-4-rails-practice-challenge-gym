class MembershipSerializer < ActiveModel::Serializer
    attributes :charge
  
    belongs_to :client
  end
  