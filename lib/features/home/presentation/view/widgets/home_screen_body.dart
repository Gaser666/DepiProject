import 'package:card_swiper/card_swiper.dart';
import 'package:depi_project/core/utils/all_product_service.dart';
import 'package:depi_project/core/utils/widgets/app_constants.dart';
import 'package:depi_project/features/home/data/models/product_model.dart';
import 'package:depi_project/features/home/presentation/view/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxLzI3OS1wYWkxNTc5LW5hbS1qb2IxNTI5LnBuZw.png'),
                    radius: 28,
                  ),
                  Column(
                    children: [
                      Text(
                        'Hi, UserName',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Let\'s Shopping',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  color: Colors.black,
                  IconlyLight.search,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: size.height * 0.22,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Swiper(
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    AppConstants.banners[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: AppConstants.banners.length,
                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(activeColor: Colors.blue),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          FutureBuilder<List<ProductModel>>(
              future: AllProductService().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel> products = snapshot.data!;
                  return SizedBox(
                    height: 2050,
                    child: GridView.builder(
                        // shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: products.length,
                        clipBehavior: Clip.none,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 100,
                        ),
                        itemBuilder: (context, index) {
                          return CustomCard(
                            product: products[index],
                          );
                        }),
                  );
                } else {
                  // print(snapshot.data);
                  // print(snapshot.error);
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
    );
  }
}
