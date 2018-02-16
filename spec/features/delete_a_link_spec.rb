feature 'deleting a link' do
  scenario 'deletes the link' do
    visit '/'
    click_button '2'
    expect(page).not_to have_content 'google'
  end
end
