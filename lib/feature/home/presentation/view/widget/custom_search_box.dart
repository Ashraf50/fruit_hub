import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/constant/text_style.dart';
import 'package:fruit_hub/feature/home/presentation/view_model/cubit/fetch_products_cubit.dart';
import 'package:fruit_hub/feature/search/presentation/view/search_view.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as get_transition;

class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => BlocBuilder<FetchProductsCubit, FetchProductsState>(
            builder: (context, state) {
              if (state is FetchProductsSuccess) {
                return SearchView(
                  product: state.fruits,
                );
              }
              return const SearchView(
                product: [],
              );
            },
          ),
          transition: get_transition.Transition.rightToLeft,
          duration: const Duration(milliseconds: 500),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Material(
        elevation: 4,
        shadowColor: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/img/search.svg",
                color: Colors.grey,
                height: 20,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                S.of(context).search_for,
                style: AppStyles.textStyle18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
