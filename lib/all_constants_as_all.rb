module AllConstantsAsAll
  def self.included(list_module)
    list_module.const_set(:ALL, list_module.constants.map { |c| list_module.const_get c })
  end
end