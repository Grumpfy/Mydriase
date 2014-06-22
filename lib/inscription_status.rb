
class InscriptionStatus

  def initialize(inscription, template, options = {})
    @inscription = inscription
    @template = template
    @options = options
  end

  def expanded?
    @options[:expanded]
  end

  def inscription
    @inscription
  end

  def adherent_name
    "#{@inscription.adherent.nom} #{@inscription.adherent.prenom}"
  end

  def adherent_first_name
    "#{@inscription.adherent.prenom}"
  end

  def adherent_last_name
    "#{@inscription.adherent.nom}"
  end

  def stage_title
    "#{@inscription.stage.title}"
  end

  def atelier_title 
    "#{@inscription.atelier.title}"
  end

  def remarque?(section = :global)
    if section == :atelier
      not @inscription.atelier_notes.strip.empty?
    elsif section == :food
      not @inscription.food_notes.strip.empty?
    elsif section == :housing
      not @inscription.housing_notes.strip.empty?
    elsif section == :adherent
      not @inscription.adherent.remarques.empty?
    else 
      not @inscription.remarques.strip.empty?
    end
  end

  def remarque(section = :global)
    if section == :atelier
      @inscription.atelier_notes
    elsif section == :food
      @inscription.food_notes
    elsif section == :housing
      @inscription.housing_notes
    elsif section == :adherent
      @inscription.adherent.remarques
    else 
      @inscription.remarques
    end
  end

  def room?
    not @inscription.room.strip.empty?
  end  

  def room
    @inscription.room
  end

  def vegetarian
    @inscription.vegetarian  
  end

  def minor
    @inscription.minor
  end

  def conf1
    @inscription.conf1
  end

  def conf2
    @inscription.conf2
  end

  def bill_requested
    @inscription.bill_requested
  end

  def bill_delivered
    @inscription.bill_delivered
  end

  def operations
    @inscription.operations
  end

  def billings
    @inscription.billings
  end

  def solde
    solde = 0
    @inscription.billings.each {|b| solde -= b.price} 
    @inscription.operations.each {|o| solde += o.price} 
    solde 
  end

  def adherent_mail
    "#{@inscription.adherent.mail}"
  end

  def adherent_full_address
    "#{@inscription.adherent.adresse} #{@inscription.adherent.code_postal} #{@inscription.adherent.ville}"
  end

  def adherent_address
    "#{@inscription.adherent.adresse}"
  end

  def adherent_city
    "#{@inscription.adherent.ville}"
  end

  def adherent_postal
    "#{@inscription.adherent.code_postal}"
  end

  def adherent_tel
    "#{@inscription.adherent.tel}"
  end

  def adherent_mobile
    "#{@inscription.adherent.portable}"
  end

  def to_s
    @template.render partial: 'inscriptions/status', object: self
  end
  
end
