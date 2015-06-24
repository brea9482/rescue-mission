require 'rails_helper'

feature 'User views list of recently posted questions', %Q{
  As a user
  I want to view recently posted questions
  So that I can help others
} do
# Acceptance Criteria
#
# - I must see the title of each question
# - I must see questions listed in order, most recently posted first

  # let(:name) { FactoryGirl.create(:name) }

  scenario 'questions in question list are found' do
    question = FactoryGirl.create(:question)

    visit '/questions'
    expect(page).to have_content(question.name)

  end
end

feature 'User is able to click on each question which takes them to to question page', %Q{

As a user
I want to view a question's details
So that I can effectively understand the question
} do

# Acceptance Criteria
#
# - I must be able to get to this page from the questions index
# - I must see the question's title
# - I must see the question's description

  scenario 'User is able to click on question from index page and takes user to new page with question info' do
    question = FactoryGirl.create(:question)

    visit '/questions/'
    click_link 'View Question'
    expect(page).to have_content(question.name)
    expect(page).to have_content(question.description)
  end
end
