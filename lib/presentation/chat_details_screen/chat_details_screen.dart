import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/services/encryption_helper.dart';
import 'controller/chat_details_controller.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String chatId;
  final String ownerId;
  final Map<String, dynamic> propertyDetails;

  const ChatDetailsScreen({
    Key? key,
    required this.chatId,
    required this.ownerId,
    required this.propertyDetails,
  }) : super(key: key);

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final ChatDetailsController chatDetailsController =
      Get.put(ChatDetailsController());
  String contactName = "Loading...";
  String? otpStatusMessage;
  bool isOwner = false;
  bool isOtpVerified = false; // Track OTP verification status

  @override
  void initState() {
    super.initState();
    fetchContactName();
    checkIfUserIsOwner();
  }

  Future<void> fetchContactName() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.ownerId)
          .get();
      if (doc.exists) {
        String encryptedName = doc['name'] ?? "Unknown";

        // Decrypt the name if it's not "Unknown"
        String decryptedName = encryptedName != "Unknown"
            ? EncryptionHelper.decrypt(encryptedName)
            : "Unknown";

        setState(() {
          contactName = decryptedName;
        });
      }
    } catch (e) {
      print("Error fetching contact name: $e");
    }
  }

  Future<void> checkIfUserIsOwner() async {
    try {
      final propertyId = widget.propertyDetails['propertyId'];
      final propertyDoc = await FirebaseFirestore.instance
          .collection('accommodations')
          .doc(propertyId)
          .get();
      if (propertyDoc.exists) {
        final ownerId = propertyDoc.data()?['user_id'];
        final currentUserId = FirebaseAuth.instance.currentUser?.uid;
        setState(() {
          isOwner = (ownerId == currentUserId);
        });
      }
    } catch (e) {
      print("Error fetching property owner: $e");
    }
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text(contactName),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Get.back(),
      ),
    );
  }

  Widget _buildPropertyDetails() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          if (widget.propertyDetails['imageUrl'] != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.propertyDetails['imageUrl'],
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.propertyDetails['title'] ?? 'Property Title',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(widget.propertyDetails['address'] ?? 'Property Address'),
                Text("\RM${widget.propertyDetails['monthlyRent']}/mo"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtpInputField() {
    TextEditingController otpController = TextEditingController();

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .doc(widget.chatId)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();

        final chatData = snapshot.data?.data() as Map<String, dynamic>? ?? {};

        final bool otpRequested = chatData['otpRequested'] ?? false;
        final DateTime? otpExpiration =
            (chatData['otpExpiration'] as Timestamp?)?.toDate();
        final String otpStatus = chatData['otpStatus'] ?? '';
        final String otpPurpose = chatData['otpPurpose'] ?? 'confirm';

        final bool isExpired =
            otpExpiration != null && DateTime.now().isAfter(otpExpiration);

        // If OTP is successfully verified, display success message only
        if (isOtpVerified) {
          return Card(
            color: Colors.green[100],
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 48),
                  SizedBox(height: 8),
                  Text(
                    "${otpPurpose == 'confirm' ? 'Booking' : 'Cancellation'} Successful!",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
          );
        }

        // Show OTP input form if requested, not expired, and OTP is not yet verified
        if (otpRequested && !isExpired && otpStatus == 'sent') {
          return Column(
            children: [
              Text(
                'OTP for ${otpPurpose == 'confirm' ? 'confirmation' : 'cancellation'} expires in: ${otpExpiration?.difference(DateTime.now()).inMinutes} minutes',
                style: TextStyle(color: Colors.red),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: TextField(
                  controller: otpController,
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(),
                    hintText: "Enter OTP",
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  ),
                  textAlign: TextAlign.center,
                  obscureText: true,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor:
                      Colors.black, // Set text color to black for contrast
                  padding: EdgeInsets.symmetric(
                      vertical: 14, horizontal: 32), // Make the button larger
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8), // Optional: add rounded corners
                  ),
                ),
                onPressed: () async {
                  bool isVerified = await chatDetailsController.verifyOtp(
                    otpController.text.trim(),
                    widget.chatId,
                    widget.propertyDetails['propertyId'],
                    otpPurpose: otpPurpose, // Pass the OTP purpose
                  );
                  setState(() {
                    isOtpVerified = isVerified;
                    otpStatusMessage = isVerified
                        ? "${otpPurpose == 'confirm' ? 'Booking' : 'Cancellation'} verified successfully!"
                        : "Invalid OTP. Try again.";
                  });
                },
                child: Text(
                  "Submit OTP",
                  style:
                      TextStyle(fontSize: 18), // Increase font size if needed
                ),
              ),
              if (otpStatusMessage != null)
                Text(
                  otpStatusMessage!,
                  style: TextStyle(
                    color: otpStatusMessage == "OTP verified successfully!"
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
            ],
          );
        } else if (isExpired && otpRequested) {
          return Text(
            'OTP has expired. Please request a new OTP.',
            style: TextStyle(color: Colors.red),
          );
        }

        return Container();
      },
    );
  }

  Widget _buildOtpStatusTracking() {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .doc(widget.chatId)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();

        final chatData = snapshot.data?.data() as Map<String, dynamic>? ?? {};

        final bool otpRequested = chatData['otpRequested'] ?? false;
        final String otpStatus = chatData['otpStatus'] ?? 'Not Sent';
        final DateTime? otpExpiration =
            (chatData['otpExpiration'] as Timestamp?)?.toDate();

        final bool isExpired =
            otpExpiration != null && DateTime.now().isAfter(otpExpiration);
        final int minutesRemaining = otpExpiration != null
            ? otpExpiration.difference(DateTime.now()).inMinutes
            : 0;

        if (!otpRequested) return Container(); // Hide if OTP not requested

        return Container(
          padding: EdgeInsets.all(16),
          color: Colors.blueAccent.withOpacity(0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "OTP Status: $otpStatus",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: otpStatus == 'sent' ? Colors.green : Colors.red,
                ),
              ),
              if (otpStatus == 'sent' && !isExpired)
                Text(
                  "Waiting for user response...",
                  style: TextStyle(color: Colors.orange),
                ),
              if (otpExpiration != null && !isExpired)
                Text(
                  "Expires in: $minutesRemaining minutes",
                  style: TextStyle(color: Colors.red),
                ),
              if (isExpired)
                Text(
                  "OTP has expired. You may need to send a new one.",
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWriteAReply() {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('accommodations')
          .doc(widget.propertyDetails['propertyId'])
          .get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data?.data() == null) {
          return Container(); // Show nothing if data is missing
        }

        final accommodationData =
            snapshot.data?.data() as Map<String, dynamic>? ?? {};
        final bool isConfirmed = accommodationData['confirmed'] ?? false;

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: chatDetailsController.messageController,
                  decoration: InputDecoration(hintText: 'Write a message...'),
                ),
              ),
              if (isOwner) ...[
                PopupMenuButton<String>(
                  onSelected: (value) async {
                    if (value == 'confirm') {
                      await chatDetailsController.sendOtpToOwner(
                          widget.ownerId, widget.chatId,
                          otpPurpose: 'confirm');
                    } else if (value == 'cancel') {
                      await chatDetailsController.sendOtpToOwner(
                          widget.ownerId, widget.chatId,
                          otpPurpose: 'cancel');
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'confirm',
                      enabled: !isConfirmed, // Disable if already confirmed
                      child: Text(
                        'Send Confirmation OTP',
                        style: TextStyle(
                          color: !isConfirmed ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'cancel',
                      enabled: isConfirmed, // Disable if not confirmed
                      child: Text(
                        'Send Cancellation OTP',
                        style: TextStyle(
                          color: isConfirmed ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                  icon: Icon(Icons.lock),
                ),
              ],
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  final propertyId = widget.propertyDetails['propertyId'] ?? '';
                  chatDetailsController.sendMessage(
                      widget.chatId, widget.ownerId, propertyId);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMessagesList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .doc(widget.chatId)
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text("No messages yet."));
        }
        final messages = snapshot.data!.docs;
        return ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final messageData =
                messages[index].data() as Map<String, dynamic>? ?? {};
            final isCurrentUser = messageData['senderId'] ==
                chatDetailsController.getCurrentUserId();
            return Align(
              alignment:
                  isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: isCurrentUser ? Colors.blue : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  messageData['text'],
                  style: TextStyle(
                      color: isCurrentUser ? Colors.white : Colors.black87),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
          stream: chatDetailsController.chatStream(widget.chatId),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            final chatData =
                snapshot.data?.data() as Map<String, dynamic>? ?? {};

            bool isOtpRequested = chatData['otpRequested'] ?? false;

            return Column(
              children: [
                _buildAppBar(),
                _buildPropertyDetails(),
                if (isOwner)
                  _buildOtpStatusTracking(), // Display status for the owner
                if (!isOwner && isOtpRequested) _buildOtpInputField(),
                Expanded(child: _buildMessagesList()),
                _buildWriteAReply(),
              ],
            );
          },
        ),
      ),
    );
  }
}
