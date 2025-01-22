class MembershipsController < ApplicationController
    before_action :set_membership, only: [:show, :edit, :update, :destroy]

    def index
      @memberships = Membership.all
    end
  
    def show
    end
  
    def new
      @membership = Membership.new
    end
  
    def edit
    end
  
    def create
      @membership = Membership.new(membership_params)
      if @membership.save
        redirect_to @membership, notice: 'Membership was successfully created.'
      else
        render :new
      end
    end
  
    def update
      if @membership.update(membership_params)
        redirect_to @membership, notice: 'Membership was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @membership.destroy
      redirect_to memberships_url, notice: 'Membership was successfully destroyed.'
    end
  
    private
  
    def set_membership
      @membership = Membership.find(params[:id])
    end
  
    def membership_params
      params.require(:membership).permit(:name, :phone, :start_date, :end_date, :status)
    end
  end