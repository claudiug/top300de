require 'spec_helper'

describe DefaultController do

  describe 'GET home' do

    it 'renders the home view' do
      get :home
      expect(page).to render_template :home
    end

  end

end