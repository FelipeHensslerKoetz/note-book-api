class Contact < ApplicationRecord
  belongs_to :kind

  def author
    'Felipe Henssler Koetz'
  end

  def kind_description
    kind.description
  end

  def as_json(_options = {})
    super(methods: %i[author kind_description], root: true, include: { kind: { only: :description } })
  end
end
