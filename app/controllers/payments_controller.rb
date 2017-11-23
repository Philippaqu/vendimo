class PaymentsController < ApplicationController
  def balance
    @user = current_user
  end

def create
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       params[:value].to_i,
    description:  "Recharge balance",
    currency:     current_user.balance.currency
  )

  current_user.balance_cents += params[:value].to_i
  current_user.save
  redirect_to balance_path

 #Update user balance

rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_order_payment_path(@order)
end

end
