step "an article exists" do
  @article = create(:article)
end

step 'an article exists and has been ingested' do
  @article = create(:article, :ingested)
end

step 'an ingested article exists' do
  step 'an article exists and has been ingested'
end
