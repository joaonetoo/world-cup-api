module V1
  class TeamSerializer < ActiveModel::Serializer
    attributes :id, :name, :links
    belongs_to :group

    has_many :players

    has_many :matches

    def players
      object.players.select {|p| p.id}
    end

    def links
       {self: v1_team_url(object.id)}
    end
  end
end
