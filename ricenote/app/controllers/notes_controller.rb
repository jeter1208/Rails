class NotesController < ApplicationController
    def index
    end
    def new
        @note = Note.new
    end
    def create
    #   reder html: params[:note]
    #   note = Note.new(params[:note]) 
    #   title = params[:title]
    #   content = params[:content]
    #   note = Note.new(title: title,content: content) 
    #   render html:params[:title]
        # strong Prameter 強參數 新增白名單
       clean_note =params.require(:note).permit(:title,:content)
       @note = Note.new(clean_note)
      if @note.save
        redirect_to "/notes"
      else
        # reder html: "123"
        render :new
        # redirect_to "/notes/new"
         ##待處理 
      end
    end        
end
