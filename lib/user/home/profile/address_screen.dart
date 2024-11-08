import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _houseNumberController = TextEditingController();
  final TextEditingController _apartmentController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "My Address",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Add Address Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isEditing = true; // Switch to edit mode
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.red),
                minimumSize: const Size(300, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.add, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Add Address',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.black),
                ],
              ),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                "SAVED ADDRESS",
                style: TextStyle(
                    color: Color.fromARGB(137, 0, 0, 0), fontSize: 16),
              ),
            ),
          ),

          // Saved Address Container
          SavedAddressWidget(
            onModify: () {
              setState(() {
                _isEditing = true; // Switch to edit mode when modifying
              });
            },
            onDelete: () {
              // Handle delete action here
              // You can show a confirmation dialog before deleting
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Delete Address"),
                  content: const Text(
                      "Are you sure you want to delete this address?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Dismiss the dialog
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        // Perform the deletion
                        Navigator.pop(context); // Dismiss the dialog
                        // Optionally, you can handle the state update after deletion
                      },
                      child: const Text("Delete"),
                    ),
                  ],
                ),
              );
            },
          ),

          // Editing Address Form
          if (_isEditing) ...[
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "MODIFY ADDRESS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("ADDRESS"),
                    TextField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                          labelText: 'Street Name, City, State, Country'),
                    ),
                    TextField(
                      controller: _houseNumberController,
                      decoration: const InputDecoration(
                          labelText: 'House / Flat / Block No.'),
                    ),
                    TextField(
                      controller: _apartmentController,
                      decoration: const InputDecoration(
                          labelText: 'Apartment / Road / Area (Optional)'),
                    ),
                    TextField(
                      controller: _stateController,
                      decoration: const InputDecoration(
                          labelText: 'State, Country (Optional)'),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Save the new address and switch back to view mode
                          setState(() {
                            _isEditing = false;
                            // Handle saving of the address data here
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'SAVE AND PROCEED',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class SavedAddressWidget extends StatelessWidget {
  final VoidCallback onModify;
  final VoidCallback onDelete;

  const SavedAddressWidget(
      {super.key, required this.onModify, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "HOME",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'Modify') {
                        onModify(); // Call the onModify callback
                      } else if (value == 'Delete') {
                        onDelete(); // Call the onDelete callback
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return {'Modify', 'Delete'}.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                    icon: const Icon(Icons.more_vert, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "Door No 12 - 17, Street Name, City, Pincode",
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
