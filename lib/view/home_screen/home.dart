import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futursity/controller/api_services/api.dart';
import 'package:futursity/controller/auth/auth.dart';
import 'package:futursity/model/Categores/model.dart';
import 'package:futursity/model/topcouse_model/model.dart';
import 'package:futursity/utils/colors.dart';
import 'package:futursity/utils/contants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> courses = [];

  @override
  void initState() {
    CourseService().fetchTopCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kwhite,
          elevation: 1.0, // Set elevation to add shadow
          title: const Image(width: 40, image: AssetImage('assets/logooo.png')),

          titleSpacing: 40,
        ),
        body: ListView(scrollDirection: Axis.vertical, children: [
          Column(children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Course',
                    style: TextStyle(
                      color: kblack,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'All Courses >',
                    style: TextStyle(
                      color: kblue,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  // or SizedBox
                  height: 240,
                  width: double.infinity,
                  child: FutureBuilder<List<dynamic>>(
                    future: CourseService().fetchTopCourses(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        List<dynamic> data = snapshot.data!;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> item = data[index];
                            TopCourses course = TopCourses.fromJson(item);
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  course.thumbnail),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          width: 240,
                                          height: 105,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                course.title,
                                                style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 100, 100, 100),
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                course.shortDescription,
                                                style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 100, 100, 100),
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      right: 10,
                                      child: Text(
                                        course.price,
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 100, 100, 100),
                                          fontFamily: 'Montserrat',
                                          fontSize: 11,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                )),
            kheight30,
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' Categores',
                        style: TextStyle(
                          color: kblack,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      kheight10,
                      SizedBox(
                        width: double.infinity,
                        // height: 335,
                        child: Expanded(
                          child: FutureBuilder<List<Categores>>(
                            future: CourseService().fetchCategories(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else {
                                // Define a list of colors
                                List<Color> colors = [
                                  const Color.fromARGB(255, 113, 26, 226),
                                  const Color.fromARGB(255, 249, 74, 62),
                                  const Color.fromARGB(255, 20, 162, 141)
                                ];
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                    //height: 335,
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 15,
                                        mainAxisSpacing: 15,
                                        childAspectRatio: 0.95,
                                      ),
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        final category = snapshot.data![index];
                                        // Get the color for the current index
                                        Color backgroundColor =
                                            colors[index % colors.length];
                                        return GestureDetector(
                                          onTap: () {
                                            // Handle category selection
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: backgroundColor,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 1),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius
                                                            .vertical(
                                                            top:
                                                                Radius.circular(
                                                                    10)),
                                                    child: Image.network(
                                                      category.thumbnail,
                                                      width: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        category.name,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .white, // Text color for better visibility
                                                        ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      Text(
                                                        "${category.numberOfCourses.toString()} Courses",
                                                        style: const TextStyle(
                                                          fontSize: 10,

                                                          color: Colors
                                                              .white, // Text color for better visibility
                                                        ),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ]))
          ])
        ]),
        floatingActionButton: InkWell(
          onTap: () {
            authServices().logout();
          },
          child: const CircleAvatar(
            radius: 30,
            backgroundColor: kgrey,
            child: Icon(
              Icons.filter_list,
              color: kwhite,
              size: 30,
            ),
          ),
        ));
  }
}
