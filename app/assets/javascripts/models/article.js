Memoriae.Article = DS.Model.extend({
  title: DS.attr('string'),
  body: DS.attr('string'),
  originalUrl: DS.attr('string'),
  datePublished: DS.attr('date'),
  dateIngested: DS.attr('date')
});