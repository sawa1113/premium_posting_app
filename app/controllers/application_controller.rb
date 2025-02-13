class ApplicationController < ActionController::Base

    private

    # ログイン後のリダイレクト先
    def after_sign_in_path_for(resource_or_scope)
        root_path
    end

    # ログアウト後のリダイレクト先
    def after_sign_out_path_for(resource_or_scope)
        user_session_path
    end
end
