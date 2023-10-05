defmodule FreelancerRates do
  @hours 8.0
  @working_days 22.0

  def daily_rate(hourly_rate), do: hourly_rate * @hours

  def apply_discount(before_discount, discount) do
    cal_discount = before_discount * discount / 100
    before_discount - cal_discount
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_fees = hourly_rate * @hours * @working_days
    monthly_fees |> apply_discount(discount) |> Float.ceil() |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    discounted_hourly_price = apply_discount(hourly_rate, discount)

    (budget / discounted_hourly_price / @hours)
    |> Float.floor(1)
  end
end
