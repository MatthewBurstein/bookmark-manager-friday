feature 'Viewing links' do
  scenario 'A user can see links' do
    visit ('/')
    expect(page).to have_content "facebook"
  end
end
