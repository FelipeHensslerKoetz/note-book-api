class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  accepts_nested_attributes_for :phones, allow_destroy: true

  def as_json(options = {})
    h = super(options)
    h[:birthdate] = (I18n.l(birthdate) unless birthdate.blank?)
    h
  end

  # def to_pt
  #   {
  #     name:,
  #     email:,
  #     birthdate: (I18n.l(birthdate) unless birthdate.blank?)
  #   }
  # end

  #   def author
  #     'Felipe Henssler Koetz'
  #   end

  #   def kind_description
  #     kind.description
  #   end

  #   def as_json(_options = {})
  #     super(methods: %i[author kind_description], root: true, include: { kind: { only: :description } })
  #   end

  # def hello
  #   I18n.t('hello')
  # end

  # def i18n
  #   I18n.locale
  # end
end
