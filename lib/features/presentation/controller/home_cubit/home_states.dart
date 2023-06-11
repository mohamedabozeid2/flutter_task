abstract class HomeStates{}

class HomeInitialState extends HomeStates{}
class ChangeBotNavBarState extends HomeStates{}

class HomeGetAllCategoriesLoadingStates extends HomeStates{}
class HomeGetAllCategoriesSuccessStates extends HomeStates{}
class HomeGetAllCategoriesErrorStates extends HomeStates{
  final String error;

  HomeGetAllCategoriesErrorStates(this.error);
}
class HomeGetAllProductsLoadingStates extends HomeStates{}
class HomeGetAllProductsSuccessStates extends HomeStates{}
class HomeGetAllProductsErrorStates extends HomeStates{
  final String error;

  HomeGetAllProductsErrorStates(this.error);
}


class HomeGetSingleCategoryProductsLoadingStates extends HomeStates{}
class HomeGetSingleCategoryProductsSuccessStates extends HomeStates{}
class HomeGetSingleCategoryProductsErrorStates extends HomeStates{
  final String error;

  HomeGetSingleCategoryProductsErrorStates(this.error);
}

class HomeRemoveFromCartSuccessState extends HomeStates{}