class ChargesController < ApplicationController

  def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Membership - #{current_user.email}",
     amount: 15_00
  }
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
   if charge.paid
     current_user.premium!
     current_user.save!
     flash[:notice] = "Congrats, #{current_user.email}! You are now a Premium User!"
     redirect_to root_path
   end
   # Stripe will send back CardErrors, with friendly messages
   # when something goes wrong.
   # This `rescue block` catches and displays those errors.
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
  end

  def downgrade
   current_user.wikis.where(private: true).update_all(private: false)
   current_user.standard!
   flash[:notice] = "Your account has been downgraded from Premium to Standard"
   flash[:notice] = "Your private wikis have now become public"
   redirect_to root_path
  end

end
