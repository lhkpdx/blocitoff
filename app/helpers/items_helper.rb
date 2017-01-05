module ItemsHelper

  def time_remaining(item)
    remaining = distance_of_time_in_words(Time.now, item.created_at + 7.days)
  end

  def warning(item)
    updated = Time.now
    created = item.created_at
    days_since =(updated.minus_with_coercion(created)/86400).round
    if days_since >= 6
      true
    end
  end

end
