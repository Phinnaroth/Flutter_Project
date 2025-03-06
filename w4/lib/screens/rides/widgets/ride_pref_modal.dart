import 'package:flutter/material.dart';
import 'package:w4/widgets/actions/bla_icon_button.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../theme/theme.dart';
import '../../ride_pref/widgets/ride_pref_form.dart';

class RidePrefModal extends StatefulWidget {
  final RidePreference currentPreference;  // Accept current preference

  const RidePrefModal({
    super.key,
    required this.currentPreference,  // Passing current preference to the modal
  });

  @override
  State<RidePrefModal> createState() => _RidePrefModalState();
}

class _RidePrefModalState extends State<RidePrefModal> {
  late RidePreference _updatedPreference;

  @override
  void initState() {
    super.initState();
    // Initialize the updated preference with the current preference
    _updatedPreference = widget.currentPreference;
  }

  void onBackSelected() {
    Navigator.of(context).pop();  // Close modal without returning anything
  }

  void onSubmit(RidePreference newPreference) {
    // Return the updated preference when submitting
    Navigator.of(context).pop(newPreference);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: BlaSpacings.m, right: BlaSpacings.m, top: BlaSpacings.s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back icon
            BlaIconButton(
              onPressed: onBackSelected,
              icon: Icons.close,
            ),
            SizedBox(height: BlaSpacings.m),

            // Title
            Text("Edit your search",
                style: BlaTextStyles.title.copyWith(color: BlaColors.textNormal)),

            // Form
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: RidePrefForm(
                  initialPreference: _updatedPreference,  // Set the current preference as initial value
                  onSubmit: (newPreference) {
                    // When form is submitted, update preference
                    setState(() {
                      _updatedPreference = newPreference;
                    });
                    onSubmit(newPreference);  // Pass the new preference back
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
