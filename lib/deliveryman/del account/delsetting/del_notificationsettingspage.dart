import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage ({super.key});
  @override
  _NotificationSettingsPageState createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool enableAll = false;
  bool mobileNotifications = false;
  bool emailNotifications = false;
  bool whatsappNotifications = false;

  void _showSaveConfirmationDialog() {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.green.shade900,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/savechange.png', // Replace with your image asset path
                height: 250, // Increase the height to make the image larger
              ),
              const SizedBox(height: 20),
              const Text(
                'Want To Stay Updated About Offers, Order Status And More?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    enableAll = true;
                  });
                },
                child: const Text(
                  'Yes, Enable Notification',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Not Now',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


  // void _showSaveConfirmationDialog() {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //         backgroundColor: Colors.green.shade900,
  //         child: Padding(
  //           padding: const EdgeInsets.all(20.0),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               const Icon(
  //                 Icons.check_circle,
  //                 color: Colors.white,
  //                 size: 80,
  //               ),
  //               const SizedBox(height: 20),
  //               const Text(
  //                 'Changes Saved Successfully!',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(color: Colors.white, fontSize: 16),
  //               ),
  //               const SizedBox(height: 20),
  //               ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: Colors.orange,
  //                   padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
  //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  //                 ),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: const Text(
  //                   'OK',
  //                   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        elevation: 0,
        title: const Text(
          'Notification Settings',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Enable All',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Switch(
                  value: enableAll,
                  activeColor: Colors.red,
                  onChanged: (value) {
                    setState(() {
                      enableAll = value;
                      if (value) {
                        mobileNotifications = true;
                        emailNotifications = true;
                        whatsappNotifications = true;
                      }
                      
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Notification Preferences',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildNotificationToggle('Mobile', Icons.phone_android, mobileNotifications, (value) {
              setState(() {
                mobileNotifications = value;
                if (!value) enableAll = false;
                
              });
            }),
            _buildNotificationToggle('Email', Icons.email, emailNotifications, (value) {
              setState(() {
                emailNotifications = value;
                if (!value) enableAll = false;
                
              });
            }),
            _buildNotificationToggle('Whatsapp', Icons.call, whatsappNotifications, (value) {
              setState(() {
                whatsappNotifications = value;
                if (!value) enableAll = false;
               
              });
            }),
            Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {
                  _showSaveConfirmationDialog();
                },
                child: const Text(
                  'Save Changes',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationToggle(String title, IconData icon, bool value, ValueChanged<bool> onChanged) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      trailing: Switch(
        value: value,
        activeColor: Colors.red,
        onChanged: onChanged,
      ),
    );
  }
}
