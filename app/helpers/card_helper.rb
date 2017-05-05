module CardHelper
  def card_path(card)
    organisation_card_path card.organisation, card.to_param
  end

  def new_card_path
    new_organisation_card_path @organisation
  end

  def cards_path(*options)
    [@organisation, :cards]
  end
end
