import 'package:flutter/material.dart';
import 'package:ss_e_commerce/Pages/detailviewpage.dart';
import 'package:ss_e_commerce/widgets/Bestsellingproductwidget.dart';

class Listbestseling extends StatefulWidget {
  const Listbestseling({super.key});

  @override
  State<Listbestseling> createState() => _GriditemsState();
}

class _GriditemsState extends State<Listbestseling> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ListData.listdata.length,
            itemBuilder: (context, index) {
              final griddata = ListData.listdata[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detailviewpage(
                                Name: griddata.name,
                                Price: griddata.Price,
                                description: griddata.description,
                                Image: griddata.image,
                                Organization: "Product By - Uncle Grocery",
                              )));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          griddata.image,
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.25,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          griddata.name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF475269)),
                        ),
                      ),
                      Text(
                        griddata.Price,
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
