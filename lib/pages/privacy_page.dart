// lib/pages/privacy_page.dart
import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  static const route = '/privacy';
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Privacy Policy', style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 12),
                    Text('We respect your privacy and aim to be transparent about how this site operates. The core conversion functionality runs client-side when possible and does not require an account or personal information from users.', style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 12),
                    Text('Third-party services', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('When advertising is enabled, third-party ad networks may set cookies or use similar technologies to serve and personalize ads. We don\'t control these providers; please review the ad provider policies for details.', style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 12),
                    Text('Analytics', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('We may collect minimal, aggregated analytics (page views, error rates) to improve reliability and content. These analytics do not contain personal identifiers. If you prefer not to be included in analytics, please contact feedback@convertunitspro.org.', style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 12),
                    Text('Data retention & requests', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('If you have questions about privacy or want to request data deletion, contact feedback@convertunitspro.org and include details so we can respond. We will handle requests according to applicable law.', style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 16),
                    Center(child: FilledButton(onPressed: () => Navigator.of(context).maybePop(), child: const Text('Back'))),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
