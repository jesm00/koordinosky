require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe EscenariosController do

  # This should return the minimal set of attributes required to create a valid
  # Escenario. As you add validations to Escenario, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "nombre" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EscenariosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all escenarios as @escenarios" do
      escenario = Escenario.create! valid_attributes
      get :index, {}, valid_session
      assigns(:escenarios).should eq([escenario])
    end
  end

  describe "GET show" do
    it "assigns the requested escenario as @escenario" do
      escenario = Escenario.create! valid_attributes
      get :show, {:id => escenario.to_param}, valid_session
      assigns(:escenario).should eq(escenario)
    end
  end

  describe "GET new" do
    it "assigns a new escenario as @escenario" do
      get :new, {}, valid_session
      assigns(:escenario).should be_a_new(Escenario)
    end
  end

  describe "GET edit" do
    it "assigns the requested escenario as @escenario" do
      escenario = Escenario.create! valid_attributes
      get :edit, {:id => escenario.to_param}, valid_session
      assigns(:escenario).should eq(escenario)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Escenario" do
        expect {
          post :create, {:escenario => valid_attributes}, valid_session
        }.to change(Escenario, :count).by(1)
      end

      it "assigns a newly created escenario as @escenario" do
        post :create, {:escenario => valid_attributes}, valid_session
        assigns(:escenario).should be_a(Escenario)
        assigns(:escenario).should be_persisted
      end

      it "redirects to the created escenario" do
        post :create, {:escenario => valid_attributes}, valid_session
        response.should redirect_to(Escenario.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved escenario as @escenario" do
        # Trigger the behavior that occurs when invalid params are submitted
        Escenario.any_instance.stub(:save).and_return(false)
        post :create, {:escenario => { "nombre" => "invalid value" }}, valid_session
        assigns(:escenario).should be_a_new(Escenario)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Escenario.any_instance.stub(:save).and_return(false)
        post :create, {:escenario => { "nombre" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested escenario" do
        escenario = Escenario.create! valid_attributes
        # Assuming there are no other escenarios in the database, this
        # specifies that the Escenario created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Escenario.any_instance.should_receive(:update).with({ "nombre" => "MyString" })
        put :update, {:id => escenario.to_param, :escenario => { "nombre" => "MyString" }}, valid_session
      end

      it "assigns the requested escenario as @escenario" do
        escenario = Escenario.create! valid_attributes
        put :update, {:id => escenario.to_param, :escenario => valid_attributes}, valid_session
        assigns(:escenario).should eq(escenario)
      end

      it "redirects to the escenario" do
        escenario = Escenario.create! valid_attributes
        put :update, {:id => escenario.to_param, :escenario => valid_attributes}, valid_session
        response.should redirect_to(escenario)
      end
    end

    describe "with invalid params" do
      it "assigns the escenario as @escenario" do
        escenario = Escenario.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Escenario.any_instance.stub(:save).and_return(false)
        put :update, {:id => escenario.to_param, :escenario => { "nombre" => "invalid value" }}, valid_session
        assigns(:escenario).should eq(escenario)
      end

      it "re-renders the 'edit' template" do
        escenario = Escenario.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Escenario.any_instance.stub(:save).and_return(false)
        put :update, {:id => escenario.to_param, :escenario => { "nombre" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested escenario" do
      escenario = Escenario.create! valid_attributes
      expect {
        delete :destroy, {:id => escenario.to_param}, valid_session
      }.to change(Escenario, :count).by(-1)
    end

    it "redirects to the escenarios list" do
      escenario = Escenario.create! valid_attributes
      delete :destroy, {:id => escenario.to_param}, valid_session
      response.should redirect_to(escenarios_url)
    end
  end

end
