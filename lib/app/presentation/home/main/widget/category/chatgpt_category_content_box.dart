import 'package:flutter/material.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/main/viewmodel/AI/main_page_ai_view_model.dart';
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
              Image.asset(
                viewModel.getCategoryImage(),
                scale: 0.8,
              ),
              SizedBox(
                height: ScreenSize.screenHeight * 0.04,
              ),
              Text(
                viewModel.gptCategoryContent.isNotEmpty
                    ? viewModel.gptCategoryContent
                    : "Content not available",
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
