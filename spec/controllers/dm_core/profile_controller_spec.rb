require 'spec_helper'

describe DmCore::ProfileController do
  describe '#account' do
    context 'when request is GET' do
      it 'should render the view template' do
        get :account

        response.should be_success
        response.should render_template :account
      end
    end

    context 'when request is PUT or POST' do
      it 'should '
    end
  end
end
