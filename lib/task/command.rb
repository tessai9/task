# Command クラス

module Task
	# コマンドライン処理クラス
	class Command
		# DB作成
		def execute
			DB.prepare
		end
		
		# Todo作成
		def create_todo(name, content)
			Task.create!(name: name, content: content).reload
		end
	end
end