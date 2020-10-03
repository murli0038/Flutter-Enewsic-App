import 'categoryModel.dart';

List<CategoryModel> getCategory()
{
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categorymodel = new CategoryModel();

  //1
  categorymodel.categoryName = "Business";
  categorymodel.categoryImage = "https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categorymodel);

  //2
  categorymodel = new CategoryModel();
  categorymodel.categoryName = "Entertainment";
  categorymodel.categoryImage = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categorymodel);

  //3
  categorymodel = new CategoryModel();
  categorymodel.categoryName = "General";
  categorymodel.categoryImage = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  category.add(categorymodel);

  //4
  categorymodel = new CategoryModel();
  categorymodel.categoryName = "Health";
  categorymodel.categoryImage = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  category.add(categorymodel);

  //5
  categorymodel = new CategoryModel();
  categorymodel.categoryName = "Science";
  categorymodel.categoryImage = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  category.add(categorymodel);

  //5
  categorymodel = new CategoryModel();
  categorymodel.categoryName = "Sports";
  categorymodel.categoryImage = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  category.add(categorymodel);

  //5
  categorymodel = new CategoryModel();
  categorymodel.categoryName = "Technology";
  categorymodel.categoryImage = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categorymodel);


  return category;
}