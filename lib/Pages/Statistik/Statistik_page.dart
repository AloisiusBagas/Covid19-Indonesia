import 'package:covid19app/Provider/IndonesiaProvider.dart';
import 'package:covid19app/contstant/ColorTemplate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Component/Dashboard/Myappbar.dart';
import 'Component/Dashboard/MyflexibleAppBar.dart';
import 'Component/Grafik/Grafik_Placeholder.dart';
import 'Component/Grafik/Grafik_Structure.dart';

class StatistikPage extends StatefulWidget {
  const StatistikPage();
  @override
  _StatistikPageState createState() => _StatistikPageState();
}

class _StatistikPageState extends State<StatistikPage> {
  @override
  Widget build(BuildContext context) {
    final _dataindonesia = Provider.of<IndonesiaProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                    bool innerBoxIsScrolled) =>
                <Widget>[
                  SliverAppBar(
                    title: MyAppBar(),
                    pinned: true,
                    expandedHeight: MediaQuery.of(context).size.height / 1.7,
                    backgroundColor: darkpurple,
                    flexibleSpace: FlexibleSpaceBar(
                      background: MyFlexiableAppBar(),
                    ),
                  ),
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      toolbarHeight: 60,
                      title: Container(
                        child: Text(
                          "Grafik Data COVID 19",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ),
                      pinned: true,
                      floating: false,
                      backgroundColor: Colors.grey[50],
                    ),
                  ),
                ],
            body: Builder(builder: (BuildContext context) {
              return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context)),
                  SliverToBoxAdapter(
                    child: FutureBuilder(
                      future: _dataindonesia.getdataIndonesia(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData == false ||
                            snapshot.hasError == true) {
                          return GrafikPlaceholder();
                        }
                        return GrafikStructure(dataIndonesia: snapshot.data);
                      },
                    ),
                  ),
                ],
              );
            })),
      ),
    );
  }
}
