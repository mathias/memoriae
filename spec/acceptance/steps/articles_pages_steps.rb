step 'I click the add new article link' do
  click_on 'Add +'
end

step 'I fill in the new article form' do
  @article_domain ||= Faker::Internet.domain_name

  fill_in 'URL', with: @article_domain

  click_on 'Create Article'
end

step 'the new article should be captured' do
  Article.count.should eq(1)
end

step 'I should see it in my list of articles' do
  within('#article_list') do
    page.should have_content @article_domain
  end
end

step 'I should not see the article in my list of articles' do
  @article_title ||= @article.title

  within('#article_list') do
    page.should_not have_content @article_title
  end
end

step 'I follow the article link' do
  within('#article_list') do
    click_on @article.title
  end
end

step 'I should see the article details' do
  within('article') do
    page.should have_content @article.title
    page.should have_content @article.original_domain
    page.should have_content @article.date_published.to_date.to_formatted_s(:long_ordinal)
    page.should have_content @article.date_ingested.to_date.to_formatted_s(:long_ordinal)
  end
end

step 'I should see the article body' do
  within('article') do
    page.should have_content @article.body
  end
end

step 'I click the edit article link' do
  within('#article_list') do
    click_on 'Edit'
  end
end

step 'I change the URL and submit it' do
  @new_article_domain ||= Faker::Internet.domain_name
  fill_in 'URL', with: @new_article_domain
  click_on 'Update Article'
end

step 'I should see the changed URL for that article' do
  within('#article_list') do
    page.should have_content @new_article_domain
  end
end

step 'I click the delete article link' do
  within('#article_list') do
    click_on 'Delete'
  end
end
