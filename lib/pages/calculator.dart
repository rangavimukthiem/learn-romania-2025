import 'package:flutter/material.dart';
import 'package:learn_romania/constant/colors.dart';
import 'package:learn_romania/constant/utils.dart';
import 'package:learn_romania/widgets/net_salarywidget.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _grossTextC = TextEditingController();

  int? gross;

  @override
  Widget build(BuildContext context) {
    Widget getSalaryWidget() {
      if (_grossTextC.text.isNotEmpty) {
        return NetSalaryWidget(grossSalary: gross);
      } else {
        return const Center(
            child: Text("Enter Gross Salary", style: TextStyle(fontSize: 18)));
      }
    }

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Sallary Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Enter Your \nGross Salarry",
                    style: TextStyle(
                        color: konFontBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Card(
                      color: Colors.white,
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        child: TextField(
                          decoration: const InputDecoration(
                            hintFadeDuration: Duration(seconds: 20),
                            fillColor: Colors.white,
                            labelText: 'Enter Gross Salarry',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          controller: _grossTextC,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 40,
              ),
              // Elevaed BUtton
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 2,
                height: MediaQuery.sizeOf(context).height / 13,
                child: ElevatedButton(
                  iconAlignment: IconAlignment.start,
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 247, 150, 4)),
                    elevation: WidgetStateProperty.all(5),
                  ),
                  onPressed: () {
                    setState(() {
                      gross = int.tryParse(_grossTextC.text);
                    });
                  },
                  child: const Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 40,
              ),
              // GetSalary Widget card
              SizedBox(
                  width: ScreenUtils.getSize(context, 100),
                  // height: MediaQuery.sizeOf(context).height / 2,
                  child: Card(
                    color: const Color.fromARGB(255, 143, 106, 204),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 0),
                          child: getSalaryWidget(),
                        )),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
