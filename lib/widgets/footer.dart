import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'feedback_dialog.dart';

/// Footer with internal routes, external GitHub links, mailto fallback,
/// and a Buy Me a Coffee button.
///
/// UPDATE THESE TWO CONSTANTS:
const String GITHUB_USERNAME = 'DarthPlagueis123';// <-- set once
const String BMC_URL = 'https://www.buymeacoffee.com/DarthPlagueis123';

class SiteFooter extends StatelessWidget {
  SiteFooter({super.key});

  Uri get _bugUrl => Uri.parse('https://github.com/$GITHUB_USERNAME/unit-converter/issues');
  Uri get _featureUrl => Uri.parse(
      'https://github.com/$GITHUB_USERNAME/unit-converter/issues/new?template=feature_request.md');
  Uri get _coffeeUrl => Uri.parse(BMC_URL);

  // Optional fallback
  final Uri _mailtoFeedback = Uri(
    scheme: 'mailto',
    path: 'nkransfeld@gmail.com', // in FeedbackDialog.TARGET_EMAIL
    query: 'subject=Unit Converter Feedback&body=Hi! I have some feedback:%0D%0A%0D%0A',
  );

  Future<void> _open(BuildContext context, Uri url) async {
    final ok = await launchUrl(url, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open: ${url.toString()}')),
      );
    }
  }

  Widget _linkColumn(
    BuildContext context, {
    required String title,
    required List<({String label, String? route, Uri? external})> items,
  }) {
    final textColor = Theme.of(context).colorScheme.onSurface.withOpacity(0.85);

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
          for (final item in items)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: InkWell(
                onTap: () async {
                  if (item.route != null) {
                    if (context.mounted) Navigator.of(context).pushNamed(item.route!);
                  } else if (item.external != null) {
                    await _open(context, item.external!);
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Coming soon ✨')),
                      );
                    }
                  }
                },
                child: Text(
                  item.label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: textColor,
                        decoration: TextDecoration.underline,
                        decorationColor: textColor.withOpacity(0.6),
                      ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _coffeeButton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFDD00), // BuyMeACoffee yellow
        foregroundColor: Colors.black,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () => _open(context, _coffeeUrl),
      icon: const Icon(Icons.local_cafe_outlined),
      label: const Text('Buy me a coffee'),
    );
  }

  Widget _feedbackButton(BuildContext context) {
    final border = Colors.white.withOpacity(0.28);
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        side: BorderSide(color: border),
      ),
      onPressed: () {
        showDialog(context: context, builder: (_) => const FeedbackDialog());
      },
      icon: const Icon(Icons.feedback_outlined),
      label: const Text('Send feedback'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final panel = Colors.white.withOpacity(0.14);
    final border = Colors.white.withOpacity(0.28);

    final product = _linkColumn(
      context,
      title: 'Product',
      items: [
        (label: 'Unit Converter', route: '/', external: null),
        (label: 'Formula Breakdown', route: '/docs', external: null),
        (label: 'Categories', route: '/docs', external: null),
        (label: 'What’s New', route: '/docs', external: null),
      ],
    );

    final resources = _linkColumn(
      context,
      title: 'Resources',
      items: [
        (label: 'Docs (coming soon)', route: '/docs', external: null),
        (label: 'Tips & Tricks', route: '/docs', external: null),
        (label: 'Report a Bug', route: null, external: _bugUrl),
        (label: 'Request a Feature', route: null, external: _featureUrl),
      ],
    );

    final legal = _linkColumn(
      context,
      title: 'Legal',
      items: [
        (label: 'Privacy Policy', route: '/privacy', external: null),
        (label: 'Terms of Use', route: '/terms', external: null),
        (label: 'Cookie Policy', route: '/docs', external: null),
      ],
    );

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
            alignment: isNarrow ? WrapAlignment.start : WrapAlignment.spaceBetween,
            children: [product, resources, legal],
          );

          final rightCtas = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _coffeeButton(context),
              const SizedBox(height: 10),
              _feedbackButton(context),
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
            onPressed: () {
              showDialog(context: context, builder: (_) => const FeedbackDialog());
            },
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
