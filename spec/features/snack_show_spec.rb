require 'rails_helper'

feature 'Snack show' do
  describe 'user visits page' do
    it 'displays all snack price locations avg price in machine and count of all items inthe machine' do
      owner = Owner.create!(name: "Sam's Snacks")
      machine1 = owner.machines.create!(location: "Bus Stop")
      machine2 = owner.machines.create!(location: "Lo Do")
      snack1 = Snack.create!(brand: 'Candy', price: 1.50)
      snack2 = Snack.create!(brand: 'Chips', price: 2.25)

      machine1 << [snack1, snack2]
      machine2 << [snack1, snack2]

      visit snack_path(snack1)

      expect(page).to have_content(snack1.brand)
      expect(page).to have_content("$#{snack1.price}")
      expect(page).to have_content(snack1.machines)
      expect(page).to have_content(machine.snacks.count)
      end
    end
  end
