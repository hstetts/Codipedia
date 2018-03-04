class ChargesController < ApplicationController

  def new
    if current_user.premium?
      flash[:notice] = "Your account has been downgraded from Premium to Standard"
      current_user.role = :standard
      current_user.save!
      redirect_to root_path

    else
      @stripe_btn_data = {
        key: "#{ Rails.configuration.stripe[:publishable_key] }",
        description: "Premium Membership - #{current_user.email}",
        amount: 15_00
      }
    end
  end


  def create
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )

   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: 15_00,
     description: "Upgrade to Premium Membership - #{current_user.email}",
     currency: 'usd'
   )

   current_user.role = :premium
   current_user.save!
   flash[:notice] = "Congrats, #{current_user.email}! You are now a Premium User!"
   redirect_to root_path

   # Stripe will send back CardErrors, with friendly messages
   # when something goes wrong.
   # This `rescue block` catches and displays those errors.
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
  end
end
