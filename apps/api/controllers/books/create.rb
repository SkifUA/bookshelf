module Api::Controllers::Books
  class Create
    include Api::Action

    params do
      required(:book).schema do
        required(:title).filled(:str?)
        required(:author).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        BookRepository.new.create(params[:book])

        redirect_to '/books'
      else
        self.status = 422
      end
    end
  end
end
