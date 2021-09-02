# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def index
    @followed_people = current_user.followed_people.page(params[:page])
  end

  def create
    p create_params
    followed_person = FollowedPerson.where(create_params).first_or_create

    current_user.followed_people << followed_person unless current_user.followed_people.include?(followed_person)

    flash[:notice] = "You started following #{followed_person.first_name} #{followed_person.last_name}"
    redirect_to request.referer
  end

  def destroy
    followed_person = FollowedPerson.find(params[:id])

    current_user.followed_people.delete(followed_person) if current_user.followed_people.include?(followed_person)

    flash[:notice] = "You stopped following #{followed_person.first_name} #{followed_person.last_name}"
    redirect_to request.referer
  end

  private
    def create_params
      params.require(:person).permit([:first_name, :last_name, :birthday, :citizenship, :end_sanctions_time])
    end
end
