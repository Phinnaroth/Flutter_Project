import 'package:flutter/material.dart';
import 'package:my_flutter_project/widgets/actions/bla_buttons.dart';
import 'package:my_flutter_project/widgets/inputs/bla_textformfield.dart';

import '../../model/ride_pref/ride_pref.dart';
import '../../service/ride_prefs_service.dart';
import '../../theme/theme.dart';
 
import 'widgets/ride_pref_form.dart';
import 'widgets/ride_pref_history_tile.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class RidePrefScreen extends StatefulWidget {
  const RidePrefScreen({super.key});

  @override
  State<RidePrefScreen> createState() => _RidePrefScreenState();
}

class _RidePrefScreenState extends State<RidePrefScreen> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  
  onRidePrefSelected(RidePref ridePref) {
 
   // 1 - Navigate to the rides screen (with a buttom to top animation) 
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RidePrefForm()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1 - Background  Image
        BlaBackground(),

        // 2 - Foreground content
        Column(
          children: [
            SizedBox(height: 16),
            Text(
              "Your pick of rides at low price",
              style: BlaTextStyles.heading.copyWith(color: Colors.white),
            ),
            SizedBox(height: 100),
            Container(
              margin: EdgeInsets.symmetric(horizontal: BlaSpacings.xxl),
              decoration: BoxDecoration(
                color: Colors.white, // White background
                borderRadius: BorderRadius.circular(16), // Rounded corners
              ),
            
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  BlaTextFormField(
                    controller: fromController, 
                    icon: Icons.location_on, 
                    hintText: 'Leaving from', 
                    onTap: () => {},
                  ),
                  
                  BlaTextFormField(
                    controller: toController, 
                    icon: Icons.location_on, 
                    hintText: 'Going to', 
                    onTap: () => {},
                  ),
                  BlaTextFormField(
                    controller: dateController, 
                    icon: Icons.calendar_month, 
                    hintText: "Today",
                    readOnly: true, 
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        dateController.text = "${pickedDate.toLocal()}".split(' ')[0]; // Update the text field
                      }
                    },
                  ),
                  BlaTextFormField(
                    icon: Icons.person,
                    hintText: '1',
                    onTap: () => {},
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: BlaButtons(
                      label: 'Search',  
                      onPressed: () {
                        // 1 - Save the current ride preferences
                        // RidePrefService.currentRidePref = RidePref(
                        //   departure: Location(fromController.text),
                        //   arrival: Location(toController.text),
                        //   departureDate: dateController.text,
                        // );
                        // 2 - Navigate to the rides screen (with a buttom to top animation) 
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RidePrefForm()),
                        );
                      },
                    ),
                  ),
                  


                  // 2.1 Display the Form to input the ride preferences
                  RidePrefForm(initRidePref: RidePrefService.currentRidePref,),
                  SizedBox(height: BlaSpacings.m),





                  // 2.2 Optionally display a list of past preferences
                  SizedBox(
                    height: 200, // Set a fixed height
                    child: ListView.builder(
                      shrinkWrap: true, // Fix ListView height issue
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: RidePrefService.ridePrefsHistory.length,
                      itemBuilder: (ctx, index) => RidePrefHistoryTile(
                        ridePref: RidePrefService.ridePrefsHistory[index],
                        onPressed: () => onRidePrefSelected(RidePrefService.ridePrefsHistory[index]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BlaBackground extends StatelessWidget {
  const BlaBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset(
        blablaHomeImagePath,
        fit: BoxFit.cover, // Adjust image fit to cover the container
      ),
    );
  }
}
 