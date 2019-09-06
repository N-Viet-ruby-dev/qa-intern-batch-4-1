module QuestionsHelper
  def category_collection
    Category.all.map{|c| [c.name, c.id]}
  end

  def tag_collection
    Tag.all.map{|t| [t.name, t.id]}
  end
end
