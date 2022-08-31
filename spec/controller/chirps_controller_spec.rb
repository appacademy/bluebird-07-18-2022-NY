require 'rails_helper'

RSpec.describe ChirpsController, type: :controller do
    describe "GET #index" do
        it "renders the chirps index" do
            get :index

            expect(response).to render_template(:index)
        end
    end

    describe "GET #new" do
        it "brings up the form to make a chirp" do
            allow(subject).to receive(:logged_in?).and_return(true)

            get :new
            expect(response).to render_template(:new)
        end
    end

    describe "DELETE #destroy" do
        let!(:test_chirp) { create(:chirp) }
        before :each do
            allow(subject).to receive(:current_user).and_return(test_chirp.author)

            delete :destroy, params: { id: test_chirp.id }
        end
        it "destroy the chirp" do
            expect(Chirp.exists?(test_chirp.id)).to be false
        end
        it "redirects to chirps_url" do
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(chirps_url)
        end
    end

    describe "POST #create" do
        before :each do
            create(:user)
            allow(subject).to receive(:current_user).and_return(User.last)
        end
            
        let(:valid_params) { {chirp: { body: "Does writing chirps make me a chirper?" } } }
        let(:invalid_params) { { chirp: {nada: "" } } }

        context "with valid params" do
            it "create the chirp" do
                post :create, params: valid_params
                expect(Chirp.last.body).to eq("Does writing chirps make me a chirper?")
            end

            it "redirects to chirps show" do
                post :create, params: valid_params
                expect(response).to redirect_to(chirp_url(Chirp.last.id))
            end
        end

        context "with invalid params" do
            before :each do
                post :create, params: invalid_params
            end

            it "renders new template" do
                expect(response).to render_template(:new)
            end

            it "adds errors to flash" do
                expect(flash[:errors]).to be_present
            end
        end
    end
end