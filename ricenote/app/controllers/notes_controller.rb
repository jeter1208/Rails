class NotesController < ApplicationController
    before_action :find_user_note, only:[:edit, :update, :destroy]
    # :show
    before_action :check_login!, except: [:index, :show]
    def index
    # @notes = Note.all.sort.reverse X
    #   @notes = Note.all
      @notes = Note.order(id: :desc)
    #   這樣也行 available
      # @notes = Note.all.order(id: :desc)
    end
    def new
      @note = current_user.notes.new
        # @note = Note.new(title: "123", content:"4565555")
    end
    def show
      @note = Note.find(params[:id])  
    end
    def edit
      # 編輯
      # @note = Note.find(params[:id])
    end  
    def update 
      # 更新
      # clean_note = params.require(:note).permit(:title, :content)
		  # @note = Note.find(params[:id])
      if @note.update(note_params)
        redirect_to "/notes"
      else
        ## 待處理
        render :edit
      end
    end
    def create
    #   render html: params[:note]
    #   note = Note.new(params[:note]) 
    #   title = params[:title]
    #   content = params[:content]
    #   note = Note.new(title: title,content: content) 
    #   render html:params[:title]
        # strong Prameter 強參數 新增白名單
      #  clean_note = params.require(:note).permit(:title,:content)

      #  @note = Note.new(note_params)
      #  @note.user_id = current_user.id

      @note = current_user.notes.new(note_params)

      if @note.save
        redirect_to "/notes"
      else
        # reder html: "123"
        render :new
        # redirect_to "/notes/new"
         ##待處理 
      end
    end  
    def destroy
        #  刪除
      # @note = Note.find(params[:id])
      # 找到他
      @note.update(daleted_at: Time.now)
      # 刪除他
      redirect_to "/notes"
      # 離開他
    end    
    private
    # strong Prameter 強參數 新增白名單
    def note_params
      params.require(:note).permit(:title,:content)
    end 
    def find_user_note
      # begin
        # @note = Note.find(params[:id])
      # rescue ActiveRecord::RecordNotFound
      #   render file:"public/404.html",status:404 
      #                                       # not_found或404都可以
      # end
      @note = current_user.notes.find(params[:id])
    end
end
