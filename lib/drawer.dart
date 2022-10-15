import 'package:flutter/material.dart';
import 'package:untitled/manageaddress.dart';

import 'myorders.dart';
class home_drawer extends StatelessWidget {
  const home_drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child:ListView(
            children:    <Widget>[
              const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),

                  child: Text(
                    'pinto kumar',

                    style: TextStyle(fontSize: 15,color: Colors.white),
                  )

              ),

              Padding(
                  padding:  EdgeInsets.all(24),
                  child: Wrap(
                      runSpacing: 16,
                      children:[
                        ExpansionTile(
                          leading: const Icon(Icons.person),
                          title: const Text(
                            "Edit Account",
                            style: TextStyle(fontSize: 16,color: Colors.black),

                          ),





                          children: [
                            ListTile(

                              title:  const Text('change username'),
                              onTap: () {},
                            ),



                            ListTile(

                              title: const Text('change phone number'),
                              onTap: () {},
                            ),
                            ListTile(

                              title: const Text('change password'),
                              onTap: () {},


                            ),
                          ],
                        ),



                        ListTile(
                          leading: const Icon(Icons.location_city),

                          title:  Text('order history'),
                          onTap: () {Navigator.push(context, MaterialPageRoute(builder:(context) => myorders(),
                          ),
                          );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.location_city),
                          title: const Text('Manage Address'),
                          onTap: () {Navigator.push(context, MaterialPageRoute(builder:(context) => manageaddress(),
                          ),
                            );
                          },
                        ),




                        ListTile(
                          leading: const Icon(Icons.location_city),

                          title: const Text('logout'),
                          onTap: () {},

                        )

                      ]
                  )
              )
            ]
        )
    );
  }
}




