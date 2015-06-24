require 'rails_helper'

feature 'User is able to post a question', %Q{ As a user
I want to post a question
So that I can receive help from others
} do

  # Acceptance Criteria
  #
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  scenario 'add a valid question' do
    question_name = 'Naaaaame'
    visit 'questions/new'

    fill_in 'Name', with: question_name
    fill_in 'Description', with: 'descriptionnnnnn'

    click_button 'Add your question!'

    expect(page).to have_content('Your question has been added!')
    expect(page).to have_content(question_name)
  end

  scenario 'attempt to add an invalid drink' do
    visit 'questions/new'

    click_button 'Add your question!'

    expect(page).to have_content('You must provide a name and description for your question.')

  end
end
