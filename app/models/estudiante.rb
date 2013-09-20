class Estudiante < ActiveRecord::Base
	belongs_to :programa

    validates_presence_of :programa
    validates_associated :programa
	
	has_many :plans
	has_many :cursos, :through => :plans
	
	has_many :cursadas
	has_many :cursos, :through => :cursadas
##############################################VALIDACION y AUTENTICACION
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :nombre, presence: true#, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :semestre_actual, presence: true                  
  has_secure_password
  validates :password, length: { minimum: 6 }
#=begin
  def Estudiante.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Estudiante.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = Estudiante.encrypt(Estudiante.new_remember_token)
    end
#=end
end
#Estudiante.create(nombre: "Michael Hartl", email: "mhartl@example.com", semestre_actual: 1, programa_id: 1, password: "foobar", password_confirmation: "foobar")