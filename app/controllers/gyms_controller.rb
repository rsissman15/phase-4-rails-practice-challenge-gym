class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

    def index
        gyms = Gym.all
        render json: gyms, except: [:created_at, :updated_at]
    end

    def show
        gym=find_gym
        render json: gym, except: [:created_at, :updated_at]
    end

    def create
        gym=Gym.create(gym_params)
        render json: gym, status: :created
    end

    def update
        gym=find_gym
        gym=Gym.update(gym_params)
        render json: gym, status: :accepted
    end

    def destroy
        gym=find_gym
        gym.destroy
        head :no_content,status: :deleted
    end

    private 
    def gym_params
        params.permit(:name,:address)
    end
    def find_gym
        Gym.find(params[:id])
    end
    
    def render_not_found
        render json: {error:"Gym not found"}, status: :render_not_found
    end

    def render_invalid_response invalid
        render json: {errors:invalid.response.errors}, status: :unprocessable_entity
    end
end