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

describe OperationsController do

  # This should return the minimal set of attributes required to create a valid
  # Operation. As you add validations to Operation, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OperationsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all operations as @operations" do
      operation = Operation.create! valid_attributes
      get :index, {}, valid_session
      assigns(:operations).should eq([operation])
    end
  end

  describe "GET show" do
    it "assigns the requested operation as @operation" do
      operation = Operation.create! valid_attributes
      get :show, {:id => operation.to_param}, valid_session
      assigns(:operation).should eq(operation)
    end
  end

  describe "GET new" do
    it "assigns a new operation as @operation" do
      get :new, {}, valid_session
      assigns(:operation).should be_a_new(Operation)
    end
  end

  describe "GET edit" do
    it "assigns the requested operation as @operation" do
      operation = Operation.create! valid_attributes
      get :edit, {:id => operation.to_param}, valid_session
      assigns(:operation).should eq(operation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Operation" do
        expect {
          post :create, {:operation => valid_attributes}, valid_session
        }.to change(Operation, :count).by(1)
      end

      it "assigns a newly created operation as @operation" do
        post :create, {:operation => valid_attributes}, valid_session
        assigns(:operation).should be_a(Operation)
        assigns(:operation).should be_persisted
      end

      it "redirects to the created operation" do
        post :create, {:operation => valid_attributes}, valid_session
        response.should redirect_to(Operation.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved operation as @operation" do
        # Trigger the behavior that occurs when invalid params are submitted
        Operation.any_instance.stub(:save).and_return(false)
        post :create, {:operation => {}}, valid_session
        assigns(:operation).should be_a_new(Operation)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Operation.any_instance.stub(:save).and_return(false)
        post :create, {:operation => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested operation" do
        operation = Operation.create! valid_attributes
        # Assuming there are no other operations in the database, this
        # specifies that the Operation created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Operation.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => operation.to_param, :operation => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested operation as @operation" do
        operation = Operation.create! valid_attributes
        put :update, {:id => operation.to_param, :operation => valid_attributes}, valid_session
        assigns(:operation).should eq(operation)
      end

      it "redirects to the operation" do
        operation = Operation.create! valid_attributes
        put :update, {:id => operation.to_param, :operation => valid_attributes}, valid_session
        response.should redirect_to(operation)
      end
    end

    describe "with invalid params" do
      it "assigns the operation as @operation" do
        operation = Operation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Operation.any_instance.stub(:save).and_return(false)
        put :update, {:id => operation.to_param, :operation => {}}, valid_session
        assigns(:operation).should eq(operation)
      end

      it "re-renders the 'edit' template" do
        operation = Operation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Operation.any_instance.stub(:save).and_return(false)
        put :update, {:id => operation.to_param, :operation => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested operation" do
      operation = Operation.create! valid_attributes
      expect {
        delete :destroy, {:id => operation.to_param}, valid_session
      }.to change(Operation, :count).by(-1)
    end

    it "redirects to the operations list" do
      operation = Operation.create! valid_attributes
      delete :destroy, {:id => operation.to_param}, valid_session
      response.should redirect_to(operations_url)
    end
  end

end
