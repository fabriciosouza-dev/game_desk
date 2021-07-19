class UserBackoffice::HomesController < UserBackofficesController
  def index
    PopulaTabelaService.new(nil).execute
  end
end
