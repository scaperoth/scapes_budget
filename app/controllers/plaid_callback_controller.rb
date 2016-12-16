class PlaidCallbackController < Argyle::CallbackController
    def index
        current_user.access_token = plaid_access_token
        redirect_back_or_default(root_path)
    end
end
