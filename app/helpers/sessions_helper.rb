module SessionsHelper
  def sign_in(estudiante)
    remember_token = Estudiante.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    estudiante.update_attribute(:remember_token, Estudiante.encrypt(remember_token))
    self.current_user = estudiante
  end

  def signed_in?
    !current_user.nil?
  end  

  def current_user=(estudiante)
    @current_user = estudiante
  end

  def current_user
    remember_token = Estudiante.encrypt(cookies[:remember_token])
    @current_user ||= Estudiante.find_by(remember_token: remember_token)
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end  
end
