import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spacex/data_provider/data_provider.dart';
import 'package:spacex/models/rocket_details_model.dart';
import 'package:spacex/utils/my_colors.dart';

class RocketDetailsScreen extends ConsumerWidget {
  final String rocketId;
  const RocketDetailsScreen({super.key, required this.rocketId});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(rocketDetailsProviser(rocketId));
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
          ),
        ),
        body: data.when(
          data: (data) {
            RocketDetailsModel rocketDetails = data;
            return SingleChildScrollView(
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
                    rocketDetails.flickrImages == null
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
                                  child: Image.network(
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
                              rocketDetails.height!.feet == null
                                  ? "--"
                                  : "${rocketDetails.height!.feet} Feet",
                              style: TextStyle(
                                fontSize: size.width * .035,
                                fontWeight: FontWeight.bold,
                                fontFamily: "poppins",
                              ),
                            ),
                            Text(
                              rocketDetails.diameter!.feet == null
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
                    Text(
                      rocketDetails.wikipedia == null
                          ? "--"
                          : "${rocketDetails.wikipedia}",
                      style: TextStyle(
                        color: MyColors.greencolor,
                        fontSize: size.width * .035,
                        fontWeight: FontWeight.bold,
                        fontFamily: "poppins",
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) => Text(
            "Details Not Found",
            style: TextStyle(
              color: MyColors.redcolor,
              fontSize: size.width * .035,
              fontWeight: FontWeight.bold,
              fontFamily: "poppins",
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ));
  }
}
