class Note < ApplicationRecord
    validates :title, presence:true
    # validates :content, presence:true
    
    default_scope { where(deleted_at: nil) }
    # 所有的查詢裡面 好用會有副作用

end
