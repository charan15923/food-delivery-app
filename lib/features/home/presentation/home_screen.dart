import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/context_extension.dart';
import '../../../core/utils/ui_dimensions.dart';
import 'bloc/home/home_bloc.dart';
import 'widgets/home/cart_button_widget.dart';
import 'widgets/home/dishes_slider_widget.dart';
import 'widgets/home/dishes_vertical_list_widget.dart';
import 'widgets/home/filter_row_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetHomeScreenDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadedState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    DishesSliderWidget(sliderItems: state.sliderItems),
                    UIDimensions.verticalSpace(30),
                    FilterRowWidget(),
                    UIDimensions.verticalSpace(30),
                    DishesVerticalListWidget(dishes: state.dishes),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: const CartButtonWidget(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(PhosphorIconsRegular.list),
        onPressed: () {},
      ),
      title: IntrinsicWidth(
        child: Container(
          padding:
              UIDimensions.symmetricPaddingInsets(horizontal: 20, vertical: 8),
          decoration: UIDimensions.shapeDecoration(
            boxColor: AppColors.black,
            borderColor: Colors.transparent,
            cornerRadius: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '100a Ealing Rd',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              UIDimensions.horizontalSpace(8),
              const CircleAvatar(
                radius: 2,
                backgroundColor: Colors.white,
              ),
              UIDimensions.horizontalSpace(8),
              Text(
                '24 mins',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(PhosphorIconsRegular.magnifyingGlass),
          onPressed: () {},
        ),
      ],
    );
  }
}
