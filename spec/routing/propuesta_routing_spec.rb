require "spec_helper"

describe PropuestaController do
  describe "routing" do

    it "routes to #index" do
      get("/propuesta").should route_to("propuesta#index")
    end

    it "routes to #new" do
      get("/propuesta/new").should route_to("propuesta#new")
    end

    it "routes to #show" do
      get("/propuesta/1").should route_to("propuesta#show", :id => "1")
    end

    it "routes to #edit" do
      get("/propuesta/1/edit").should route_to("propuesta#edit", :id => "1")
    end

    it "routes to #create" do
      post("/propuesta").should route_to("propuesta#create")
    end

    it "routes to #update" do
      put("/propuesta/1").should route_to("propuesta#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/propuesta/1").should route_to("propuesta#destroy", :id => "1")
    end

  end
end
