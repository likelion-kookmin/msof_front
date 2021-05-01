import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:msof_front/models/contact_us.dart';

// AppbarTitle
final appBarTitle = 'MutstackOverflow';

// API base url
const baseApiUrl = 'http://54.65.162.242';

// Footer Information
final socialAccounts = [
  ContactUs(
    name: 'facebook',
    value: 'https://www.facebook.com/LikeLionKookmin',
    icon: FontAwesomeIcons.facebook,
  ),
  ContactUs(
    name: 'instagram',
    value: 'https://www.instagram.com/likelion_kmu/',
    icon: FontAwesomeIcons.instagram,
  ),
  ContactUs(
    name: 'github',
    value: 'https://github.com/likelion-kookmin',
    icon: FontAwesomeIcons.github,
  ),
];

// Footer information
final contactUs = [
  ContactUs(
    name: 'email',
    value: 'kmu@likelion.org',
    icon: FontAwesomeIcons.envelope,
  ),
  ContactUs(
    name: 'address',
    value: '서울 성북구 정릉로 77 (국민대학교)',
    icon: FontAwesomeIcons.map,
  ),
];
