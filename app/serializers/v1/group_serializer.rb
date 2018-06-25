module V1
    class GroupSerializer < ActiveModel::Serializer
      attributes :id, :name, :links
      has_many :teams

      def links
         { self: v1_group_url(object.id) }
      end

    end
end
