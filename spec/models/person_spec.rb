require 'rails_helper'

RSpec.describe Person, type: :model do

  describe 'valid person' do
    it 'it true' do
      person = Person.new(first_name: 'John', last_name: "day", email: 'john@example.com', phone: "+9876767656")
      expect(person.valid?).to eq(true)
    end
  end
end
