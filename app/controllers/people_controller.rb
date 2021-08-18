# frozen_string_literal: true

class PeopleController < ApplicationController
  def index
    @providers = [] # TODO: Providers list should be here
    search_by = params[:search] || "*"
    # provider_ids = params[:providers] || @providers.ids
    # TODO: Implement filtering by provider id
    @people = Person.search(search_by,
                            fields: [:first_name, :last_name],
                            misspellings: false,
                            match: :text_middle,
                            load: false,
                            page: params[:page])
  end
end
