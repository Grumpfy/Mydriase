module SimpleTableHelper

  def simple_table_for(records, columns)
    presenter = SimpleTable.new(self, records, columns)
    if block_given?
      yield presenter
    else
      presenter
    end
  end

end
