require 'spec_helper'

describe TripsController do

  describe 'GET #index' do

    it 'renders the index for trips ' do
      get :index
      expect(response).to render_template :index
    end

    context 'with params[:category]' do
      it 'get an arrays of trips based on category' do
          #TODO create some trips with categories. make the get, use params and check
      end

      it 'render the index trips page' do
        get :index, category: 'hike'
        expect(response).to render_template :index
      end

    end

    context 'without params[:category]' do
      it 'get an array of trips' do
        trip1 = create(:trip)
        trip2 = create(:trip)
        get :index
        expect(assigns(:trips)).to match_array([trip1, trip2])
      end

      it 'render index template' do
        get :index
        expect(response).to render_template :index
      end
    end

  end


  describe 'GET #show' do

    it 'render the show template for a diven trips' do
      trip = create(:trip)
      get :show, id:trip
      expect(response).to render_template :show
    end
  end

end