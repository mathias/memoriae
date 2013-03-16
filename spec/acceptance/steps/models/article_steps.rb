placeholder :count do
  match /\d+/ do |count|
    count.to_i
  end

  match /no/ do
    0
  end
end

step "an article exists" do
  @article = create(:article)
end

step 'an article exists and has been ingested' do
  @article = create(:article, :ingested)
end

step 'an ingested article exists' do
  step 'an article exists and has been ingested'
end

step ":count ingested articles exist" do |count|
  @articles = create_list(:article, count, :ingested)
end

step 'a read article exists' do
  @article = create(:read_article)
end
