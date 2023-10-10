import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'drawer.dart';
import 'model/tip.dart';
import 'tip_worker.dart';

class TipsPendingPage extends StatefulWidget {
  const TipsPendingPage({Key? key}) : super(key: key);

  @override
  State<TipsPendingPage> createState() => _TipsPendingPageState();
}

class _TipsPendingPageState extends State<TipsPendingPage> {
  List<Tip> tips = <Tip>[
    Tip(
        workerName: 'Nedra Kharbeche',
        tipAmount: 5,
        imageUrl:
            'https://pbs.twimg.com/profile_images/1420125322545143808/FORGeaRH_400x400.jpg',
        dateCreated: '10/01/2023 at 09:01'),
    Tip(
        workerName: 'Anis Zehani',
        tipAmount: 2,
        imageUrl:
            'https://pbs.twimg.com/profile_images/1630389794806157313/AFcZmyjf_400x400.jpg',
        dateCreated: '10/02/2023 at 10:15'),
    Tip(
        workerName: 'Barack Obama',
        tipAmount: 4,
        imageUrl:
            'https://pbs.twimg.com/profile_images/1329647526807543809/2SGvnHYV_400x400.jpg',
        dateCreated: '10/05/2023 at 07:33'),
    Tip(
        workerName: 'Albert Einstein',
        tipAmount: 7,
        imageUrl:
            'https://pbs.twimg.com/profile_images/879355674957926400/VSGZHGib_400x400.jpg',
        dateCreated: '10/07/2023 at 19:24'),
    Tip(
        workerName: 'Nikola Tesla',
        tipAmount: 10,
        imageUrl:
            'https://pbs.twimg.com/profile_images/694905181012512769/ZGsarLM-_400x400.jpg',
        dateCreated: '10/08/2023 at 21:47'),
    Tip(
        workerName: 'Steve Jobs',
        tipAmount: 10,
        imageUrl:
            'https://pbs.twimg.com/profile_images/1155917668697985025/w4N0eB1E_400x400.jpg',
        dateCreated: '10/08/2023 at 21:47'),
    Tip(
        workerName: 'Michael Seibel',
        tipAmount: 10,
        imageUrl:
            'https://pbs.twimg.com/profile_images/540367571988389888/I0PmoBNB_400x400.jpeg',
        dateCreated: '10/08/2023 at 21:47'),
    Tip(
        workerName: 'Dalton Caldwell',
        tipAmount: 10,
        imageUrl:
            'https://pbs.twimg.com/profile_images/1500575481153810432/PnWU1XYK_400x400.jpg',
        dateCreated: '10/08/2023 at 21:47'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 35, 75, 121)),
      ),
      home: Scaffold(
          appBar: AppBarPage(title: 'Pending tips'),
          drawer: const DrawerPage(),
          body: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: tips.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(tips[index].imageUrl),
                      ),
                      title: Text(
                        tips[index].workerName,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 10, 10, 10),
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                      subtitle: Text('${tips[index].dateCreated} (pending)'),
                      trailing: IconButton(
                        iconSize: 40,
                        icon: const Icon(Icons.arrow_circle_right_outlined),
                        color: const Color.fromARGB(255, 39, 89, 131),
                        highlightColor: const Color.fromARGB(255, 39, 89, 131),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TipWorkerPage(
                                  qrCode: '',
                                  workerName: tips[index].workerName,
                                  imageUrl: tips[index].imageUrl),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
