require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  describe 'POST/GET #form' do

    context 'when params are correct' do
      let(:params) { { person: { first_name: "John", last_name: "Day", email: "john@gmail.com", phone: "+8989878987" } } }

      it 'is expected to create new person successfully' do
        expect(:user).to be_instance_of(Person)
      end

      it 'is expected to redirect to root path' do
        expect(:user).to redirect_to(root_path)
      end
    end
  end
end
