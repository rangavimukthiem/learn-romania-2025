// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:learn_romania/widgets/titlee.dart';

class CNPCheckerWidget extends StatelessWidget {
  final TextEditingController cnpController = TextEditingController();

  // Validates the CNP based on structure and control digit
  bool validateCNP(String cnp) {
    if (cnp.length != 13 || !RegExp(r'^\d{13}$').hasMatch(cnp)) {
      return false; // Invalid length or non-numeric characters
    }

    // Compute and compare control digit
    int calculatedControl = _calculateControlDigit(cnp.substring(0, 12));
    int actualControl = int.parse(cnp[12]);

    return calculatedControl == actualControl;
  }

  // Computes the control digit for a CNP
  int _calculateControlDigit(String partialCNP) {
    List<int> weights = [2, 7, 9, 1, 4, 6, 3, 5, 8, 2, 7, 9];
    int sum = 0;

    for (int i = 0; i < partialCNP.length; i++) {
      sum += int.parse(partialCNP[i]) * weights[i];
    }

    int remainder = sum % 11;
    return (remainder == 10) ? 1 : remainder;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CNP Checker"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleWidget(title: "Enter Your CNP 13-digit"),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: cnpController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  labelText: "Enter CNP",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                      backgroundColor: WidgetStateProperty.all(
                          const Color.fromARGB(255, 247, 150, 4)),
                      elevation: MaterialStateProperty.all(5),
                    ),
                    onPressed: () {
                      String cnp = cnpController.text;
                      bool isValid = validateCNP(cnp);

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            alignment: Alignment.center,
                            title: Text(
                              isValid ? "Valid CNP" : "Invalid CNP",
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                                isValid
                                    ? "The given CNP is valid."
                                    : "The given CNP is invalid.",
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("OK",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Validate CNP",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
