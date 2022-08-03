class ClientsController < ApplicationController
    def show
        client=Client.find(params[:id])
        if client
            render json: client

        else
            render json:{error:"Client not found"},status: :render_not_found
        end
    end

end