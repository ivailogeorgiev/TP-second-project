module Api
	module V1
		class GamesController < ApplicationController
			def index
				games = Game.order('created_at DESC');

				render json: {status: 'SUCCESS', message: 'Loaded games', data:games},status: :ok
			end

			def show
				game = Game.find(params[:id])

				render json: {status: 'SUCCESS', message: 'Loaded game', data:game},status: :ok
			end

			def create
				game = Game.new(game_params)
			
				if game.save
					render json: {status: 'SUCCESS', message: 'Loaded game', data:game},status: :ok
				else
					render json: {status: 'ERROR', message: 'Game not saved', data:game.errors},status: :unprocessable_entity
				end

			end

			def destroy
				game = Game.find(params[:id])

				game.destroy
				render json: {status: 'SUCCESS', message: 'Deleted game', data:game},status: :ok
			end

			def update
				game = Game.find(params[:id])

				if game.update_attributes(game_params)
					render json: {status: 'SUCCESS', message: 'Updates game', data:game},status: :ok
				else
					render json: {status: 'ERROR', message: 'Game not updated', data:game.errors},status: :unprocessable_entity
				end
			end

			private

			def game_params
				params.permit(:title, :body)
			end
		end
	end
end