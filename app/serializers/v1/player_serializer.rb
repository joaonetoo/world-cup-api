module V1
    class PlayerSerializer < ActiveModel::Serializer
      attributes :id, :name, :position, :age, :links
      belongs_to :team

      def links
         { self: v1_player_url(object.id) }
      end

    end
end
