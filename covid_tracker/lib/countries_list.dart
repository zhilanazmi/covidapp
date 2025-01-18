import 'package:covid_tracker/detail_screen.dart';
import 'package:covid_tracker/services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  hintText: 'Search here countries',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[400],
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: statesServices.countriesListApi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [
                              ListTile(
                                title: Container(
                                  height: 10,
                                  width: 90,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  height: 10,
                                  width: 90,
                                  color: Colors.white,
                                ),
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        String name = snapshot.data![index]['country'];
                        //if user cant searh anything
                        if (searchController.text.isEmpty) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailList(
                                    name: snapshot.data![index]['country'],
                                    image: snapshot.data![index]['countryInfo']
                                        ['flag'],
                                    totalCase: snapshot.data![index]['cases'],
                                    todayRecovered: snapshot.data![index]
                                        ['recovered'],
                                    totalDeaths: snapshot.data![index]
                                        ['deaths'],
                                    active: snapshot.data![index]['active'],
                                    test: snapshot.data![index]['tests'],
                                    totalRecovered: snapshot.data![index]
                                        ['todayRecovered'],
                                    critical: snapshot.data![index]['critical'],
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    snapshot.data![index]['country'],
                                  ),
                                  subtitle: Text(
                                    snapshot.data![index]['cases'].toString(),
                                  ),
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(
                                      snapshot.data![index]['countryInfo']
                                          ['flag'],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                          //if user search countries then use elseif cond
                        } else if (name
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailList(
                                      name: snapshot.data![index]['country'],
                                      image: snapshot.data![index]
                                          ['countryInfo']['flag'],
                                      totalCase: snapshot.data![index]['cases'],
                                      todayRecovered: snapshot.data![index]
                                          ['recovered'],
                                      totalDeaths: snapshot.data![index]
                                          ['deaths'],
                                      active: snapshot.data![index]['active'],
                                      test: snapshot.data![index]['tests'],
                                      totalRecovered: snapshot.data![index]
                                          ['todayRecovered'],
                                      critical: snapshot.data![index]
                                          ['critical'],
                                    ),
                                  ));
                            },
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    snapshot.data![index]['country'],
                                  ),
                                  subtitle: Text(
                                    snapshot.data![index]['cases'].toString(),
                                  ),
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(
                                      snapshot.data![index]['countryInfo']
                                          ['flag'],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container(
                              // height: 400,
                              // width: 400,
                              // color: Colors.pink,
                              );
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
