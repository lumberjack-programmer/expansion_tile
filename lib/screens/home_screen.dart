
import 'package:flutter/material.dart';
import 'package:format/format.dart';
import '../widgets/custom_imput_field.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _customTileExpanded = false;
  bool isEdit = false;
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;

  String name = '';
  String surname = '';
  String phone = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
  }


  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    surnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var info = Container(
      height: 160.0,
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              CustomFieldToBeDisplayed(label: 'Name', value:  name,),
              SizedBox(
                width: 18.0,
              ),
              CustomFieldToBeDisplayed(label: 'Surname', value: surname,),

            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            children: [
              CustomFieldToBeDisplayed(label: 'Phone', value: phone),
              SizedBox(
                width: 18.0,
              ),
              CustomFieldToBeDisplayed(label: 'Email', value: email,),

            ],
          ),

        ],
      ),
    );


    var editInfo = Container(
      height: 160.0,
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomInput(
                  hint: "Name",
                  textEditingController: nameController,
                ),
              ),
              SizedBox(
                width: 18.0,
              ),
              Expanded(
                child: CustomInput(
                  hint: "Surname",
                  textEditingController: surnameController,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomInput(
                  maxLength: 15,
                  hint: "Phone",
                  textEditingController: phoneController,
                ),
              ),
              SizedBox(
                width: 18.0,
              ),
              Expanded(
                child: CustomInput(
                  hint: "Email",
                  textEditingController: emailController,
                ),
              ),
            ],
          ),
        ],
      ),
    );



    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: Image.network('https://media.istockphoto.com/photos/young-beautiful-woman-picture-id1294339577?k=20&m=1294339577&s=612x612&w=0&h=z6Uz4Uzue0OhwT-SJdlZRp7UsXFDJunGsJ3sqSlPdC8=',
            fit: BoxFit.fitHeight, alignment: Alignment.center)),
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                  margin: EdgeInsets.only(left: 5.0),
                    child: Text(
                      '$name $surname',
                      style: TextStyle(
                          color: Color(0xff0e274a), fontWeight: FontWeight.w700),
                    ),

                  ),
                  Container(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                              isEdit = !isEdit;
                              setState(() {
                                name = nameController.text;
                                surname = surnameController.text;
                                phone = phoneController.text;
                                email = emailController.text;
                            });
                          },
                          child: isEdit == false ? Icon(Icons.edit, color: Color(0xff0e274a),) :  Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 7.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff0e274a),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              'Save',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.phone,
                          color: Color(0xff0e274a),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.email,
                          color: Color(0xff0e274a),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              children: [
                isEdit == false ? info : editInfo,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFieldToBeDisplayed extends StatelessWidget {
  final String label;
  final String value;


  CustomFieldToBeDisplayed({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(padding: EdgeInsets.only(left: 10.0,), child: Text(label, style: TextStyle(fontSize: 13.0),)),
            SizedBox(height: 14.0,),
            Container(padding: EdgeInsets.only(left: 10.0,), child: Text(value, style: TextStyle(fontSize: 16.0,),)),
          ],
        ),
      ),
    );
  }
}
