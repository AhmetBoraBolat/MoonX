import 'package:flutter/material.dart';
import 'package:moon_x/app/core/consturactor/const_image.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/main/viewmodel/AI/main_page_ai_view_model.dart';
import 'package:moon_x/app/presentation/premium/view/premium_view.dart';
import 'package:provider/provider.dart';

class ChatGptCategoryContentContainer extends StatefulWidget {
  const ChatGptCategoryContentContainer({
    super.key,
  });

  @override
  State<ChatGptCategoryContentContainer> createState() =>
      _ChatGptCategoryContentContainerState();
}

class _ChatGptCategoryContentContainerState
    extends State<ChatGptCategoryContentContainer> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenSize.init(context);
  }

  @override
  void initState() {
    super.initState();
    context.read<MainPageAIViewModel>().chatGptCategoryRequest();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainPageAIViewModel>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth * 0.04),
      child: Container(
        padding: EdgeInsets.all(ScreenSize.screenWidth * 0.02),
        //: EdgeInsets.all(ScreenSize.screenWidth * 0.4),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: const Color(0xFF8E53D8),
            width: 3,
            style: BorderStyle.solid,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(ScreenSize.screenWidth * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    getCategoryImage(),
                    scale: 0.8,
                  ),
                  viewModel.premiumCounter == -1
                      ? const SizedBox.shrink()
                      : viewModel.premiumCounter != 0
                          ? Text(
                              'Remaining quota: ${viewModel.premiumCounter}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color(0xFF8E53D8),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PremiumPage(),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                    horizontal: ScreenSize.screenWidth * 0.1,
                                    vertical: ScreenSize.screenHeight * 0.015,
                                  ),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Color(0xFF535FD8)),
                                elevation: const MaterialStatePropertyAll(0),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Get Premium',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                ],
              ),
              SizedBox(
                height: ScreenSize.screenHeight * 0.04,
              ),
              !viewModel.isLoadingCategoryContent
                  ? viewModel.gptCategoryContent.isNotEmpty
                      ? Text(
                          viewModel.gptCategoryContent,
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        )
                      : const Center(child: CircularProgressIndicator())
                  : const Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }

  String getCategoryImage() {
    switch (context.watch<MainPageAIViewModel>().gptCategory) {
      case 'Business':
        return ImageEnum.homeCategoryBusiness.imagePath;
      case 'Food':
        return ImageEnum.homeCategoryFood.imagePath;
      case 'Relations':
        return ImageEnum.homeCategoryRelations.imagePath;
      default:
        return ImageEnum.homeCategoryBusiness.imagePath;
    }
  }
}
