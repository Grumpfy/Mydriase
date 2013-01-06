module InscriptionsHelper
  def inscription_status_for(inscription = @inscription, options = {})
    presenter = InscriptionStatus.new(inscription, self, options)
    if block_given?
      yield presenter
    else
      presenter
    end
  end
end
