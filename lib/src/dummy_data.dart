import 'package:eraasoft_ecommerce/models/category.dart';
import 'package:eraasoft_ecommerce/models/old_product.dart';

class Category{

  String name;
  String image;
  Category({ required this.name,
    required this.image
  });
}


class DummyData {
  static List banners = [
    'https://image.freepik.com/free-vector/flat-sale-banner-with-photo_23-2149026968.jpg'
    'https://image.freepik.com/free-psd/modern-sales-banner-template_23-2148995448.jpg',
    'https://image.freepik.com/free-vector/flat-sale-banner-with-photo_23-2149026968.jpg',
  ];

   static List<Category> categories = [
     Category(
         name: 'Laptops',
         image:
             'https://www.lenovo.com/medias/lenovo-laptops-ideapad-5i-15-series-front-thumbnail.png?context=bWFzdGVyfHJvb3R8NTUwNjJ8aW1hZ2UvcG5nfGg1Yy9oZWMvMTEwOTQ1OTc0NjgxOTAucG5nfDc4NTkyNmU3NzUyYzkxYzU4OGI2YjQ4MmI1ZTlmMDc3NmVmOTFhYjI1NjBmZmI0YWJkM2UzMTljZmJlZThhZjU'),
     Category(
         name: 'Phone',
         image:
             'https://media.btech.com/media/catalog/product/cache/22b1bed05f04d71c4a848d770186c3c4/i/p/iphone-12-red-select-2020.png'),
     Category(
         name: 'Games',
         image:
             'https://chronicle.durhamcollege.ca/wp-content/uploads/2021/01/ps5-photo.png'),
     Category(
         name: 'Accessories',
         image:
             'https://purepng.com/public/uploads/large/purepng.com-black-keyboardkeyboardcomputer-keyboardtypewriter-stylebuttons-or-keyselectronic-switchstyle-keyboardsblack-keyboard-1701528354247idydy.png'),
   ];

