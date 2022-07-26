module Truncate

  def truncate(attribute, **options)
   truncate_data(attribute, **options)
  end

  private

    def truncate_data(attribute,  **options)
      define_method "#{attribute}=" do |value|
        result = value.length > options[:length] ? "#{value[0...options[:length]]}..." : value
        instance_variable_set("@#{attribute}", result)
      end
    end
end
