class SimpleTable

  attr_reader :columns

  delegate :each, to: :@records
  
  def initialize(template, records, columns)
    @template = template
    @records  = records
    @columns  = columns
  end

  def values(record)
    @columns.each_with_object({}) do |(title, extractor), memo|
      memo[title] = extract_value(record, extractor)
    end
  end

  def to_s
    @template.render partial: 'presenters/simple_table', object: self
  end

  private

  def extract_value(record, extractor)
    if extractor.respond_to?(:call)
      extractor.call(record)
    else
      "Test2"
      # record.send(extractor)
    end
  end

end
