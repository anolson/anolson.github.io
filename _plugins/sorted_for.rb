module Jekyll
  class SortedForTag < Liquid::For
    def render(context)
      STDOUT.puts "--> #{@collection_name}"
      sorted_collection = context[@collection_name].dup
      sorted_collection.sort_by! { |i| i.to_liquid[@attributes['sort_by']] }

      sorted_collection_name = "#{@collection_name}_sorted".gsub('.', '_')
      puts "#{sorted_collection_name}"
      context[sorted_collection_name] = sorted_collection
      @collection_name = sorted_collection_name

      super
    end

    def end_tag
      'endsorted_for'
    end
  end
end

Liquid::Template.register_tag('sorted_for', Jekyll::SortedForTag)