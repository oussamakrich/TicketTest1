import 'package:corail_clone/Pages/Receipt/ReceiptsHeader.dart';
import 'package:flutter/material.dart';

class ReceiptsList extends StatelessWidget {
  ReceiptsList({super.key});

  final Map<String, List<Map<String, String>>> lists = {
    '2024-07-18' : [{'time' : '18/07/2024 - 00:00 GMT' , 'name' : 'zara', 'amount' : '100 Dhs', 'logo': 'assets/images/zara.png'},{'time' : '18/07/2024 - 00:00 GMT' , 'name' : 'zara', 'amount' : '100 Dhs', 'logo': 'assets/images/zara.png'}],
    '2024-07-11' : [{'time' : '11/07/2024 - 00:00 GMT' , 'name' : 'zara', 'amount' : '150 Dhs', 'logo': 'assets/images/zara.png'}],
    '2024-07-13' : [{'time' : '13/07/2024 - 00:00 GMT' , 'name' : 'zara', 'amount' : '1000 Dhs', 'logo': 'assets/images/zara.png'}],
    '2024-07-12' : [{'time' : '12/07/2024 - 00:00 GMT' , 'name' : 'zara', 'amount' : '1000 Dhs', 'logo': 'assets/images/zara.png'}],
    '2024-07-14' : [{'time' : '14/07/2024 - 00:00 GMT' , 'name' : 'zara', 'amount' : '1000 Dhs', 'logo': 'assets/images/zara.png'}],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const ReceitpsHeader(),
            Column(
              children: lists.entries.map((entry) {
                final date = entry.key;
                final list = entry.value;
                return Column(
                  children: [
                    ListTile(
                      title: Text(date, style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height / 55),),
                    ),
                    ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(height: 10),
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = list[index];
                        return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: ListTile(
                              leading : ClipOval(
                               child: Image.asset(item['logo'] ?? '',width: 50,height: 70,fit: BoxFit.contain)
                              ),
                              title: Text(item['name'] ?? ''),
                              subtitle: Row(
                                children: [
                                  Expanded(
                                    child: Text(item['time'] ?? '', overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            trailing: Text(item['amount'] ?? '', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                            ),
                          );
                      },
                      itemCount: list.length,
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}