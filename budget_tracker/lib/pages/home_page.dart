import 'package:budget_tracker/TransactionCard.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class home_page extends StatelessWidget {
  const home_page({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: screenSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CircularPercentIndicator(
                  radius: screenSize.width / 2,
                  lineWidth: 10.0, // how thick the line is
                  percent: .5, // percent goes from 0 -> 1
                  backgroundColor: Colors.white,
                  center: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "\$0",
                        style: TextStyle(
                            fontSize: 48, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Balance",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  progressColor: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Items",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const TransactionCard(
                amount: 105.99,
                text: "Apple Watch",
                isExpense: true,
              ),
              const TransactionCard(
                amount: 800,
                text: "Apple iPhone",
                isExpense: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
