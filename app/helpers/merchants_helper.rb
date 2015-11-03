module MerchantsHelper

  def availability
    {Now:-> { Time.now }, Morning: -> { "#{Time.now.at_midday - 6.hours}, #{Time.now.at_midday}" }, Afternoon:-> { "#{Time.now.at_midday}, #{Time.now.at_midday + 4.hours}" },
             Evening:-> { "#{Time.now.at_midday + 4.hours}, #{Time.now.at_midday + 8.hours}" }, Night:-> { "#{Time.now.at_midday + 8.hours}, #{Time.now.end_of_day}" }, Today:-> { "#{Time.now.beginning_of_day}, #{Time.now.end_of_day}" },
             Tomorrow:-> { "#{Time.now.beginning_of_day + 1.day}, #{Time.now.end_of_day + 1.day}" }, 'This Week' => -> { "#{Time.now}, #{Time.now.end_of_week}" }}
  end

  def price_max
    params[:price_rng] || 60
  end
  def rating_max
    params[:ratings] || 5
  end
  def selected_spec
    params[:specialization] || []
  end
  def selected_avail
    params[:available] || []
  end
  def session_max
    params[:session_rng] || 60
  end
end
