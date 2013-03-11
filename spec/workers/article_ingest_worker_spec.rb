require 'spec_helper'

describe ArticleIngestWorker do
  describe 'perform', :vcr do
    let(:article) { create(:article,
                      original_url: 'http://blog.mattgauger.com/blog/2013/03/07/filter-or-be-filtered/') }

    it 'performs an HTTP request to wolfcastle and sets attributes on article' do
      worker = ArticleIngestWorker.new
      expect { worker.perform(article.id) }.to change{ article.reload.title }
    end
  end
end
