module EstudiantesHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(estudiante)
    gravatar_id = Digest::MD5::hexdigest(estudiante.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: Estudiante.nombre, class: "gravatar")
  end	
end
