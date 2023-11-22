import 'package:community_hub/app/dashboard/data/models/community_service.dart';
import 'package:community_hub/lib.dart';
import 'package:community_hub/src/mock/database/services.dart';
import 'package:community_hub/src/router/navigator.dart';
import 'package:community_hub/src/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceSearchTextField extends StatelessWidget {
  final TextEditingController controller;

  const ServiceSearchTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      initialValue: TextEditingValue(text: controller.text),
      optionsMaxHeight: 100,
      fieldViewBuilder: (BuildContext context,
              TextEditingController internalController,
              FocusNode node,
              Function onSubmit) =>
          TextFormField(
        onChanged: (value) {},
        //enabled:
        validator: (value) {
          if (value!.isEmpty) {
            return 'Country is required';
          }
          if (controller.text.isEmpty) {
            return 'Country is required';
          }
          return null;
        },
        controller: internalController,
        focusNode: node,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 8),
          hintText: 'Search what you need...',
          suffixIcon: Padding(
            padding: const EdgeInsets.all(6.0),
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: context.primary,
                    borderRadius: BorderRadius.circular(6.r)),
                child: Icon(
                  Icons.search,
                  color: context.onPrimary,
                )),
          ),
        ),
      ),
      optionsBuilder: (TextEditingValue textEditingValue) async {
        if (textEditingValue.text == '') {
          return CommunityService.services.map((e) => e.service);
        }
        return CommunityService.services
            .where((element) => element.service
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase()))
            .map((e) => e.service);
      },
      onSelected: (String selection) {
        controller.text = selection;
        CommunityService service = CommunityService.getService(selection);
        switch (service.type) {
          case CommunityServiceType.ac:
            AppNavigator.of(context).push(ServiceList(
                workers: LocalDatabase.acRepair, title: 'AC Repair'));
          case CommunityServiceType.beauty:
            AppNavigator.of(context).push(
                ServiceList(workers: LocalDatabase.beauty, title: 'Beauty'));
          case CommunityServiceType.appliance:
            AppNavigator.of(context).push(ServiceList(
                workers: LocalDatabase.appliance, title: 'Appliance'));
          case CommunityServiceType.painting:
            AppNavigator.of(context).push(ServiceList(
                workers: LocalDatabase.painting, title: 'Painting'));
          case CommunityServiceType.cleaning:
            AppNavigator.of(context).push(ServiceList(
                workers: LocalDatabase.cleaning, title: 'Cleaning'));
          case CommunityServiceType.plumbing:
            AppNavigator.of(context).push(ServiceList(
                workers: LocalDatabase.plumbing, title: 'Plumbing'));
          case CommunityServiceType.electronics:
            AppNavigator.of(context).push(ServiceList(
                workers: LocalDatabase.electronics, title: 'Electronics'));
          case CommunityServiceType.logistics:
            AppNavigator.of(context).push(ServiceList(
                workers: LocalDatabase.logistics, title: 'Logistics'));
          case CommunityServiceType.salon:
            AppNavigator.of(context).push(
                ServiceList(workers: LocalDatabase.salon, title: 'Salon'));
          case CommunityServiceType.none:
            break;
          case null:
            break;
        }
      },
    );
  }
}
