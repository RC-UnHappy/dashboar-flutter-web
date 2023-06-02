import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/screens/components/custom_checkbox.dart';
import 'package:responsive_admin_dashboard/screens/components/custom_input.dart';
import 'dart:html' as html;

class FormCard extends StatefulWidget {
  const FormCard({Key? key}) : super(key: key);

  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Responsive(
        mobile: FormCardView(),
        tablet: FormCardView(),
        desktop: FormCardView(),
      ),
    );
  }
}

class FormCardView extends StatefulWidget {
  FormCardView({Key? key}) : super(key: key);

  @override
  _FormCardViewState createState() => _FormCardViewState();
}

class _FormCardViewState extends State<FormCardView> {
  // El paso en el que se encuentra el formulario
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Header
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.fullscreen_exit_sharp,
                    color: Colors.grey,
                    size: 12,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Icon(
                    Icons.replay_outlined,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                  child: Icon(
                    Icons.minimize,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ],
            ),
          ),

          // Contenido del formulario
          Container(
            height: 600,
            child: Stepper(
              type: StepperType.horizontal,
              currentStep: currentStep,
              onStepCancel: () => currentStep == 0
                  ? null
                  : setState(() {
                      currentStep -= 1;
                    }),
              onStepContinue: () {
                bool isLastStep = (currentStep == getSteps().length - 1);
                if (isLastStep) {
                  // Aquí se programa la lógica del formulario
                } else {
                  setState(() {
                    currentStep += 1;
                  });
                }
              },
              onStepTapped: (step) => setState(() {
                currentStep = step;
              }),
              steps: getSteps(),
              controlsBuilder: ((context, details) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: details.onStepCancel,
                      child: Text('Atrás'),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: details.onStepContinue,
                      child: Text(currentStep == getSteps().length - 1
                          ? 'Finalizar'
                          : 'Siguiente'),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text("General"),
        content: Column(
          children: [
            const CustomInput(
              title: "Categoría",
              inputBorder: OutlineInputBorder(),
            ),
            const CustomInput(
              title: "Nombre",
              hint: "Tornillo",
              inputBorder: OutlineInputBorder(),
            ),
            const CustomInput(
              title: "Descripción",
              maxLines: 5,
              inputBorder: OutlineInputBorder(),
            ),
            const CustomInput(
              hint: "First Name",
              inputBorder: OutlineInputBorder(),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Imagen',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        // color: Colors.blue,
                        onPressed: () {
                          _pickImage(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.file_upload,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Select Image',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CustomInput(
              title: "Modelo",
              hint: "C4 Inch",
              inputBorder: OutlineInputBorder(),
            ),
            const CustomInput(
              title: "Nombre Unidad",
              hint: "Tornillo",
              inputBorder: OutlineInputBorder(),
            ),
            const CustomInput(
              title: "Nombre de unidades",
              hint: "Tornillos",
              inputBorder: OutlineInputBorder(),
            ),
            const CustomCheckbox(
              title: "Disponible",
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text("Precio"),
        content: Column(
          children: [
            const CustomInput(
              title: "Precio",
              inputBorder: OutlineInputBorder(),
            ),
            const CustomCheckbox(
              title: "Excento de impuestos",
            ),
            const CustomInput(
              title: "I.V.A",
              // hint: "Tornillo",
              inputBorder: OutlineInputBorder(),
            ),
            const CustomInput(
              title: "Tipo de Utilidad",
              // hint: "First Name",
              inputBorder: OutlineInputBorder(),
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text("Detalles"),
        content: Column(
          children: const [
            CustomInput(
              hint: "Bio",
              inputBorder: OutlineInputBorder(),
            ),
          ],
        ),
      ),
    ];
  }
}

void _pickImage(BuildContext context) async {
  final html.FileUploadInputElement input = html.FileUploadInputElement();
  input.accept = 'image/*'; // specify accepted file types
  input.click();

  input.onChange.listen((e) {
    final files = input.files;
    if (files != null && files.isNotEmpty) {
      final file = files[0];
      final reader = html.FileReader();

      reader.onLoadEnd.listen((e) {
        final imageData = reader.result as String;
        // TODO: Handle the selected image
      });

      reader.readAsDataUrl(file);
    }
  });

  // Hide the file picker dialog after file selection
  input.remove();
}
