import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:msof_front/pages/pages.dart';
import 'package:msof_front/routes.dart';
import 'package:msof_front/utils/logger.dart';

class BeamerLocations extends BeamLocation {
  BeamerLocations({BeamState? state}) : super(state);

  @override
  List<String> get pathBlueprints => Routes.allRoutes;

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    logger.d(
        '${state.uri.pathSegments}, pathParameters: ${state.pathParameters}, data: ${state.data}');
    return [
      if (state.uri.pathSegments.contains(Routes.notFound))
        BeamPage(
          key: ValueKey(Routes.notFound),
          title: Routes.getRouteInfoByRouteName(Routes.notFound).title,
          child: NotFoundPage(),
        ),
      if (state.uri.pathSegments.contains(Routes.login))
        BeamPage(
          key: ValueKey(Routes.login),
          title: Routes.getRouteInfoByRouteName(Routes.login).title,
          child: LoginPage(),
        ),
      if (state.uri.pathSegments.contains(Routes.logout))
        BeamPage(
          key: ValueKey(Routes.logout),
          title: Routes.getRouteInfoByRouteName(Routes.logout).title,
          child: LogoutPage(),
        ),
      if (state.uri.pathSegments.contains(Routes.signup))
        BeamPage(
          key: ValueKey(Routes.signup),
          title: Routes.getRouteInfoByRouteName(Routes.signup).title,
          child: SignupPage(),
        ),
      if (state.uri.pathSegments.contains(Routes.home))
        BeamPage(
          key: ValueKey(Routes.home),
          title: Routes.getRouteInfoByRouteName(Routes.home).title,
          child: HomePage(),
        ),

      // Question
      ..._buildQuestionPages(state),
    ];
  }

  /// Question pages
  List<BeamPage> _buildQuestionPages(BeamState state) {
    final pages = <BeamPage>[];

    if (state.uri.pathSegments.contains(Routes.question)) {
      if (state.pathParameters.containsKey(Routes.question.pathParameterId)) {
        final questionId =
            int.parse(state.pathParameters[Routes.question.pathParameterId]!);

        /// Question update page
        if (state.uri.pathSegments.contains(Routes.update)) {
          pages.add(BeamPage(
            key: ValueKey('${Routes.question}-${Routes.update}-$questionId'),
            title: '${Routes.question}-${Routes.update}-$questionId',
            child: QuestionCreatePage(questionId: questionId),
          ));
        } else {
          /// Question detail page
          pages.add(BeamPage(
            key: ValueKey('${Routes.question}-$questionId'),
            title: '${Routes.question}-$questionId',
            child: QuestionDetail(questionId: questionId),
          ));
        }
      }

      /// Question create page
      else if (state.uri.pathSegments.contains(Routes.create)) {
        pages.add(BeamPage(
          key: ValueKey('${Routes.question}-${Routes.create}'),
          title: '${Routes.question}-${Routes.create}',
          child: QuestionCreatePage(),
        ));
      }

      /// Question list page
      else {
        //(state.uri.pathSegments.contains(Routes.questionList)) {
        pages.add(BeamPage(
          key: ValueKey('${Routes.questionList}'),
          title: '${Routes.questionList}',
          child: QuestionListPage(),
        ));
      }
    }

    return pages;
  }
}
