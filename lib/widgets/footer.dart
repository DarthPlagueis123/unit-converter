// ===========================================================
// widgets/footer.dart
// - Responsive footer with real links where available
// - "Coming soon" toast for pages you haven't built yet
// - Mailto feedback + Buy Me a Coffee button wired up
// - Glass-friendly look to match your UI
// ===========================================================

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  // -----------------------------------------------------------
  // Centralized link config
  // - If you don't have a page yet, set comingSoon: true.
  // - Real links (GitHub issues, coffee, mailto) are live.
  // -----------------------------------------------------------

  // Product
  static final _productLinks = <({String label, Uri? url, bool comingSoon})>[
    (label: 'Unit Converter',     url: null, comingSoon: true),
    (label: 'Formula Breakdown',  url: null, comingSoon: true),
    (label: 'Categories',         url: null, comingSoon: true),
    (label: 'What’s New',         url: null, comingSoon: true),
  ];

  // Resources
  static final _resourceLinks = <({String label, Uri? url, bool comingSoon})>[
    (label: 'Docs (coming soon)', url: null, comingSoon: true),
    (label: 'Tips & Tricks',      url: null, comingSoon: true),
    // These two are live (replace with your GitHub repo if needed)
    (
      label: 'Report a Bug',
      url: Uri.parse('https://github.com/yourname/unit-converter/issues'),
      comingSoon: false
    ),
    (
      label: 'Request a Feature',
      url: Uri.parse(
        'https://github.com/yourname/unit-converter/issues/new?template=feature_request.md',
      ),
      comingSoon: false
    ),
  ];

  // Legal
  static final _legalLinks = <({String label, Uri? url, bool comingSoon})>[
    (label: 'Privacy Policy', url: null, comingSoon: true),
    (label: 'Terms of Use',   url: null, comingSoon: true),
    (label: 'Cookie Policy',  url: null, comingSoon: true),
  ];

  // Buy Me a Coffee (replace handle when ready)
  static final Uri _coffeeUrl =
      Uri.parse('https://www.buymeacoffee.com/yourname');

  // Mailto feedback (replace email + subject/body as desired)
  static final Uri _mailtoFeedback = Uri(
    scheme: 'mailto',
    path: 'you@example.com',
    query:
        'subject=Unit Converter Feedback&body=Hi! I have some feedback:%0D%0A%0D%0A',
  );

  // -----------------------------------------------------------
  // Open helper:
  // - If comingSoon, show a friendly toast.
  // - Else launch external (new tab on web / browser on mobile+desktop).
  // -----------------------------------------------------------
  Future<void> _openOrNotify(
    BuildContext context, {
    Uri? url,
    required bool comingSoon,
  }) async {
    if (comingSoon || url == null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Coming soon ✨'),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      return;
    }

    final ok = await launchUrl(url, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open: ${url.toString()}')),
      );
    }
  }

  // -----------------------------------------------------------
  // Reusable link column
  // -----------------------------------------------------------
  Widget _linkColumn(
    BuildContext context, {
    required String title,
    required List<({String label, Uri? url, bool comingSoon})> links,
  }) {
    final textColor =
        Theme.of(context).colorScheme.onSurface.withOpacity(0.85);

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 160),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          for (final item in links)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: InkWell(
                onTap: () => _openOrNotify(
                  context,
                  url: item.url,
                  comingSoon: item.comingSoon,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.label,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: textColor,
                            decoration: TextDecoration.underline,
                            decorationColor: textColor.withOpacity(0.6),
                          ),
                    ),
                    if (item.comingSoon) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.18),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'soon',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  // -----------------------------------------------------------
  // CTA buttons (Coffee + Email)
  // -----------------------------------------------------------
  Widget _coffeeButton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFDD00), // BuyMeACoffee yellow
        foregroundColor: Colors.black,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () => _openOrNotify(
        context,
        url: _coffeeUrl,
        comingSoon: false,
      ),
      icon: const Icon(Icons.local_cafe_outlined),
      label: const Text('Buy me a coffee'),
    );
  }

  Widget _emailButton(BuildContext context) {
    final border = Colors.white.withOpacity(0.28);
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        side: BorderSide(color: border),
      ),
      onPressed: () => _openOrNotify(
        context,
        url: _mailtoFeedback,
        comingSoon: false,
      ),
      icon: const Icon(Icons.email_outlined),
      label: const Text('Email feedback'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final panel = Colors.white.withOpacity(0.14); // translucent panel
    final border = Colors.white.withOpacity(0.28); // subtle border

    // Top: link columns + CTA column (responsive)
    final columns = Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: border),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 680;

          final left = Wrap(
            spacing: 24,
            runSpacing: 16,
            alignment: isNarrow
                ? WrapAlignment.start
                : WrapAlignment.spaceBetween,
            children: [
              _linkColumn(context, title: 'Product', links: _productLinks),
              _linkColumn(context, title: 'Resources', links: _resourceLinks),
              _linkColumn(context, title: 'Legal', links: _legalLinks),
            ],
          );

          final rightCtas = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _coffeeButton(context),
              const SizedBox(height: 10),
              _emailButton(context),
            ],
          );

          return Wrap(
            spacing: 24,
            runSpacing: 18,
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.spaceBetween,
            children: [
              SizedBox(
                width: isNarrow ? double.infinity : constraints.maxWidth * 0.65,
                child: left,
              ),
              rightCtas,
            ],
          );
        },
      ),
    );

    // Bottom bar: © + Made with Flutter + quick feedback
    final year = DateTime.now().year;
    final bottomBar = Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.10),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                Text('© $year Unit Converter',
                    style: Theme.of(context).textTheme.bodySmall),
                const Text('•'),
                const Icon(Icons.flutter_dash, size: 18),
                const Text('Made with Flutter'),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: () => _openOrNotify(
              context,
              url: _mailtoFeedback,
              comingSoon: false,
            ),
            icon: const Icon(Icons.feedback_outlined, size: 18),
            label: const Text('Feedback'),
          ),
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        columns,
        const SizedBox(height: 10),
        bottomBar,
      ],
    );
  }
}
