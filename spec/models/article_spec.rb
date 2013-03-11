require 'spec_helper'

describe Article do
  describe 'factories' do
    context 'default factory' do
      it 'make valid records' do
        create(:article).should be_valid
        build(:article).should be_valid
      end
    end
    context 'ingested trait' do
      it 'make valid records' do
        create(:article, :ingested).should be_valid
        build(:article, :ingested).should be_valid
      end
    end
  end

  describe 'states' do
    context 'when created' do
      let(:article) { build(:article) }

      it 'defaults to new' do
        article.should be_new
      end
    end

    context 'when ingested' do
      let(:article) { create(:article) }

      it 'transitions to ingested' do
        article.ingest!
        article.should be_ingested
      end
    end
  end

  describe 'ingest jobs' do
    context 'when created' do
      it 'pushes an ingest job onto the queue' do
        expect {
          create(:article)
        }.to change(ArticleIngestWorker.jobs, :size).by(1)
      end
    end
  end
end
