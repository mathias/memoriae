step "an article exists" do
  @article = create(:article)
end

step 'an article exists and has been ingested' do
  @article = create(:article, :ingested)
end
