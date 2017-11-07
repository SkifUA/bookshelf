module Api::Controllers::Books
  class Create
    include Api::Action

    def call(params)
      BookRepository.new.create(params[:book])

      redirect_to '/books'
    end
  end
end
