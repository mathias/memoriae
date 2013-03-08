placeholder :page do
  match /the home page/ do
    '/'
  end
  match /the articles page/ do
    '/articles'
  end
end

step "I visit :page" do |page|
  visit(page)
end

step "I am on :page" do |page|
  visit(page)
end
