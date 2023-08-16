class PagesController < ApplicationController
  def home
    @goals = Rails.cache.fetch("user_goals_#{current_user.id}", expires_in: 5.minutes) do
      Goal.order("RANDOM()").limit(3).to_a
    end

  end
end
