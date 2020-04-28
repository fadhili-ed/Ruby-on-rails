class SessionsController < ApplicationController
    def new
    
    end
    def create
        user =   User.find_by(phone_number: session_params[:phone_number])
        if user && user.authenticate(session_params[:password])
      
        else 
            flash.now[:error] = 'Invalid password combination'
            render 'new'
        end
    end
    def destroy
        logout
        redirect_to root_path
    end
    private
      def session_params
        params.require(:session).permit(:phone_number, :password)
      end
end
