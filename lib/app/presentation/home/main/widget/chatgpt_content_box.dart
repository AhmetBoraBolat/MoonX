import 'package:flutter/material.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/main/viewmodel/AI/main_page_ai_view_model.dart';
import 'package:provider/provider.dart';

class ChatGptContentContainer extends StatefulWidget {
  const ChatGptContentContainer({
    super.key,
  });

  @override
  State<ChatGptContentContainer> createState() =>
      _ChatGptContentContainerState();
}

class _ChatGptContentContainerState extends State<ChatGptContentContainer> {
  late MainPageAIViewModel _viewModel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<MainPageAIViewModel>(context, listen: false);
    _initializeZodiac();
  }

  Future<void> _initializeZodiac() async {
    await _viewModel.getZodiac();
  }

  @override
  Widget build(BuildContext context) {
    _isLoading = context.watch<MainPageAIViewModel>().isLoading;
    return Container(
      width: ScreenSize.screenWidth * 0.88,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(252, 252, 252, 0.1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.all(ScreenSize.screenWidth * 0.05),
        child: _isLoading
            ? Text(
                context.watch<MainPageAIViewModel>().gptContent,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
