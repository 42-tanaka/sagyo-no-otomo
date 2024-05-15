module ApplicationHelper

  def show_meta_tags
    assign_meta_tags if display_meta_tags.blank?
    display_meta_tags
  end

  def assign_meta_tags(options = {})
    defaults = {
      site: '作業のオトモ',
      title: 'デスクワーク作業のお供に食べたお菓子や飲み物を記録・シェアするサービス',
      description: 'デスクワーク作業のお供に食べたお菓子や飲み物を、職場だと気になってしまうポイントと一緒に記録・シェアしましょう。',
      keywords: 'デスクワーク, 作業, お供, お菓子, 飲み物'
    }
    options.reverse_merge!(defaults)
    site = options[:site]
    title = options[:title]
    description = options[:description]
    keywords = options[:keywords]
    image = options[:image].presence || image_url('ogp.png')

    configs = {
      separator: '|',
      reverse: true,
      site: site,
      title: title,
      description: description,
      keywords: keywords,
      canonical: request.original_url,
      icon: {
        href: image_url('ogp.png')
      },
      og: {
        type: 'website',
        title: title.presence || site,
        description: description,
        url: request.original_url,
        image: ,
        site_name: site
      },
      twitter: {
        title: ,
        site: ,
        card: 'summary_large_image',
        image:
      }
    }

    set_meta_tags(configs)
  end

end
