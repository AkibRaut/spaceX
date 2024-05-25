import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spacex/data_provider/data_provider.dart';
import 'package:spacex/models/rocket_model.dart';
import 'package:spacex/screens/rocket_details_screen.dart';
import 'package:spacex/services/database_handler.dart';
import 'package:spacex/utils/my_colors.dart';

class RocketsScreen extends ConsumerWidget {
  const RocketsScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(rocketDataProvier);
    final size = MediaQuery.sizeOf(context);
    final internet = ref.watch(internetProvider);
    DBHandeler dbHandeler = DBHandeler();
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
        body: data.when(
          data: (data) {
            List<RocketModel> rocketList = data.map((e) => e).toList();
            if (internet.value == true) {
              for (int i = 0; i < rocketList.length; i++) {
                dbHandeler.insertData(rocketList[i]);
              }
            }

            return Padding(
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
                  Expanded(
                      child: ListView.builder(
                          itemCount: rocketList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RocketDetailsScreen(
                                                  isOnline: internet.value!,
                                                  rocketDetails:
                                                      rocketList[index],
                                                )));
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
                                            child: internet.asData!.value ==
                                                    false
                                                ? rocketList[index]
                                                            .flickrImages2 ==
                                                        null
                                                    ? Text(
                                                        "Image Not Found",
                                                        style: TextStyle(
                                                          fontSize:
                                                              size.width * .037,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: "poppins",
                                                        ),
                                                      )
                                                    : Image.memory(base64Decode(
                                                        rocketList[index]
                                                            .flickrImages2![
                                                                index]
                                                            .toString()))
                                                : Image.network(rocketList[
                                                            index]
                                                        .flickrImages!
                                                        .first
                                                        .isEmpty
                                                    ? "https://farm1.staticflickr.com/293/32312415025_6841e30bf1_b.jpg"
                                                    : rocketList[index]
                                                        .flickrImages!
                                                        .first
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
                                                  rocketList[index].name ==
                                                          "null"
                                                      ? ""
                                                      : rocketList[index]
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
                                                  "Origin : ${rocketList[index].country == "null" ? "" : rocketList[index].country.toString()}",
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
                                                  "Engine : ${rocketList[index].stages! == "null" ? "" : rocketList[index].stages.toString()}",
                                                  style: TextStyle(
                                                    fontSize: size.width * .037,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "poppins",
                                                    color: MyColors.whiteColor,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  "company : ${rocketList[index].company! == "null" ? "" : rocketList[index].company.toString()}",
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
                              )))
                ],
              ),
            );
          },
          error: (error, stackTrace) => Text(
            "Rockets Not Found",
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
