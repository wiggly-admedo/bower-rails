class StylesController < ApplicationController

  def show
    @white_label = WhiteLabel.find_by_domain!(style_params[:domain])
    expires_in 1.minute, public: true

    # TODO: this should be converted to an ETAG based on white label updated at, SASS template content
    if stale?(last_modified: @white_label.updated_at)
      render text: content
    end
  end

  private

  def content
    # TODO: make this a config parameter configuration.x.white_label.sass_template
    body = ERB.new(
      File.read(
      File.join(
      Rails.root, 'app', 'assets', 'stylesheets', 'white-label.css.scss.erb')))
           .result(@white_label.get_binding)

    load_path = File.join(Rails.root, 'vendor', 'assets', 'bower_components')

    ::Sass::Engine.new(body, {
                         :syntax => :scss,
                         :cache => true,
                         :read_cache => true,
                         :load_paths => [ load_path ],
#                         :style => :compressed
                       }).render
  end

  def style_params
    params.permit(:domain)
  end

end
