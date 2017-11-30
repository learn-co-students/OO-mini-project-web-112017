module Deletable

  def delete_helper(class_all, some_instance)
    method = some_instance.class.to_s.downcase
    class_all.select do |item|
      item.send(method) == some_instance
    end.collect.each do |thing|
      class_all.delete(thing)
    end
  end


end
