require "active_record"

module Task
	class Todo < ActiveRecord::Base
		# 定数定義
		NOT_YET = 0		# 未完了
		DONE    = 1		# 完了
		PENDING = 2		# 保留
		
		# ステータス名 => ステータス値
		STATUS = {
			'NOT_YET' => NOT_YET,
			'DONE'    => DONE,
			'PENDING' => PENDING
		}.freeze
	end
end