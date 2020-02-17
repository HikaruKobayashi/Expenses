class IncomeCollection
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  INCOME_NUM = 1
  attr_accessor :collection

  def initialize(attributes = [])
    if attributes.present?
      self.collection = attributes.map do |value|
        Income.new(
          name: value['name'],
          content: value['content'],
          money: value['money']
        )
      end
    else
      self.collection = INCOME_NUM.times.map{ Income.new }
    end
  end

  def persisted?
    false
  end
  
  def save
    is_success = true
    ActiveRecord::Base.transaction do
      collection.each do |result|
        is_success = false unless result.save
      end
      raise ActiveRecord::RecordInvalid unless is_success
    end
    rescue
      p 'エラー'
    ensure
      return is_success
  end
end