import 'package:flutter/material.dart';
import 'package:quickai/payment_service.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(QuikAIApp());
}

class QuikAIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuikAI',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/abouts': (context) => AboutUsPage(),
        '/terms': (context) => TermAndConditions(),
        '/privacy': (context) => PrivatePolicy(),
        '/payment': (context) => PaymentServices(),
      },
      home: QuikAIScreen(),
    );
  }
}

class QuikAIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuikAI'),
        elevation: 2.0,
        actions: [
          buildPopupMenuButton(context),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.0),
              Text(
                'Learn to use AI Tools & ChatGPT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).size.width < 600 ? 24.0 : 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Create any kind of Presentations under 10 secs, do any kind of IT work under 10 mins, become top 1% of Excel users who can use the functions and save your job and 90% of your time on a daily basis',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).size.width < 600 ? 18.0 : 24.0,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentServices(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16.0),
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width < 600
                          ? 16.0
                          : 20.0),
                ),
                child: Text(
                  'Become a super working professional now Only Rs. 9',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Why join this course? 🤷🏻‍♂️',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).size.width < 600 ? 22.0 : 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  GreenTickMark(
                    text:
                        'BECOME A HIGHLY PAID PROMPT,\nENGINEER (AVERAGE SALARY 17LPA)',
                  ),
                  GreenTickMark(
                    text: 'NO PRIOR TECHNICAL OR AI \nKNOWLEDGE REQUIRED',
                  ),
                  GreenTickMark(
                    text: 'SAVE UPTO 2 HOURS EVERYDAY',
                  ),
                  GreenTickMark(
                    text: 'GROW YOUR SALARY UPTO 3X',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPopupMenuButton(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        handleMenuOption(context, value);
      },
      itemBuilder: (BuildContext context) {
        return {'About Us', 'Terms and Conditions', 'Privacy Policy'}
            .map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }

  void handleMenuOption(BuildContext context, String option) {
    switch (option) {
      case 'About Us':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AboutUsPage()),
        );
        break;
      case 'Terms and Conditions':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TermAndConditions()),
        );
        break;
      case 'Privacy Policy':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PrivatePolicy()),
        );
        break;
    }
  }
}

class GreenTickMark extends StatelessWidget {
  final String text;

