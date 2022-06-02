import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lzycrazy/screens/widgets/circle_profile_pic.dart';
import 'package:lzycrazy/utils/size_config.dart';
import 'package:lzycrazy/controllers/user_controller.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.height * 100,
        width: SizeConfig.width * 100,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Text('EditProfile',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CircleProfilePic(
                "https://picsum.photos/200/300?random=48",
                size: 70,
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Change Profile Photo',
                  style: TextStyle(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _editTile(
                title: "Name",
                controller: TextEditingController(
                  text: "${user!.value.user['name']}",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _editTile(
                title: "Username",
                controller: TextEditingController(
                  text: "${user!.value.user['name']}",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _editTile(
                title: "Website",
                controller: TextEditingController(
                  text: "www.pixitute.com",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _editTile(
                title: "Bio",
                controller: TextEditingController(
                  text:
                      "Digital goodies designer @pixitute\nEverything is designed",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                height: 16,
                thickness: 2,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                  width: SizeConfig.width * 100,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: const Text('Private Information',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600))),
              _editTile(
                title: "Email",
                controller: TextEditingController(
                  text:
                  "${user!.value.user['email']}",
                ),
              ),
              const SizedBox(
                height: 16,
              ), _editTile(
                title: "Gander",
                controller: TextEditingController(
                  text:
                  "${user!.value.user['gender']}",
                ),
              ),
              const SizedBox(
                height: 16,
              ), _editTile(
                title: "Phone",
                controller: TextEditingController(
                  text:
                  "+91-902-482-9700",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _editTile(
      {required String title, required TextEditingController controller}) {
    return ListTile(
      leading: Container(
        width: 120,
        child: Text(
          title,
          maxLines: 2,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      title: TextField(
        controller: controller,
        maxLines: 2,
      ),
    );
  }
}
