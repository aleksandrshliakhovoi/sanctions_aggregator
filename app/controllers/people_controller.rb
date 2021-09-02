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
                            page: params[:page],
                            per_page: 10)

    query = @people
              .map { 'followed_people.first_name=? AND followed_people.last_name=? AND followed_people.birthday=?' }
              .join(' OR ')

    query_params = @people.reduce([]) { |q_p, p| q_p + [p.first_name, p.last_name, p.birthday] }

    @followed_ids = Subscription
                      .joins(:user)
                      .joins(:followed_person)
                      .where(user: current_user.id)
                      .where(query, *query_params)
                      .each_with_object({}) do |subscription, ids|
      f_p = subscription.followed_person

      p_id = @people.filter_map do |p|
        p.id if p.first_name == f_p.first_name && p.last_name == f_p.last_name && p.birthday == f_p.birthday.to_s
      end.first

      ids[p_id] = f_p.id.to_s if p_id.present?
    end
  end
end
