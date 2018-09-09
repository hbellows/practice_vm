require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  it 'displays all snacks and prices in the machine' do
    owner = Owner.create(name: "Sam's Snacks")
    machine = owner.machines.create(location: "Bus Stop")
    snack1 = machine.snacks.create(brand: 'Candy', price: 1.50)
    snack2 = machine.snacks.create(brand: 'Chips', price: 2.25)

    visit machine_path(machine)

    expect(page).to have_content(snack1.brand)
    expect(page).to have_content("$#{snack1.price}")
    expect(page).to have_content(snack2.brand)
    expect(page).to have_content("$#{snack2.price}")
  end
  it 'displays average price for all snacks in machine' do
    owner = Owner.create(name: "Sam's Snacks")
    machine = owner.machines.create(location: "Bus Stop")
    snack1 = machine.snacks.create(brand: 'Candy', price: 1.50)
    snack2 = machine.snacks.create(brand: 'Chips', price: 2.25)

    visit machine_path(machine)

    expect(page).to have_content("Average Price of Snacks: #{machine.average_snack_price}")
  end
end
