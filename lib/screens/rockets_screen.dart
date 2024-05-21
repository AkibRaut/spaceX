import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacex/controllers/rockets_controller.dart';
import 'package:spacex/screens/rocket_details_screen.dart';
import 'package:spacex/utils/my_colors.dart';

class RocketsScreen extends StatelessWidget {
  const RocketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final controller = Get.put(RocketsController());
    return Scaffold(
      appBar: AppBar(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Rockets",
                  style: TextStyle(
                    fontSize: size.width * .055,
                    fontWeight: FontWeight.bold,
                    fontFamily: "poppins",
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => controller.isLoading.value
                    ? const CircularProgressIndicator.adaptive()
                    : controller.rocketList.isEmpty
                        ? Text(
                            "Rockets Not Founds !!",
                            style: TextStyle(
                              fontSize: size.width * .055,
                              fontWeight: FontWeight.bold,
                              fontFamily: "poppins",
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: controller.rocketList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => RocketDetailsScreen(
                                        rocketId: controller
                                            .rocketList[index].id
                                            .toString()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: MyColors.darkbluecolor,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: MyColors.blackColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10)),
                                            child: Image.network(controller
                                                    .rocketList[index]
                                                    .flickrImages!
                                                    .first
                                                    .isEmpty
                                                ? "https://farm1.staticflickr.com/293/32312415025_6841e30bf1_b.jpg"
                                                : controller.rocketList[index]
                                                    .flickrImages!.first
                                                    .toString()),
                                          ),
                                          const SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.rocketList[index]
                                                              .name ==
                                                          "null"
                                                      ? ""
                                                      : controller
                                                          .rocketList[index]
                                                          .name
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.width * .05,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "poppins",
                                                      color:
                                                          MyColors.whiteColor),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  "Origin : ${controller.rocketList[index].country == "null" ? "" : controller.rocketList[index].country.toString()}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.width * .037,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: "poppins",
                                                      color:
                                                          MyColors.whiteColor),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  "Engine : ${controller.rocketList[index].stages! == "null" ? "" : controller.rocketList[index].stages.toString()}",
                                                  style: TextStyle(
                                                    fontSize: size.width * .037,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "poppins",
                                                    color: MyColors.whiteColor,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  "company : ${controller.rocketList[index].company! == "null" ? "" : controller.rocketList[index].company.toString()}",
                                                  style: TextStyle(
                                                    fontSize: size.width * .037,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "poppins",
                                                    color: MyColors.whiteColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
