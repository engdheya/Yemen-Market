import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isArabic = false;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF1B5E20);
    final secondaryColor = const Color(0xFF2E7D32);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text(
          _isArabic ? 'الحساب الشخصي' : 'Developer Profile',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: () {
              setState(() {
                _isArabic = !_isArabic;
              });
            },
            icon: const Icon(Icons.language, color: Colors.white, size: 18),
            label: Text(
              _isArabic ? 'English' : 'العربية',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Header Header Stack with Gradient
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 10, 24, 32),
                child: Column(
                  children: [
                    // Clean Local Avatar Badge
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 52,
                        backgroundColor: const Color(0xFFE8F5E9),
                        child: CircleAvatar(
                          radius: 48,
                          backgroundColor: primaryColor,
                          child: const Text(
                            'DA',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Dhyaa Mohammed Abbas',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Software Engineer',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Profile Information Cards
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 8,
                    ),
                    child: Text(
                      _isArabic ? 'معلومات الحساب' : 'Account Overview',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212121),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  _profileCard(
                    icon: Icons.person_outline,
                    title: _isArabic ? 'اسم المطور' : 'Developer Name',
                    value: 'Dhyaa Mohammed Abbas',
                    accentColor: primaryColor,
                  ),

                  _profileCard(
                    icon: Icons.work_outline,
                    title: _isArabic ? 'الصفة المهنية' : 'Role',
                    value: 'Software Engineer',
                    accentColor: secondaryColor,
                  ),

                  _profileCard(
                    icon: Icons.location_on_outlined,
                    title: _isArabic ? 'الموقع' : 'Location',
                    value: 'Taiz, Yemen',
                    accentColor: Colors.deepOrange,
                  ),

                  _profileCard(
                    icon: Icons.email_outlined,
                    title: _isArabic ? 'البريد الإلكتروني' : 'Email',
                    value: 'eng.deay@gmail.com',
                    accentColor: Colors.blueAccent,
                  ),

                  _profileCard(
                    icon: Icons.code_rounded,
                    title: _isArabic ? 'حساب جيتهاب' : 'GitHub',
                    value: 'https://github.com/engdheya',
                    accentColor: Colors.purple,
                  ),

                  const SizedBox(height: 20),

                  // App Info Container
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F5E9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.storefront,
                            color: primaryColor,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _isArabic
                                    ? 'تطبيق سوق اليمن'
                                    : 'Yemen Market App',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                _isArabic
                                    ? 'منصة تسوق إلكتروني متكاملة'
                                    : 'Commercial Portfolio E-Commerce Platform',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileCard({
    required IconData icon,
    required String title,
    required String value,
    required Color accentColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: accentColor, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF212121),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
