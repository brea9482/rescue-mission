require 'rails_helper'

feature 'User is able to edit an answer to a question', %Q{ As a user
  I want to edit a question
  So that I can correct any mistakes or add updates} do

# Acceptance Criteria
#
# - I must provide valid information
# - I must be presented with errors if I fill out the form incorrectly
# - I must be able to get to the edit page from the question details page

  pending 'Any user can edit a question' do
    question = FactoryGirl.create(:question)
    visit 'questions/' + question.id.to_s
    click_link 'Click here to answer this question.'

    fill_in 'Description', with: answer_description

    click_button 'Add your answer!'

    expect(page).to have_content('Your answer has been added!')
    # expect(page).to have_content(answer_description)
  end

  pending 'adds an invalid answer' do
    answer_description = 'This answer is not long enough'
    question = FactoryGirl.create(:question)
    visit 'questions/' + question.id.to_s
    click_link 'Click here to answer this question.'

    fill_in 'Description', with: answer_description

    click_button 'Add your answer!'

    expect(page).to have_content('You must provide a description of at least 50 characters for your answer.')
    # expect(page).to have_content(answer_description)
  end
end
