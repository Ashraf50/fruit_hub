import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widget/custom_app_bar.dart';
import 'package:fruit_hub/core/widget/custom_scaffold.dart';
import 'package:fruit_hub/feature/home/data/fruit_model.dart';
import 'package:fruit_hub/feature/search/presentation/view/widget/search_item.dart';
import 'package:fruit_hub/feature/search/presentation/view/widget/search_text_fielld.dart';
import 'package:fruit_hub/feature/search/presentation/view_model/cubit/search_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class SearchView extends StatefulWidget {
  final List<FruitModel> product;

  const SearchView({
    super.key,
    required this.product,
  });

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final searchController = TextEditingController();
  List<FruitModel> filteredProducts = [];
  @override
  void initState() {
    super.initState();
    filteredProducts = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, List<FruitModel>>(
        builder: (context, state) {
          return CustomScaffold(
            appBar: CustomAppBar(title: S.of(context).search),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  SearchTextField(
                    hintText: S.of(context).search_for,
                    controller: searchController,
                    onChanged: (value) {
                      return searchForProduct(value);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            context.push('/details_view',
                                extra: filteredProducts[index]);
                          },
                          child: SearchItem(
                            product: filteredProducts[index],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void searchForProduct(String query) {
    setState(() {
      filteredProducts = widget.product
          .where((surah) => (surah.name.toLowerCase().contains(query)))
          .toList();
    });
  }
}
