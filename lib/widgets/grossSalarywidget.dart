import 'package:flutter/material.dart';

class GrossSalaryWidget extends StatefulWidget {
  final netSalary;
  const GrossSalaryWidget({super.key, this.netSalary});

  @override
  State<GrossSalaryWidget> createState() => _GrossSalaryWidgetState();
}

class _GrossSalaryWidgetState extends State<GrossSalaryWidget> {
  int calculateGrossSalary(int forGross) {
    const double casRate = 0.25; // Pension (CAS) 25%
    const double cassRate = 0.10; // Health (CASS) 10%
    const double taxRate = 0.10; // Income Tax 10%

    // Total deduction rate before tax
    double totalDeductions = casRate + cassRate;

    // Gross salary formula (solving for G in net formula)
    double grossSalary =
        forGross / (1 - totalDeductions - (taxRate * (1 - totalDeductions)));

    return grossSalary.round();
  }

  Map<String, double> calculateDeductions(int foDdeduct) {
    const int nonTaxableAmount = 300; // Applies to some salaries
    const double pensionRate = 0.25; // Pension (CAS) 25%
    const double healthRate = 0.10; // Health (CASS) 10%
    const double incomeTaxRate = 0.10; // Income Tax 10%

    // Ensure non-taxable deduction does not exceed gross salary
    double applicableNonTaxableAmount =
        (foDdeduct > nonTaxableAmount) ? nonTaxableAmount.toDouble() : 0.0;

    // Calculate taxable amount after non-taxable deduction
    double taxableAmount = foDdeduct - applicableNonTaxableAmount;

    // Calculate deductions
    double pension = taxableAmount * pensionRate;
    double health = taxableAmount * healthRate;
    double totalContributions = pension + health;
    double taxableIncome = foDdeduct - totalContributions;
    double incomeTax = taxableIncome * incomeTaxRate;

    // Return a map with all values
    return {
      "nonTaxableAmount": applicableNonTaxableAmount.roundToDouble(),
      "pension": pension.roundToDouble(),
      "health": health.roundToDouble(),
      "incomeTax": incomeTax.roundToDouble(),
    };
  }

  @override
  Widget build(BuildContext context) {
    int calculatedGross = calculateGrossSalary(widget.netSalary);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Entered Net salary is: ${widget.netSalary}',
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
        Text(
          'Your Gross salary is: $calculatedGross ',
          style: const TextStyle(
              color: Color.fromARGB(255, 27, 2, 250),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        Center(
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "NonTaxable Amount :  ${calculateDeductions(calculatedGross)["nonTaxableAmount"]}"),
                    Text(
                        "Pension (CAS) 25% : ${calculateDeductions(calculatedGross)['pension']}"),
                    Text(
                        "Health Insurance  (CASS) 10% : ${calculateDeductions(calculatedGross)["health"]}"),
                    Text(
                        "Income Tax (10%) : ${calculateDeductions(calculatedGross)["incomeTax"]}"),
                  ]),
            ),
          ),
        ),
        Text(
          'Total deductions: ${calculatedGross - widget.netSalary}',
          style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ],
    );
  }
}
