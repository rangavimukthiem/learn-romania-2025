import 'package:flutter/material.dart';
import 'package:learn_romania/constant/colors.dart';

class NetSalaryWidget extends StatefulWidget {
  final grossSalary;
  const NetSalaryWidget({super.key, this.grossSalary});

  @override
  State<NetSalaryWidget> createState() => _NetSalaryWidgetState();
}

class _NetSalaryWidgetState extends State<NetSalaryWidget> {
  int calculateNetSalary(int grossSalary) {
    const int nonTaxableAmount = 300; // Only applies to certain salaries
    const double pensionRate = 0.25; // CAS 25%
    const double healthRate = 0.10; // CASS 10%
    const double incomeTaxRate = 0.10; // 10% after deductions

    // Ensure non-taxable deduction does not exceed gross salary
    int taxableAmount = (grossSalary > nonTaxableAmount)
        ? grossSalary - nonTaxableAmount
        : grossSalary;

    // Calculate Pension and Health Contributions
    double pension = taxableAmount * pensionRate;
    double health = taxableAmount * healthRate;
    double totalContributions = pension + health;

    // Calculate taxable income after contributions
    double taxableIncome = grossSalary - totalContributions;

    // Calculate income tax (10% of taxable income)
    double incomeTax = taxableIncome * incomeTaxRate;

    // Net Salary Calculation
    double netSalary = grossSalary - totalContributions - incomeTax;

    return netSalary.round();
  }

  double calculateGrossSalary(double netSalary) {
    const double casRate = 0.25; // Pension (CAS) 25%
    const double cassRate = 0.10; // Health (CASS) 10%
    const double taxRate = 0.10; // Income Tax 10%

    // Total deduction rate before tax
    double totalDeductions = casRate + cassRate;

    // Adjusted gross salary calculation formula
    double grossSalary =
        netSalary / (1 - totalDeductions - (taxRate * (1 - totalDeductions)));

    return grossSalary.roundToDouble(); // Return rounded double
  }

  Map<String, double> calculateDeductions(int grossSalary) {
    const int nonTaxableAmount = 300; // Applies to some salaries
    const double pensionRate = 0.25; // Pension (CAS) 25%
    const double healthRate = 0.10; // Health (CASS) 10%
    const double incomeTaxRate = 0.10; // Income Tax 10%

    // Ensure non-taxable deduction does not exceed gross salary
    double applicableNonTaxableAmount =
        (grossSalary > nonTaxableAmount) ? nonTaxableAmount.toDouble() : 0.0;

    // Calculate taxable amount after non-taxable deduction
    double taxableAmount = grossSalary - applicableNonTaxableAmount;

    // Calculate deductions
    double pension = taxableAmount * pensionRate;
    double health = taxableAmount * healthRate;
    double totalContributions = pension + health;
    double taxableIncome = grossSalary - totalContributions;
    double incomeTax = taxableIncome * incomeTaxRate;

    // Return a map with all values
    return {
      "nonTaxableAmount": applicableNonTaxableAmount,
      "pension": pension,
      "health": health,
      "incomeTax": incomeTax,
    };
  }

  int net = 0;
  int gross = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Entered gross salary:  ${widget.grossSalary} RON',
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const SizedBox(
          height: 5,
        ),
        // tax anount card
        Center(
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "NonTaxable Amount :  ${calculateDeductions(widget.grossSalary)["nonTaxableAmount"]} RON",
                        style: const TextStyle(fontSize: 15)),
                    Text(
                        "Pension (CAS) 25% : ${calculateDeductions(widget.grossSalary)["pension"]} RON",
                        style: const TextStyle(fontSize: 15)),
                    Text(
                        "Health Insurance  (CASS) 10% : ${calculateDeductions(widget.grossSalary)["health"]} RON",
                        style: const TextStyle(fontSize: 15)),
                    Text(
                        "Income Tax (10%) : ${calculateDeductions(widget.grossSalary)["incomeTax"]} RON",
                        style: const TextStyle(fontSize: 15)),
                  ]),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // Net salary GrossSalary
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Card(
                color: const Color.fromARGB(255, 64, 226, 255),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Your Net salary is:  ${calculateNetSalary(widget.grossSalary)}',
                    style: const TextStyle(
                        color: konTitleBackground,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Total Deductions : ${widget.grossSalary - calculateNetSalary(widget.grossSalary)} RON',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
