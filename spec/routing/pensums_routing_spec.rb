require "spec_helper"

describe PensumsController do
  describe "routing" do

    it "routes to #index" do
      get("/pensums").should route_to("pensums#index")
    end

    it "routes to #new" do
      get("/pensums/new").should route_to("pensums#new")
    end

    it "routes to #show" do
      get("/pensums/1").should route_to("pensums#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pensums/1/edit").should route_to("pensums#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pensums").should route_to("pensums#create")
    end

    it "routes to #update" do
      put("/pensums/1").should route_to("pensums#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pensums/1").should route_to("pensums#destroy", :id => "1")
    end

  end
end
