module V1
    class ApplicationController < ActionController::API
        before_action :filter_json_request

        def filter_json_request
            unless request.get? || request.delete?
                return if request.headers["Content-Type"] =~ /json/
                render body: nil, :status => 415
            end
        end

    end
end
