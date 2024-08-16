import 'package:corail_clone/Pages/Receipt/ReceiptsHeader.dart';
import 'package:flutter/material.dart';

class ReceiptsList extends StatelessWidget {
  ReceiptsList({super.key});

  final Map<String, List<Map<String, String>>> lists = {
    '2024-07-18' : [{'time' : '00:00 GMT' , 'name' : 'zara', 'amount' : '100 Dhs', 'logo': 'assets/images/zara.png'}],
    '2024-07-11' : [{'time' : '00:00 GMT' , 'name' : 'zara', 'amount' : '150 Dhs', 'logo': 'assets/images/zara.png'}],
    '2024-07-13' : [{'time' : '00:00 GMT' , 'name' : 'zara', 'amount' : '1000 Dhs', 'logo': 'assets/images/zara.png'}],
    '2024-07-12' : [{'time' : '00:00 GMT' , 'name' : 'zara', 'amount' : '1000 Dhs', 'logo': 'assets/images/zara.png'}],
    '2024-07-14' : [{'time' : '00:00 GMT' , 'name' : 'zara', 'amount' : '1000 Dhs', 'logo': 'assets/images/zara.png'}],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const ReceitpsHeader(),
            Container(
              height: 400,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemCount: lists.length,
                itemBuilder: (context, index) {
                  final date = lists.keys.elementAt(index);
                  final list = lists[date];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = list?[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: ListTile(
                              leading : ClipOval(
                               child: Image.asset(item?['logo'] ?? '',width: 50,height: 70,fit: BoxFit.contain)
                              ),
                              title: Text(item?['name'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold),),
                              subtitle: Row(
                                children: [
                                  Text(date),
                                  const SizedBox(width: 5),
                                  Text(item?['time'] ?? ''),
                                ],
                              ),
                            trailing: Text(item?['amount'] ?? '', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12),),
                            ),
                          );
                        },
                        itemCount: list?.length ?? 0,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}