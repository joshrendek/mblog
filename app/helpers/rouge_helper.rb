module RougeHelper
  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'

  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
    def rouge_formatter(lexer)
        Rouge::Formatters::HTMLLegacy.new(:css_class => "highlight #{lexer.tag}", line_numbers: true)
    end
  end

  def rouge_markdown(text)
    render_options = {
        filter_html: false,
        hard_wrap: true,
        link_attributes: { rel: 'nofollow' },
        line_numbers: true,
        scope: 'foobar'
    }
    renderer = HTML.new(render_options)

    extensions = {
        autolink: true,
        fenced_code_blocks: true,
        tables: true,
        lax_spacing: true,
        no_intra_emphasis: true,
        strikethrough: true,
        superscript: true,
        disable_indented_code_blocks: true,
        with_toc_data: true
    }
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text)
  end
end
