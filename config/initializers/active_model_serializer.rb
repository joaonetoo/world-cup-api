#ActiveModel::Serializer.config.adapter = :json_api
class ActiveModel::Serializer
  include Rails.application.routes.url_helpers
end