  GreenTickMark({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check, color: Colors.green),
        SizedBox(width: 8.0),
        Text(text),
      ],
    );
  }
}

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _Header('TagGen - Your Ultimate Tag Generator',
                  fontSize: 20, fontWeight: FontWeight.bold),
              SizedBox(height: 20),
              _Paragraph(
                'Welcome to TagGen, your go-to app for generating relevant and customized tags effortlessly. Whether you are a content creator, social media enthusiast, or blogger, TagGen is here to make your life easier.',
                fontSize: 16,
              ),
              SizedBox(height: 20),
              _Header('Key Features:',
                  fontSize: 18, fontWeight: FontWeight.bold),
              SizedBox(height: 10),
              _ListTile('Instant Tag Generation'),
              _ListTile('Customized Tags based on User Queries'),
              _ListTile('User-Friendly Interface'),
              SizedBox(height: 20),
              _Header('About the Team:',
                  fontSize: 18, fontWeight: FontWeight.bold),
              SizedBox(height: 10),
              _Paragraph(
                'TagGen is brought to you by a passionate team of developers dedicated to simplifying your content creation experience. We strive to provide innovative solutions that empower users to enhance their online presence.',
                fontSize: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TermAndConditions extends StatelessWidget {
  const TermAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionHeader('Terms and Conditions'),
              const SizedBox(height: 4),
              _SubHeader('Last Updated: 12-Dec-2024'),
              _SectionHeader('1. Acceptance of Terms'),
              _Paragraph(
                'By accessing or using VERVE ("the App"), you agree to comply with and be bound by these Terms and Conditions ("Terms"). If you do not agree to these Terms, please do not use the App.',
              ),
              _SectionHeader('2. User Accounts'),
              _Paragraph(
                'You must be at least 18 years of age to use this App. By using this App and agreeing to these Terms, you represent and warrant that you are at least 18 years of age.',
              ),
              _SectionHeader('3. Use of the App'),
              _Paragraph(
                'To access certain features of the App, you may be required to create a user account. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use of your account.',
              ),
              _SectionHeader('4. Content and Intellectual Property'),
              _Paragraph(
                'All content and materials available through the App, including text, graphics, images, and software, are the property of Youth Tech or its licensors and are protected by copyright, trademark, and other intellectual property laws. You may not reproduce, distribute, or modify any content from the App without our express written consent.',
              ),
              _SectionHeader('5. Data Privacy'),
              _Paragraph(
                'Your use of the VERVE APP is subject to our Privacy Policy, which governs the collection, use, and disclosure of your personal information. By using the App, you consent to the terms of our Privacy Policy.',
              ),
              _SectionHeader('6. Limitation of Liability'),
              _Paragraph(
                'To the fullest extent permitted by applicable law, Verve by Youth Tech shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses, resulting from your access to or use of or inability to access or use the App.',
              ),
              _SectionHeader('7. Changes to Terms'),
              _Paragraph(
                'We reserve the right to modify or update these Terms at any time without prior notice. Your continued use of the App constitutes acceptance of the revised Terms. Please review the Terms periodically for updates.',
              ),
              _SectionHeader('8. Governing Law'),
              _Paragraph(
                'These Terms shall be governed by and construed in accordance with the laws of the Indian Constitution. Any disputes arising out of or in connection with these Terms shall be resolved exclusively in the competent courts of Indian Jurisdiction.',
              ),
              _SectionHeader('Contact Us'),
              _Paragraph(
                'If you have any questions or concerns about these Terms, please contact us at vervehelp@gmail.com.',
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class PrivatePolicy extends StatelessWidget {
  const PrivatePolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionHeader('Privacy Policy'),
              const SizedBox(height: 4),
              _SubHeader('Last Updated: 23-JAN-2024'),
              _Paragraph(
                'TAGGEN ("us", "we", or "our") operates TAGGEN (the "App"). This page informs you of our policies regarding the collection, use, and disclosure of Personal Information we receive from users of the App.',
              ),
              _SectionHeader('Information Collection and Use'),
              _Paragraph(
                'While using our App, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you. Personally, identifiable information may include but is not limited to your name, email address, and device information.',
              ),
              _SectionHeader('Log Data'),
              _Paragraph(
                'Like many app operators, we collect information that your device sends whenever you use our App ("Log Data"). This Log Data may include information such as your device\'s Internet Protocol ("IP") address, device type, the version of our App you are using, the time and date of your use, and other statistics.',
              ),
              _SectionHeader('Cookies'),
              _Paragraph(
                'Cookies are files with a small amount of data, which may include an anonymous unique identifier. Cookies are sent to your browser from a website and stored on your device. Like many sites, we use "cookies" to collect information. You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our App.',
              ),
              _SectionHeader('Service Providers'),
              _Paragraph(
                'We may employ third-party companies and individuals to facilitate our App, to provide the App on our behalf, to perform App-related services, or to assist us in analyzing how our App is used. These third parties have access to your Personal Information only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.',
              ),
              _SectionHeader('Security'),
              _Paragraph(
                'The security of your Personal Information is important to us, but remember that no method of transmission over the Internet, or method of electronic storage, is 100% secure. While we strive to use commercially acceptable means to protect your Personal Information, we cannot guarantee its absolute security.',
              ),
              _SectionHeader('Changes to This Privacy Policy'),
              _Paragraph(
                'This Privacy Policy is effective as of 20-JAN-2032 and will remain in effect except concerning any changes in its provisions in the future, which will be in effect immediately after being posted on this page.',
              ),
              _Paragraph(
                'We reserve the right to update or change our Privacy Policy at any time, and you should check this Privacy Policy periodically. Your continued use of the App after we post any modifications to the Privacy Policy on this page will constitute your acknowledgment of the modifications and your consent to abide and be bound by the modified Privacy Policy.',
              ),
              _Paragraph(
                'If we make any material changes to this Privacy Policy, we will notify you either through the email address you have provided us or by placing a prominent notice on our website.',
              ),
              _SectionHeader('Contact Us'),
              _Paragraph(
                'If you have any questions about this Privacy Policy, please contact us at taggenservices@gmail.com.',
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const _Header(this.text,
      {Key? key, this.fontSize = 24, this.fontWeight = FontWeight.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class _Paragraph extends StatelessWidget {
  final String text;
  final double fontSize;

  const _Paragraph(this.text, {Key? key, this.fontSize = 16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String text;

  const _SectionHeader(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Header(text, fontSize: 24, fontWeight: FontWeight.bold);
  }
}

class _SubHeader extends StatelessWidget {
  final String text;

  const _SubHeader(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  final String title;

  const _ListTile(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.check),
      title: Text(title),
    );
  }
}
