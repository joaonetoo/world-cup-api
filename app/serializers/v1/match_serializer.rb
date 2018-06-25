module V1
    class MatchSerializer < ActiveModel::Serializer
      attributes :id, :date, :links
      belongs_to :stadium
      has_many :matches

      def links
         { self: v1_match_url(object.id) }
      end

    end
end
