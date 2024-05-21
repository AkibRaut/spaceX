import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacex/controllers/rocket_details_controller.dart';
import 'package:spacex/utils/my_colors.dart';

class RocketDetailsScreen extends StatelessWidget {
  final String rocketId;
  const RocketDetailsScreen({super.key, required this.rocketId});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final controller = Get.put(RocketsDetailsController(id: rocketId));
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
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator.adaptive())
              : controller.rocketDetails.value == null
                  ? Center(
                      child: Text(
                      "Oops..No Details Found !!",
                      style: TextStyle(
                          fontSize: size.width * .045,
                          fontWeight: FontWeight.w600,
                          fontFamily: "poppins",
                          color: MyColors.whiteColor),
                    ))
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.rocketDetails.value!.name == "null"
                                  ? "--"
                                  : controller.rocketDetails.value!.name
                                      .toString(),
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
                            controller.rocketDetails.value!.flickrImages == null
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
                                      itemCount: controller.rocketDetails.value!
                                          .flickrImages!.length,
                                      itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      MyColors.darkbluecolor)),
                                          width: size.width * .7,
                                          child: Image.network(
                                            controller.rocketDetails.value!
                                                .flickrImages![index]
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
                                      controller.rocketDetails.value!.active ==
                                              null
                                          ? "--"
                                          : controller.rocketDetails.value!
                                                      .active
                                                      .toString() ==
                                                  "true"
                                              ? "Active"
                                              : "Inactive",
                                      style: TextStyle(
                                        fontSize: size.width * .035,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "poppins",
                                      ),
                                    ),
                                    Text(
                                      controller.rocketDetails.value!
                                                  .costPerLaunch ==
                                              null
                                          ? "--"
                                          : "${controller.rocketDetails.value!.costPerLaunch}\$",
                                      style: TextStyle(
                                        fontSize: size.width * .035,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "poppins",
                                      ),
                                    ),
                                    Text(
                                      controller.rocketDetails.value!
                                                  .successRatePct ==
                                              null
                                          ? "--"
                                          : "${controller.rocketDetails.value!.successRatePct}%",
                                      style: TextStyle(
                                        fontSize: size.width * .035,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "poppins",
                                      ),
                                    ),
                                    Text(
                                      controller.rocketDetails.value!
                                                  .boosters ==
                                              null
                                          ? "--"
                                          : "${controller.rocketDetails.value!.boosters}",
                                      style: TextStyle(
                                        fontSize: size.width * .035,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "poppins",
                                      ),
                                    ),
                                    Text(
                                      controller.rocketDetails.value!.height!
                                                  .feet ==
                                              null
                                          ? "--"
                                          : "${controller.rocketDetails.value!.height!.feet} Feet",
                                      style: TextStyle(
                                        fontSize: size.width * .035,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "poppins",
                                      ),
                                    ),
                                    Text(
                                      controller.rocketDetails.value!.diameter!
                                                  .feet ==
                                              null
                                          ? "--"
                                          : "${controller.rocketDetails.value!.diameter!.feet} Feet",
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
                              controller.rocketDetails.value!.description ==
                                      null
                                  ? "--"
                                  : "${controller.rocketDetails.value!.description}",
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
                              controller.rocketDetails.value!.wikipedia == null
                                  ? "--"
                                  : "${controller.rocketDetails.value!.wikipedia}",
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
                    ),
        ),
      ),
    );
  }
}
