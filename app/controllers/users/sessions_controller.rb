# frozen_string_literal: true

module Users
  # sessions
  class SessionsController < Devise::SessionsController
    # POST /resource/sign_in
    # rubocop:disable Metrics/AbcSize
    def create
      user = User.find_for_authentication(email: params[:user][:email])
      if user.present? && user&.valid_password?(params[:user][:password])
        resource = warden.authenticate!(scope: resource_name, recall: 'new')
        session['resource_email'] = resource.email
        session['resource_name'] = resource.name
        flash[:notice] = "#{t('session.create.welcome')}, #{session['resource_name']}!"
        sign_in_and_redirect(resource_name, resource)
      else
        render 'layouts/incorrect'
      end
    end
    # rubocop:enable Metrics/AbcSize

    # DELETE /resource/sign_out
    def destroy
      name = current_user.name.clone
      super
      flash[:notice] = "#{t('session.destroy.come_back')}, #{name}!"
    end
  end
end
