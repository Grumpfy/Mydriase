class SimpleTable

  attr_reader :columns

  delegate :each, to: :@records
  
  def initialize(template, records, columns, options = {})
    @template = template
    @records  = records
    @columns  = columns
    @options = options
  end

  def values(record)
    @columns.each_with_object({}) do |(title, extractor), memo|
      memo[title] = extract_value(record, extractor)
    end
  end

  def tr_data(record)
    extract_value(record, @options['data']).mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n,'').downcase.to_s
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
