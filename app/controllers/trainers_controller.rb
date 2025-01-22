class TrainersController < ApplicationController
    before_action :set_trainer, only: [:show, :edit, :update, :destroy]
  
    def index
      @trainers = Trainer.all
    end
  
    def show
      @workouts = @trainer.workouts
    end

    def new
      @trainer = Trainer.new
    end
  
    def edit
    end

    def workouts
        @trainer = Trainer.find_by(id: params[:id])
        if @trainer.nil?
          redirect_to trainers_path, alert: "Trainer not found."
        else
          @workouts = @trainer.workouts
        end
    end

    def create
      @trainer = Trainer.new(trainer_params)
      if @trainer.save
        redirect_to @trainer, notice: 'Trainer was successfully created.'
      else
        render :new
      end
    end

    def update
      if @trainer.update(trainer_params)
        redirect_to @trainer, notice: 'Trainer was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @trainer.destroy
      redirect_to trainers_url, notice: 'Trainer was successfully destroyed.'
    end
  
    private
  
    def set_trainer
      @trainer = Trainer.find(params[:id])
    end
  
    def trainer_params
      params.require(:trainer).permit(:name, :specialty, :experience, :phone, :email)
    end
  end