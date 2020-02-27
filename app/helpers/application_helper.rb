module ApplicationHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
    no_intra_emphasis: true,
    fenced_code_blocks: true,
    disable_indented_code_blocks: true)
    return markdown.render(text).html_safe
  end

  def photo_for(recipe)
    if recipe.photo?
      cl_image_tag(recipe.photo)
    elsif recipe.link_to_photo?
      image_tag(recipe.link_to_photo)
    else
      image_tag("#{recipe.name.parameterize.underscore}.jpg")
    end
  end
end
