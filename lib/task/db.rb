require "active_record"
require "fileutils"

module Task
	module DB
		# データベース作成
		def self.prepare
			database_path = File.join(ENV['HOME'], '.task', 'todos.sqlite3')
			connect_database database_path
			create_table_if_not_exists database_path
		end
		
		# データベース接続
		def self.connect_database(path)
			spec = {adapter: 'sqlite3', database: path}
			ActiveRecord::Base.establish_connection spec
		end
		
		# テーブル作成
		def self.create_table_if_not_exists(path)
			create_database_path path
			connection = ActiveRecord::Base.connection
			
			# データベースが既に存在していればreturn
			return if connection.data_source_exists?(:todos)
			
			# DDLの定義
			connection.create_table :todos do |t|
				t.column :name,		:string,	null: false
				t.column :content,	:text,		null: false
				t.column :status,	:integer,	default: 0,		null: false
				t.timestamps
			end
			
			# indexの定義
			connection.add_index :todos, :status
			connection.add_index :todos, :created_at
		end
		
		# データベースが存在するディレクトリを作成
		def self.create_database_path(path)
			FileUtils.mkdir_p File.dirname(path)
		end
		
		private_class_method :connect_database, :create_table_if_not_exists, :create_database_path
	end
end