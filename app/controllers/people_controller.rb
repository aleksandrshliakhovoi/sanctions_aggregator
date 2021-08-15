# frozen_string_literal: true

class PeopleController < ApplicationController
  def index
    if params[:search]&.present?
      @people = Person.search params[:search], operator: "or", load: false, page: params[:page]
      # TODO: Replace this dummy code by ES search
    else
      @people = Person.order(:last_name).order(:first_name).page params[:page]
    end
  end
end
