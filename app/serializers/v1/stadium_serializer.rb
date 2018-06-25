module V1
    class StadiumSerializer < ActiveModel::Serializer
      attributes :id, :name, :city, :links
      has_many :matches


      def links
         { self: v1_stadium_url(object.id) }
      end

    end
end
