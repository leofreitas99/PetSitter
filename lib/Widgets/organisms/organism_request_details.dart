import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_sitting_project/Constants/constants_colors.dart';
import 'package:pet_sitting_project/bloc/petBloc.dart';
import 'package:pet_sitting_project/constants/constant_routes.dart';
import 'package:pet_sitting_project/entities/pet.dart';
import 'package:pet_sitting_project/entities/petsitter.dart';

class OrganismRequestsDetails extends StatefulWidget {
  const OrganismRequestsDetails({super.key});

  @override
  State<OrganismRequestsDetails> createState() =>
      _OrganismRequestsDetailsState();
}

class _OrganismRequestsDetailsState extends State<OrganismRequestsDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetBloc, Pet>(builder: (context, pet) {
      if (pet.name == '') {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: ConstantColors.gray)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      image: DecorationImage(
                        image: AssetImage("assets/images/puppy.jpg"),
                      ),
                    ),
                  ),
                  SizedBox(width: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        pet.name,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${pet.age} years',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Service Code: ${pet.serviceCode}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 18),
            Text(
              'Time: ${pet.time} hour',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 18),
            Text(
              'Owner: ${pet.owner}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 18),
            Text(
              'Location: ${pet.location}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, ConstantRoutes.trackRoute);
                    },
                    icon: Icon(
                      Icons.gps_fixed,
                      size: 15,
                    ),
                    label: Text('Get Location'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ConstantColors.primary,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                Container(
                  width: 140,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, ConstantRoutes.qrCode);
                    },
                    icon: Icon(
                      Icons.flag,
                      size: 15,
                    ),
                    label: Text('Start tour'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ConstantColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }
    });
  }
}
