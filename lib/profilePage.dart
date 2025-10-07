import 'package:flutter/material.dart';
import 'package:bdver/homePage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4B6C68),
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF3B5C58),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/200'),
                radius: 50,
              ),
              const SizedBox(height: 20),
              const Text(
                "Jonathan Patterson",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "hello@reallygreatsite.com",
                style: TextStyle(
                  color: Colors.grey.shade200,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade200,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.orange.shade200,
                padding: const EdgeInsets.all(13.0),
                child: const Text(
                  "General Settings",
                  style: TextStyle(
                    color: Color(0xFF3B5C58),
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Settings options
              Card(
                color: const Color(0xFF3B5C58),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: const Icon(Icons.dark_mode, color: Colors.white),
                  title: const Text(
                    "Dark Mode",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onTap: () {
                    // handle dark mode tap
                  },
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: const Color(0xFF3B5C58),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: const Icon(Icons.password,
                      color: Colors.white),
                  title: const Text(
                    "Change Password",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onTap: () {
                    // handle notification settings
                  },
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: const Color(0xFF3B5C58),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: const Icon(Icons.notifications,
                      color: Colors.white),
                  title: const Text(
                    "Notifications",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onTap: () {
                    // handle notification settings
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                color: Colors.orange.shade200,
                padding: const EdgeInsets.all(13.0),
                child: const Text(
                  "Information",
                  style: TextStyle(
                    color: Color(0xFF3B5C58),
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Card(
                color: const Color(0xFF3B5C58),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.phone_android_outlined,color: Colors.white,),
                  title: Text("About App",style: TextStyle(color: Colors.white),),
                  trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                  onTap: (){},
                ),
              ),
              SizedBox(height: 10,),
              Card(
                elevation: 10,
                color: const Color(0xFF3B5C58),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                child: ListTile(
                  leading: Icon(Icons.description_outlined,color: Colors.white,),
                  title: Text("Terms & Conditions",style: TextStyle(color: Colors.white),),
                  trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                elevation: 10,
                color: const Color(0xFF3B5C58),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.privacy_tip,color: Colors.white,),
                  title: Text("Privacy Policy",style: TextStyle(color: Colors.white),),
                  trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                ),
              ),
              SizedBox(height: 10,),
              Card(
                color: const Color(0xFF3B5C58),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading:
                      const Icon(Icons.logout, color: Colors.white),
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onTap: () {
                    // handle logout
                  },
                ),
              ),
              SizedBox(height: 10,),
              Card(
                color: const Color(0xFF3B5C58),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading:
                      const Icon(Icons.share, color: Colors.white),
                  title: const Text(
                    "Share This App",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onTap: () {
                    // handle logout
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
