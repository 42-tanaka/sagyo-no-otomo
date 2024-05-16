module ApplicationHelper

  def default_meta_tags
    {
      site: '作業のオトモ',
      title: 'デスクワーク作業のお供に食べたお菓子や飲み物を記録・シェアするサービス',
      reverse: true,
      separator: '|',
      description: 'デスクワーク作業のお供に食べたお菓子や飲み物を、職場だと気になってしまうポイントと一緒に記録・シェアしましょう。',
      keywords: 'デスクワーク, 作業, お供, お菓子, 飲み物',
      canonical: request.original_url,
      image: :image.presence || image_url('logo.png'),

      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@',
      }
    }
  end

end
