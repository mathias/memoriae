step 'I click the add new article link' do
  click_on 'Add +'
end

step 'I fill in the new article form' do
  @article_title = Faker::Lorem.sentence

  fill_in 'Title', with: @article_title
  fill_in 'Original url', with: Faker::Internet.url
  fill_in 'Body', with: Faker::Lorem.paragraphs(4).join('\n\n')
  fill_in 'Date published', with: 2.days.ago

  click_on 'Create Article'
end

step "the new article should be captured" do
  Article.count.should be 1
end

step "I should see it in my list of articles" do
  page.body
  within('#article_list') do
    page.should have_content @article_title
  end
end
