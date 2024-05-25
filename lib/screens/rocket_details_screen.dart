// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:spacex/models/rocket_model.dart';
import 'package:spacex/utils/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class RocketDetailsScreen extends StatelessWidget {
  final RocketModel rocketDetails;
  final bool isOnline;
  const RocketDetailsScreen({
    super.key,
    required this.rocketDetails,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: MyColors.whiteColor,
        appBar: AppBar(
            iconTheme: const IconThemeData(color: MyColors.whiteColor),
            centerTitle: true,
            backgroundColor: MyColors.darkbluecolor,
            title: Text(
              "SpaceX",
              style: TextStyle(
                  fontSize: size.width * .045,
                  fontWeight: FontWeight.w600,
                  fontFamily: "poppins",
                  color: MyColors.whiteColor),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rocketDetails.name == "null"
                      ? "--"
                      : rocketDetails.name.toString(),
                  style: TextStyle(
                    fontSize: size.width * .06,
                    fontWeight: FontWeight.bold,
                    fontFamily: "poppins",
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Photos",
                  style: TextStyle(
                    fontSize: size.width * .03,
                    fontWeight: FontWeight.bold,
                    fontFamily: "poppins",
                  ),
                ),
                const SizedBox(height: 5),
                isOnline == false
                    ? rocketDetails.flickrImages2 == null
                        ? Text(
                            "Oops..No Images Found !!",
                            style: TextStyle(
                                fontSize: size.width * .045,
                                fontWeight: FontWeight.w600,
                                fontFamily: "poppins",
                                color: MyColors.whiteColor),
                          )
                        : SizedBox(
                            height: size.height * .25,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: rocketDetails.flickrImages2!.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: MyColors.darkbluecolor)),
                                  width: size.width * .7,
                                  child: isOnline == false
                                      ? Image.memory(base64Decode(rocketDetails
                                          .flickrImages2![index]
                                          .toString()))
                                      : Image.network(
                                          rocketDetails.flickrImages2![index]
                                              .toString(),
                                          fit: BoxFit.fill,
                                        ),
                                ),
                              ),
                            ),
                          )
                    : rocketDetails.flickrImages == null
                        ? Text(
                            "Oops..No Images Found !!",
                            style: TextStyle(
                                fontSize: size.width * .045,
                                fontWeight: FontWeight.w600,
                                fontFamily: "poppins",
                                color: MyColors.whiteColor),
                          )
                        : SizedBox(
                            height: size.height * .25,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: rocketDetails.flickrImages!.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: MyColors.darkbluecolor)),
                                  width: size.width * .7,
                                  child: isOnline == false
                                      ? Image.memory(base64Decode(rocketDetails
                                          .flickrImages![index]
                                          .toString()))
                                      : Image.network(
                                          rocketDetails.flickrImages![index]
                                              .toString(),
                                          fit: BoxFit.fill,
                                        ),
                                ),
                              ),
                            ),
                          ),
                const SizedBox(height: 20),
                const Divider(thickness: 1),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Active Status",
                          style: TextStyle(
                            color: MyColors.greycolor,
                            fontSize: size.width * .035,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                          ),
                        ),
                        Text(
                          "Cost Per Launch",
                          style: TextStyle(
                            color: MyColors.greycolor,
                            fontSize: size.width * .035,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                          ),
                        ),
                        Text(
                          "success Rate Percentage",
                          style: TextStyle(
                            color: MyColors.greycolor,
                            fontSize: size.width * .035,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                          ),
                        ),
                        Text(
                          "Boosters",
                          style: TextStyle(
                            color: MyColors.greycolor,
                            fontSize: size.width * .035,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                          ),
                        ),
                        Text(
                          "Height",
                          style: TextStyle(
                            color: MyColors.greycolor,
                            fontSize: size.width * .035,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                          ),
                        ),
                        Text(
                          "Diameter",
                          style: TextStyle(
                            color: MyColors.greycolor,
                            fontSize: size.width * .035,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          rocketDetails.active == null
                              ? "--"
                              : rocketDetails.active.toString() == "true"
                                  ? "Active"
                                  : "Inactive",
                          style: TextStyle(
                            fontSize: size.width * .035,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                          ),
                        ),
                        Text(
                          rocketDetails.costPerLaunch == null
                              ? "--"
                              : "${rocketDetails.costPerLaunch}\$",
                          style: TextStyle(
                            fontSize: size.width * .035,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                          ),
                        ),
                        Text(
                          rocketDetails.successRatePct == null
                              ? "--"
                              : "${rocketDetails.successRatePct}%",
                          style: TextStyle(
                            fontSize: size.width * .035,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                          ),
                        ),
                        Text(
                          rocketDetails.boosters == null
                              ? "--"
                              : "${rocketDetails.boosters}",
                          style: TextStyle(
                            fontSize: size.width * .035,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                          ),
                        ),
                        Text(
                          rocketDetails.heightFeet == "null"
                              ? "--"
                              : isOnline == false
                                  ? "${rocketDetails.heightFeet} Feet"
                                  : rocketDetails.height == null
                                      ? "--"
                                      : "${rocketDetails.height!.feet} Feet",
                          style: TextStyle(
                            fontSize: size.width * .035,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                          ),
                        ),
                        Text(
                          isOnline == false
                              ? "${rocketDetails.diameterFeet} Feet"
                              : rocketDetails.diameter!.feet.toString() ==
                                      "null"
                                  ? "--"
                                  : "${rocketDetails.diameter!.feet} Feet",
                          style: TextStyle(
                            fontSize: size.width * .035,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(thickness: 1),
                const SizedBox(height: 10),
                Text(
                  rocketDetails.description == null
                      ? "--"
                      : "${rocketDetails.description}",
                  style: TextStyle(
                    fontSize: size.width * .035,
                    fontWeight: FontWeight.bold,
                    fontFamily: "poppins",
                  ),
                ),
                const Divider(thickness: 1),
                const SizedBox(height: 10),
                Text(
                  "wikipedia Link",
                  style: TextStyle(
                    fontSize: size.width * .035,
                    fontWeight: FontWeight.bold,
                    fontFamily: "poppins",
                  ),
                ),
                InkWell(
                  onTap: () async {
                    launchUrl(Uri.parse(rocketDetails.wikipedia.toString()));
                  },
                  child: Text(
                    rocketDetails.wikipedia == null
                        ? "--"
                        : "${rocketDetails.wikipedia}",
                    style: TextStyle(
                      color: MyColors.redcolor,
                      fontSize: size.width * .035,
                      fontWeight: FontWeight.bold,
                      fontFamily: "poppins",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
