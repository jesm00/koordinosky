require "spec_helper"

describe EscenariosController do
  describe "routing" do

    it "routes to #index" do
      get("/escenarios").should route_to("escenarios#index")
    end

    it "routes to #new" do
      get("/escenarios/new").should route_to("escenarios#new")
    end

    it "routes to #show" do
      get("/escenarios/1").should route_to("escenarios#show", :id => "1")
    end

    it "routes to #edit" do
      get("/escenarios/1/edit").should route_to("escenarios#edit", :id => "1")
    end

    it "routes to #create" do
      post("/escenarios").should route_to("escenarios#create")
    end

    it "routes to #update" do
      put("/escenarios/1").should route_to("escenarios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/escenarios/1").should route_to("escenarios#destroy", :id => "1")
    end

  end
end
