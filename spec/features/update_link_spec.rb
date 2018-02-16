feature "links can be updated" do
  scenario "user visits page, enters details databse is upated" do
    visit '/'
    click_link('2')
    expect(find_field('url').value).to eq 'http://www.google.com'
    expect(page).to have_content "You're in the update page"
    fill_in "url", with: 'https://www.reddit.com'
    fill_in "title", with: 'Reddit'
    click_button 'Update link'
    expect(page).to have_content 'Reddit'
    expect(page).not_to have_content 'google'

  end

end
