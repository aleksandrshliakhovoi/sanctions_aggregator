# frozen_string_literal: true

class PeopleController < ApplicationController
  def index
    @providers = Provider.order(:name).all
    search_by = params[:search] || '*'
    provider_ids = params[:providers] || @providers.ids
    @people = Person.search(search_by,
                            fields: [:first_name, :last_name],
                            where: { provider_id: provider_ids },
                            misspellings: false,
                            match: :text_middle,
                            load: false,
                            page: params[:page])
  end
end
