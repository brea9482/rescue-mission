require 'rails_helper'

feature 'User is able to post an answer to a question', %Q{ As a user
  I want to answer another user's question
  So that I can help them solve their problem} do

# Acceptance Criteria
#
# - I must be on the question detail page
# - I must provide a description that is at least 50 characters long
# - I must be presented with errors if I fill out the form incorrectlyt the form incorrectly

  scenario 'adds a valid answer' do
    answer_description = 'This answer is more than fifty characters long I think but probably not'
    question = FactoryGirl.create(:question)
    visit 'questions/' + question.id.to_s
    click_link 'Click here to answer this question.'

    fill_in 'Description', with: answer_description

    click_button 'Add your answer!'

    expect(page).to have_content('Your answer has been added!')
    # expect(page).to have_content(answer_description)
  end

  scenario 'adds an invalid answer' do
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
