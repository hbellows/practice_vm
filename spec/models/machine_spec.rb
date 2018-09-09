require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end
  describe 'Instance Method' do
    it '#average_snack_price' do
      owner = Owner.create(name: "Sam's Snacks")
      machine = owner.machines.create(location: "Bus Stop")
      snack1 = machine.snacks.create(brand: 'Candy', price: 1.50)
      snack2 = machine.snacks.create(brand: 'Chips', price: 2.25)

      expect(machine.average_snack_price).to eq(1.88)
    end
  end
end
