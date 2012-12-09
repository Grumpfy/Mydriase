require "spec_helper"

describe BillingsController do
  describe "routing" do

    it "routes to #index" do
      get("/billings").should route_to("billings#index")
    end

    it "routes to #new" do
      get("/billings/new").should route_to("billings#new")
    end

    it "routes to #show" do
      get("/billings/1").should route_to("billings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/billings/1/edit").should route_to("billings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/billings").should route_to("billings#create")
    end

    it "routes to #update" do
      put("/billings/1").should route_to("billings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/billings/1").should route_to("billings#destroy", :id => "1")
    end

  end
end
