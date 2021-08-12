# frozen_string_literal: true

class PeopleController < ApplicationController
  def index
    @people = Person.order(:last_name).order(:first_name).page params[:page]
  end
end
