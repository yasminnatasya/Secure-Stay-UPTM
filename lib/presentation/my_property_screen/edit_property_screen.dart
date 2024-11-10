import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uptm_secure_stay/presentation/my_property_screen/models/bedroomlist_item_model.dart';

class EditPropertyScreen extends StatefulWidget {
  final BedroomlistItemModel property;

  EditPropertyScreen({Key? key, required this.property}) : super(key: key);

  @override
  _EditPropertyScreenState createState() => _EditPropertyScreenState();
}

class _EditPropertyScreenState extends State<EditPropertyScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for each field to populate and edit values
  late TextEditingController titleController;
  late TextEditingController addressController;
  late TextEditingController bedsController;
  late TextEditingController bathsController;
  late TextEditingController monthlyRentController;
  late TextEditingController descriptionController;
  late TextEditingController depositController;
  late TextEditingController availableDateController;
  late TextEditingController minimumStayController;
  late TextEditingController sqftController;

  // Booleans for checkbox fields
  bool airCondition = false;
  bool elevator = false;
  bool furniture = false;
  bool generator = false;
  bool wifi = false;
  bool students = false;
  bool male = false;
  bool nonsmoker = false;
  bool petLover = false;
  bool vegetarian = false;
  bool isAvailable = true;

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  String? _imageUrl;

  @override
  void initState() {
    super.initState();

    // Initialize controllers with existing data
    titleController = TextEditingController(text: widget.property.title);
    addressController = TextEditingController(text: widget.property.address);
    bedsController =
        TextEditingController(text: widget.property.beds.toString());
    bathsController =
        TextEditingController(text: widget.property.baths.toString());
    monthlyRentController =
        TextEditingController(text: widget.property.monthlyRent.toString());
    descriptionController =
        TextEditingController(text: widget.property.description);
    depositController =
        TextEditingController(text: widget.property.deposit.toString());
    availableDateController =
        TextEditingController(text: widget.property.availableDate);
    minimumStayController =
        TextEditingController(text: widget.property.minimumStay);
    sqftController =
        TextEditingController(text: widget.property.sqft.toString());

    // Initialize boolean fields
    airCondition = widget.property.airCondition;
    elevator = widget.property.elevator;
    furniture = widget.property.furniture;
    generator = widget.property.generator;
    wifi = widget.property.wifi;
    students = widget.property.students;
    male = widget.property.male;
    nonsmoker = widget.property.nonsmoker;
    petLover = widget.property.petLover;
    vegetarian = widget.property.vegetarian;
    isAvailable = widget.property.isAvailable;
    _imageUrl = widget.property.imageUrl;
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) return;

    final fileName =
        'accommodations/${widget.property.id}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    final ref = FirebaseStorage.instance.ref().child(fileName);
    final uploadTask = ref.putFile(_imageFile!);

    final snapshot = await uploadTask;
    _imageUrl = await snapshot.ref.getDownloadURL();
  }

  void _updateProperty() async {
    if (_formKey.currentState!.validate()) {
      // Upload image if a new one is selected
      if (_imageFile != null) {
        await _uploadImage();
      }

      // Update Firestore document with new values
      FirebaseFirestore.instance
          .collection('accommodations')
          .doc(widget.property.id)
          .update({
        'title': titleController.text,
        'address': addressController.text,
        'beds': int.parse(bedsController.text),
        'baths': int.parse(bathsController.text),
        'monthly_rent': int.parse(monthlyRentController.text),
        'description': descriptionController.text,
        'deposit': int.parse(depositController.text),
        'available_date': availableDateController.text,
        'minimum_stay': minimumStayController.text,
        'sqft': int.parse(sqftController.text),
        'air_condition': airCondition,
        'elevator': elevator,
        'furniture': furniture,
        'generator': generator,
        'wifi': wifi,
        'students': students,
        'male': male,
        'nonsmoker': nonsmoker,
        'pet_lover': petLover,
        'vegetarian': vegetarian,
        'is_available': isAvailable,
        'image_url': _imageUrl,
      }).then((_) {
        // Navigate back after saving
        Navigator.of(context).pop(true);
      });
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    addressController.dispose();
    bedsController.dispose();
    bathsController.dispose();
    monthlyRentController.dispose();
    descriptionController.dispose();
    depositController.dispose();
    availableDateController.dispose();
    minimumStayController.dispose();
    sqftController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Property'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Image Picker with Edit Icon
              GestureDetector(
                onTap: _pickImage,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _imageFile == null && _imageUrl == null
                        ? Container(
                            height: 150,
                            color: Colors.grey[300],
                            child: Icon(Icons.add_a_photo, size: 50),
                          )
                        : _imageFile != null
                            ? Image.file(_imageFile!,
                                height: 150, fit: BoxFit.cover)
                            : Image.network(_imageUrl!,
                                height: 150, fit: BoxFit.cover),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: Icon(Icons.edit, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Title
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a title'
                    : null,
              ),
              // Address
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter an address'
                    : null,
              ),
              // Beds
              TextFormField(
                controller: bedsController,
                decoration: InputDecoration(labelText: 'Beds'),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter the number of beds'
                    : null,
              ),
              // Baths
              TextFormField(
                controller: bathsController,
                decoration: InputDecoration(labelText: 'Baths'),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter the number of baths'
                    : null,
              ),
              // Monthly Rent
              TextFormField(
                controller: monthlyRentController,
                decoration: InputDecoration(labelText: 'Monthly Rent'),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter the monthly rent'
                    : null,
              ),
              // Deposit
              TextFormField(
                controller: depositController,
                decoration: InputDecoration(labelText: 'Deposit'),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter the deposit amount'
                    : null,
              ),
              // Description
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a description'
                    : null,
              ),
              // Available Date
              // Available Date
              TextFormField(
                controller: availableDateController,
                readOnly: true,
                decoration:
                    InputDecoration(labelText: 'Available Date (DD/MM/YYYY)'),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      availableDateController.text =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    });
                  }
                },
              ),
              // Minimum Stay
              TextFormField(
                controller: minimumStayController,
                decoration: InputDecoration(labelText: 'Minimum Stay'),
              ),
              // SQFT
              TextFormField(
                controller: sqftController,
                decoration: InputDecoration(labelText: 'Square Footage (SQFT)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),

              // Availability Checkbox
              CheckboxListTile(
                title: Text("Is this property available?"),
                value: isAvailable,
                onChanged: (value) {
                  setState(() {
                    isAvailable = value ?? true;
                  });
                },
              ),

              // Checkbox fields for amenities and preferences

// Home Amenities Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Home Amenities",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),

              _buildCheckbox("Air Conditioning", airCondition,
                  (value) => setState(() => airCondition = value ?? false)),
              _buildCheckbox("Elevator", elevator,
                  (value) => setState(() => elevator = value ?? false)),
              _buildCheckbox("Furniture", furniture,
                  (value) => setState(() => furniture = value ?? false)),
              _buildCheckbox("Generator", generator,
                  (value) => setState(() => generator = value ?? false)),
              _buildCheckbox("Wi-Fi", wifi,
                  (value) => setState(() => wifi = value ?? false)),

              SizedBox(height: 16),

// Suitable for Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Suitable For",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),

              _buildCheckbox("Students Allowed", students,
                  (value) => setState(() => students = value ?? false)),
              _buildCheckbox("Male", male,
                  (value) => setState(() => male = value ?? false)),
              _buildCheckbox("Non-Smoker", nonsmoker,
                  (value) => setState(() => nonsmoker = value ?? false)),
              _buildCheckbox("Pet Lover", petLover,
                  (value) => setState(() => petLover = value ?? false)),
              _buildCheckbox("Vegetarian", vegetarian,
                  (value) => setState(() => vegetarian = value ?? false)),

              // Save button
              // Save button
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateProperty,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Ensures full width
                ),
                child: Text(
                  'Save Changes',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(
      String title, bool value, ValueChanged<bool?> onChanged) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
