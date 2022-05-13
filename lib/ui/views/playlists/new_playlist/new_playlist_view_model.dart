import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NewPlaylistViewModel extends BaseViewModel {
  final TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;
}
