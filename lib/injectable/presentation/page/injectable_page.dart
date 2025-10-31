import 'package:ex_project/injectable/presentation/controller/injetable_view_model.dart';
import 'package:flutter/material.dart';

class InjectablePage extends StatefulWidget {
  final InjectableViewModel viewModel;
  const InjectablePage({super.key, required this.viewModel});

  @override
  State<InjectablePage> createState() => _InjectablePageState();
}

class _InjectablePageState extends State<InjectablePage> {
  @override
  Widget build(BuildContext context) {
    final state = widget.viewModel.state;
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (context, child) {
            if (state.isLoading) {
              return const CircularProgressIndicator();
            }
            if (state.isError) {
              return const Text("에러 에러");
            }
            return ListView.builder(
              itemCount: state.injectableTests.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Text(state.injectableTests[index].title),
                  Text(state.injectableTests[index].contents),
                  Text(state.injectableTests[index].media),
                  Text(state.injectableTests[index].type),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
