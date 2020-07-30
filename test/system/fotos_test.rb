require "application_system_test_case"

class FotosTest < ApplicationSystemTestCase
  setup do
    @foto = fotos(:one)
  end

  test "visiting the index" do
    visit fotos_url
    assert_selector "h1", text: "Fotos"
  end

  test "creating a Foto" do
    visit fotos_url
    click_on "New Foto"

    fill_in "Image data", with: @foto.image_data
    fill_in "Title", with: @foto.title
    click_on "Create Foto"

    assert_text "Foto was successfully created"
    click_on "Back"
  end

  test "updating a Foto" do
    visit fotos_url
    click_on "Edit", match: :first

    fill_in "Image data", with: @foto.image_data
    fill_in "Title", with: @foto.title
    click_on "Update Foto"

    assert_text "Foto was successfully updated"
    click_on "Back"
  end

  test "destroying a Foto" do
    visit fotos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Foto was successfully destroyed"
  end
end
