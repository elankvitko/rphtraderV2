class UsersController < ApplicationController
  def show
    @user = current_user.pharmacy_name.nil?
  end

  def availability
  end

  def update
    @user = User.find( params[ :id ] )

    if @user.update_attributes( user_params )
      sign_in(@user, :bypass => true)
      redirect_to user_path( current_user )
    end
  end

  def update_diems
    if request.xhr?
      day = params[ :day ].downcase
      current_state = current_user.fulls.first[ day ]

      if current_state == "inactive"
        current_user.fulls.first.update_attributes( "#{ day }" => "active" )
      else
        current_user.fulls.first.update_attributes( "#{ day }" => "inactive" )
      end
    end
  end

    private

      def user_params
        params.require( :user ).permit( :first_name, :last_name, :role, :email, :password, :password_confirmation, :zip, :range, :type_ep )
      end
end
