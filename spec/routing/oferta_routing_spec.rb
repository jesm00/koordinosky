require "spec_helper"

describe OfertaController do
  describe "routing" do

    it "routes to #index" do
      get("/oferta").should route_to("oferta#index")
    end

    it "routes to #new" do
      get("/oferta/new").should route_to("oferta#new")
    end

    it "routes to #show" do
      get("/oferta/1").should route_to("oferta#show", :id => "1")
    end

    it "routes to #edit" do
      get("/oferta/1/edit").should route_to("oferta#edit", :id => "1")
    end

    it "routes to #create" do
      post("/oferta").should route_to("oferta#create")
    end

    it "routes to #update" do
      put("/oferta/1").should route_to("oferta#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/oferta/1").should route_to("oferta#destroy", :id => "1")
    end

  end
end
