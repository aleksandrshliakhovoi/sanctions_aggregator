# frozen_string_literal: true

class PeopleController < ApplicationController
  def index
    if params[:search]
      @people = Kaminari.paginate_array([], total_count: 0).page params[:page]
      # TODO: Replace this dummy code by ES search
    else
      @people = Person.order(:last_name).order(:first_name).page params[:page]
    end
  end
end
