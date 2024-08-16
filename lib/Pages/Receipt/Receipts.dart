import 'package:corail_clone/Pages/Receipt/MyAppBar.dart';
import 'package:corail_clone/Pages/Receipt/ReceiptsHeader.dart';
import 'package:corail_clone/Pages/Receipt/RecieptsList.dart';
import 'package:flutter/material.dart';

class Receipts extends StatefulWidget {
  const Receipts({super.key});

  @override
  State<Receipts> createState() => _ReceiptsState();
}

class _ReceiptsState extends State<Receipts> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 35, left: 10, right: 10, bottom: 15),
            decoration: const BoxDecoration(
              color: Color(0xFF036086),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                  const Myappbar(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: _tabController,
                      tabs: const [
                        Tab(text: 'Historiques'),
                        Tab(text: 'Statistiques'),
                      ],
                      // controller: tabController,
                      indicatorColor: Colors.white,
                      labelColor: Colors.grey,
                      unselectedLabelColor: Colors.grey,
                    ),
                  ),
            ],
            ),
      
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TabBarView(
                    controller: _tabController,
                    children: [
                     ReceiptsList(),
                      Container(
                        child: const Center(child: Text('Statistiques'),),
                      ),
                  ]
                ),
            ),
          ),
          
      
        ],
      ),
    );
  }
}