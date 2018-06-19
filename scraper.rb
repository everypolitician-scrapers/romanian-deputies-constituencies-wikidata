#!/bin/env ruby
# frozen_string_literal: true

require 'pry'
require 'scraperwiki'
require 'wikidata/area'
require 'wikidata/fetcher'

query = 'SELECT DISTINCT ?item WHERE { ?member p:P39 [ ps:P39 wd:Q17556530 ; pq:P768 ?item ] }'
wanted = EveryPolitician::Wikidata.sparql(query)
raise 'No ids' if wanted.empty?

data = Wikidata::Areas.new(ids: wanted).data
ScraperWiki.save_sqlite(%i[id], data)
