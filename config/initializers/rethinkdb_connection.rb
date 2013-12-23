# Connection details for +NoBrainer+ to connect to a running RethinkDB instance.
# By default it connects to +localhost:28015+,
# but a different connection can be specified using +RDB_URL+ environment
# variable in the form: +rethinkdb://<host>:<port>/<db>+

require 'rethinkdb'
include RethinkDB::Shortcuts

$rethinkdb = r.connect({ host: ENV['RDB_HOST'] || 'localhost',
            port: ENV['RDB_PORT'] || '28015',
            db: ENV['RDB_DB_NAME'] })

unless r.db_list.run($rethinkdb).include?(ENV['RDB_DB_NAME'])
  puts "RethinkDB database not found. Creating..."
  r.db_create(ENV['RDB_DB_NAME']).run($rethinkdb)
end
