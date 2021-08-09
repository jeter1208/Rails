class NotesController < ApplicationController
    def index
    end
    def new
        @note = Note.new
    end
    def create
      title = params[:title]
      content = params[:content]
      note = Note.new(title: title,content: content) 
    #   render html:params[:title]
      if note.save
        redirect_to "/notes"
      else
         ##待處理 
      end
    end        
end
