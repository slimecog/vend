require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario "they see the snacks available" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack = Snack.create!(name: "twix", price: 2)
    sm = SnackMachine.create!(snack_id: snack.id, machine_id: dons.id)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("twix $2")
  end

  scenario "they see average price of all snack for that machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = Snack.create!(name: "twix", price: 2)
    snack2 = Snack.create!(name: "snickers", price: 4)
    sm = SnackMachine.create!(snack_id: snack1.id, machine_id: dons.id)
    sm = SnackMachine.create!(snack_id: snack2.id, machine_id: dons.id)

    visit machine_path(dons)
    save_and_open_page
  end
end
