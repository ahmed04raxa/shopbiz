import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/services/firestore_service.dart';
import '../../../services/auth_services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthServices _authServices = AuthServices();
  String name = "";
  String email = "";
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      QuerySnapshot snapshot = await FirestoreService().getUserByEmail(
        user.email!,
      );

      setState(() {
        name = snapshot.docs[0]['username'];
        email = snapshot.docs[0]['email'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "PROFILE",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 30),

                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/boy.jpg'),
                  ),
                ),
                SizedBox(height: 40),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: ListView(
                      children: [
                        _buildInfoTile(Icons.person_outline, "Name", name),
                        _buildInfoTile(Icons.email_outlined, "Email", email),
                        SizedBox(height: 10),
                        _buildActionTile(
                          Icons.logout,
                          "LogOut",
                          Colors.indigo,
                          () async {
                            await _authServices.signOut();
                            Navigator.pushReplacementNamed(
                              context,
                              "/loginScreen",
                            );
                          },
                        ),
                        _buildActionTile(
                          Icons.delete_outline,
                          "Delete Account",
                          Colors.red,
                          () async {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Delete Account"),
                                content: Text(
                                  "Are you sure you want to delete your account?",
                                  style: TextStyle(color: Colors.red),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      User? user =
                                          FirebaseAuth.instance.currentUser;
                                      if (user != null) {
                                        await FirestoreService().deleteUserData(
                                          user.email!,
                                        );
                                        await _authServices.deleteUser();
                                        Navigator.pushReplacementNamed(
                                          context,
                                          "/loginScreen",
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.grey, fontSize: 14)),
              Text(
                value,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile(
    IconData icon,
    String title,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
