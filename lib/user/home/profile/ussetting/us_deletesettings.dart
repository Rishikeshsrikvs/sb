import 'package:flutter/material.dart';

class UsDeletesettings extends StatefulWidget {
  const UsDeletesettings({super.key});
  @override
  _UsDeletesettings createState() => _UsDeletesettings();
}

class _UsDeletesettings extends State<UsDeletesettings> {
  bool enableAll = false; // Example variable to manage notification state

  void _showSaveConfirmationDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/deleteaccount.png',
                  // Replace with your image asset path
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Are you sure , want to delete the account',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      enableAll =
                          true; // Update state when enabling notifications
                    });
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'No',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(174, 220, 26, 1),
      appBar: AppBar(
        backgroundColor:const Color.fromRGBO(174, 220, 26, 1),
        elevation: 0,
        title: const Text(
          'Account Settings',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
            const SizedBox(height: 20),
            const Text(
              'Delete Account',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Build your notification toggle switches here, if needed
            // Example:
            // _buildNotificationToggle('Email Notifications', Icons.email, enableAll, (value) {
            //   setState(() {
            //     enableAll = value;
            //   });
            // }),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
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

  Widget _buildNotificationToggle(
      String title, IconData icon, bool value, ValueChanged<bool> onChanged) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      trailing: Switch(
        value: value,
        activeColor: Colors.red,
        onChanged: onChanged,
      ),
    );
  }
}
