module CardHelper
  def card_path(card)
    organisation_card_path card.organisation, card.to_param
  end

  def new_card_path
    new_organisation_card_path @organisation
  end

  def cards_path(*_options)
    [@organisation, :cards]
  end

  def html_pipeline
    context = {
      asset_root: '/images',
      gfm: true
    }
    HTML::Pipeline.new([HTML::Pipeline::MarkdownFilter,
                        HTML::Pipeline::SanitizationFilter,
                        HTML::Pipeline::AutolinkFilter,
                        HTML::Pipeline::ImageMaxWidthFilter,
                        HTML::Pipeline::MentionFilter,
                        HTML::Pipeline::EmojiFilter,
                        HTML::Pipeline::SyntaxHighlightFilter], context)
  end
end
