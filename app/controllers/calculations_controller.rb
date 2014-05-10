class CalculationsController < ApplicationController
  def home
  end

  def sqrt
    @the_number = params[:number].to_f
    @answer = Math.sqrt(@the_number)
  end

  def pmt
    # The size of a monthly loan payment, given an annual interest rate (as a percentage), a total number of payments, and a principal amount
    # :interest_rate/:number_of_payments/:present_value
    @interest_rate = params[:interest_rate].to_f
    @number_of_payments = params[:number_of_payments].to_f
    @principal_amount = params[:present_value].to_f

    pmt = (@interest_rate / 12 / 100) * @principal_amount / (1 - (1 + (@interest_rate / 12 / 100))**-@number_of_payments)

    @payment = pmt.round(2)
  end
end