  static List<OldProduct> bestSeller = [
    OldProduct(
      id: 1,
        name: 'pixma printer MG2540S',
        image:
            'https://www.lenovo.com/medias/lenovo-laptops-ideapad-5i-15-series-front-thumbnail.png?context=bWFzdGVyfHJvb3R8NTUwNjJ8aW1hZ2UvcG5nfGg1Yy9oZWMvMTEwOTQ1OTc0NjgxOTAucG5nfDc4NTkyNmU3NzUyYzkxYzU4OGI2YjQ4MmI1ZTlmMDc3NmVmOTFhYjI1NjBmZmI0YWJkM2UzMTljZmJlZThhZjU',
        price: 920,
        isFavorite: false),
    OldProduct(
      id: 2,
        name: 'Lenovo V15 Laptop',
        image:
            'https://www.lenovo.com/medias/lenovo-laptops-ideapad-5i-15-series-front-thumbnail.png?context=bWFzdGVyfHJvb3R8NTUwNjJ8aW1hZ2UvcG5nfGg1Yy9oZWMvMTEwOTQ1OTc0NjgxOTAucG5nfDc4NTkyNmU3NzUyYzkxYzU4OGI2YjQ4MmI1ZTlmMDc3NmVmOTFhYjI1NjBmZmI0YWJkM2UzMTljZmJlZThhZjU',
        price: 115,
        isFavorite: false),
    OldProduct(
        id: 3,
        name: 'ROMOSS Power Bank',
        image:
            'https://m.media-amazon.com/images/I/71sesDsw95L._AC_SX355_.jpg',
        price: 220,
        isFavorite: false),
    OldProduct(
        id: 4,
        name: 'pixma printer MG2540S',
        image:
            'https://m.media-amazon.com/images/I/71Nly9vPapL._AC_SY450_.jpg',
        price: 990,
        isFavorite: false),
    OldProduct(
      id: 5,
        name: 'pixma printer MG2540S',
        image:
            'https://m.media-amazon.com/images/I/71qodgwQQ7S._AC_SY450_.jpg',
        price: 990,
        isFavorite: false),
    OldProduct(
      id: 6,
        name: 'pixma printer MG2540S',
        image:
            'https://www.lenovo.com/medias/lenovo-laptops-ideapad-5i-15-series-front-thumbnail.png?context=bWFzdGVyfHJvb3R8NTUwNjJ8aW1hZ2UvcG5nfGg1Yy9oZWMvMTEwOTQ1OTc0NjgxOTAucG5nfDc4NTkyNmU3NzUyYzkxYzU4OGI2YjQ4MmI1ZTlmMDc3NmVmOTFhYjI1NjBmZmI0YWJkM2UzMTljZmJlZThhZjU',
        price: 990,
        isFavorite: false),
    OldProduct(
      id: 7,
        name: 'pixma printer MG2540S',
        image:
            'https://www.lenovo.com/medias/lenovo-laptops-ideapad-5i-15-series-front-thumbnail.png?context=bWFzdGVyfHJvb3R8NTUwNjJ8aW1hZ2UvcG5nfGg1Yy9oZWMvMTEwOTQ1OTc0NjgxOTAucG5nfDc4NTkyNmU3NzUyYzkxYzU4OGI2YjQ4MmI1ZTlmMDc3NmVmOTFhYjI1NjBmZmI0YWJkM2UzMTljZmJlZThhZjU',
        price: 990,
        isFavorite: false),
    OldProduct(
      id: 8,
        name: 'pixma printer MG2540S',
        image:
            'https://www.lenovo.com/medias/lenovo-laptops-ideapad-5i-15-series-front-thumbnail.png?context=bWFzdGVyfHJvb3R8NTUwNjJ8aW1hZ2UvcG5nfGg1Yy9oZWMvMTEwOTQ1OTc0NjgxOTAucG5nfDc4NTkyNmU3NzUyYzkxYzU4OGI2YjQ4MmI1ZTlmMDc3NmVmOTFhYjI1NjBmZmI0YWJkM2UzMTljZmJlZThhZjU',
        price: 990,
        isFavorite: false),
    OldProduct(
      id: 9,
        name: 'pixma printer MG2540S',
        image:
            'https://www.lenovo.com/medias/lenovo-laptops-ideapad-5i-15-series-front-thumbnail.png?context=bWFzdGVyfHJvb3R8NTUwNjJ8aW1hZ2UvcG5nfGg1Yy9oZWMvMTEwOTQ1OTc0NjgxOTAucG5nfDc4NTkyNmU3NzUyYzkxYzU4OGI2YjQ4MmI1ZTlmMDc3NmVmOTFhYjI1NjBmZmI0YWJkM2UzMTljZmJlZThhZjU',
        price: 990,
        isFavorite: false),
    OldProduct(
      id: 10,
        name: 'pixma printer MG2540S',
        image:
            'https://www.lenovo.com/medias/lenovo-laptops-ideapad-5i-15-series-front-thumbnail.png?context=bWFzdGVyfHJvb3R8NTUwNjJ8aW1hZ2UvcG5nfGg1Yy9oZWMvMTEwOTQ1OTc0NjgxOTAucG5nfDc4NTkyNmU3NzUyYzkxYzU4OGI2YjQ4MmI1ZTlmMDc3NmVmOTFhYjI1NjBmZmI0YWJkM2UzMTljZmJlZThhZjU',
        price: 990,
        isFavorite: false),
    OldProduct(
      id: 11,
        name: 'pixma printer MG2540S',
        image:
            'https://www.lenovo.com/medias/lenovo-laptops-ideapad-5i-15-series-front-thumbnail.png?context=bWFzdGVyfHJvb3R8NTUwNjJ8aW1hZ2UvcG5nfGg1Yy9oZWMvMTEwOTQ1OTc0NjgxOTAucG5nfDc4NTkyNmU3NzUyYzkxYzU4OGI2YjQ4MmI1ZTlmMDc3NmVmOTFhYjI1NjBmZmI0YWJkM2UzMTljZmJlZThhZjU',
        price: 990,
        isFavorite: false),
  ];
}
