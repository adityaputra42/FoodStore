import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:food_market/cubit/cubit.dart';

import 'package:food_market/models/model.dart';
import 'package:food_market/shared/shared.dart';
import 'package:food_market/ui/widgets/widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supercharged/supercharged.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:url_launcher/url_launcher.dart';

part 'general_page.dart';
part 'sign_in_page.dart';
part 'sign_up_page.dart';
part 'address_page.dart';
part 'main_page.dart';
part 'food_page.dart';
part 'food_detai_page.dart';
part 'payment_page.dart';
part 'ilustration_page.dart';
part 'succes_order_page.dart';
part 'succes_sign_up_page.dart';
part 'order_history_page.dart';
part 'profile_page.dart';
part 'payment_method_page.dart';
