import 'package:flutter/material.dart';

void main() {
  runApp(const NewsApp());
}

// ── Colours ──────────────────────────────────────────────────────────────────
const Color primaryRed  = Color(0xFFE53935); // Colors.red[600]
const Color darkRed     = Color(0xFFB71C1C); // Colors.red[900]
const Color accentRed   = Color(0xFFFF5252); // highlight / tags

// ── App ───────────────────────────────────────────────────────────────────────
class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Daily',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryRed),
        useMaterial3: true,
      ),
      home: const NewsArticlePage(),
    );
  }
}

// ── Article page ──────────────────────────────────────────────────────────────
class NewsArticlePage extends StatelessWidget {
  const NewsArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryRed,
        title: const Text(
          'Tech Daily',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double w = constraints.maxWidth;

          final bool isPhone  = w < 480;
          final bool isTablet = w >= 480 && w < 840;

          final double sidePad     = isPhone ? 16 : (isTablet ? 28 : 48);
          final double headingSize = isPhone ? 20 : (isTablet ? 24 : 28);
          final double bodySize    = isPhone ? 13 : 15;
          final double heroHeight  = isPhone ? 200 : (isTablet ? 260 : 340);
          final double inlineH     = isPhone ? 160 : (isTablet ? 210 : 260);
          const double contentMax  = 720;

          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: contentMax),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ── PICTURE SLOT 1 · Hero ──────────────────────────────
                    _HeroImage(height: heroHeight),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: sidePad,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const _TagRow(),
                          const SizedBox(height: 14),

                          // Headline
                          Text(
                            'Noble Cryptography Crosses 180K Stars '
                            'as Hermes AI Joins the Security Conversation',
                            style: TextStyle(
                              fontSize: headingSize,
                              fontWeight: FontWeight.bold,
                              color: darkRed,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Subtitle
                          const Text(
                            'JUNE 6, 2026 · OPEN SOURCE',
                            style: TextStyle(
                              color: primaryRed,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'TRENDING ON GITHUB',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 24),

                          // ── SUMMARY ───────────────────────────────────────
                          const _SectionHeading('SUMMARY'),
                          const SizedBox(height: 8),
                          Text(
                            "Paul Miller's noble-curves library — a zero-dependency, "
                            'audited JavaScript implementation of elliptic-curve '
                            'cryptography covering secp256k1, Ed25519, BLS12-381 and '
                            'more — has crossed 180,000 combined GitHub stars across '
                            'the noble family of packages. The milestone reflects '
                            'how deeply embedded the library has become in Ethereum '
                            'wallets, Layer-2 rollups, and browser-based signing tools.',
                            style: TextStyle(height: 1.7, fontSize: bodySize),
                          ),
                          const SizedBox(height: 20),

                          // ── PICTURE SLOT 2 · ECC (hero.png) ───────────────
                          _LocalInlineImage(
                            assetPath: 'assets/hero.png',
                            caption: 'Everything Claude Code — the performance system for AI agent harnesses.',
                            height: inlineH,
                          ),
                          const SizedBox(height: 28),

                          // ── DID YOU KNOW ──────────────────────────────────
                          const _SectionHeading('DID YOU KNOW'),
                          const SizedBox(height: 8),
                          Text(
                            "Hermes AI, Anthropic's reasoning-focused model, is being "
                            'explored by cryptography researchers for LLM-assisted '
                            "self-audits of low-level curve arithmetic — a practice "
                            'Paul Miller himself documented in April 2026 after '
                            'completing a detailed audit of all noble libraries with '
                            'AI assistance.',
                            style: TextStyle(height: 1.7, fontSize: bodySize),
                          ),
                          const SizedBox(height: 20),

                          // ── PICTURE SLOT 3 · Hermes (hq720.jpg) ───────────
                          _LocalInlineImage(
                            assetPath: 'assets/hq720.jpg',
                            caption: 'Hermes Agent — AI-powered security at the frontier.',
                            height: inlineH,
                          ),
                          const SizedBox(height: 28),

                          // ── WHY IT MATTERS ────────────────────────────────
                          const _SectionHeading('WHY IT MATTERS'),
                          const SizedBox(height: 8),
                          Text(
                            'Open-source cryptography libraries sit at the base of '
                            'nearly every Web3 wallet and signing flow. When a library '
                            'like noble-curves reaches this level of adoption it becomes '
                            'critical infrastructure — meaning rigorous, repeatable '
                            'audits matter more than ever. AI-assisted review could '
                            'make that process both faster and more thorough.',
                            style: TextStyle(height: 1.7, fontSize: bodySize),
                          ),
                          const SizedBox(height: 32),

                          // ── SOURCES ───────────────────────────────────────
                          const _SectionHeading('SOURCES'),
                          const SizedBox(height: 10),
                          const _SourceItem(
                            number: '1',
                            title: 'noble-curves — GitHub',
                            url: 'github.com/paulmillr/noble-curves',
                          ),
                          const _SourceItem(
                            number: '2',
                            title: 'Paul Miller — Noble cryptography',
                            url: 'paulmillr.com/noble',
                          ),
                          const _SourceItem(
                            number: '3',
                            title: 'Anthropic — Hermes AI / Project Glasswing',
                            url: 'anthropic.com/glasswing',
                          ),
                          const SizedBox(height: 28),

                          // ── Author ─────────────────────────────────────────
                          const _AuthorRow(),
                          SizedBox(height: sidePad),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ── Hero image (local asset) ──────────────────────────────────────────────────
class _HeroImage extends StatelessWidget {
  final double height;
  const _HeroImage({required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: darkRed),
          Image.asset(
            'assets/best-ai-agents.webp',
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => const Center(
              child: Icon(Icons.image_not_supported_outlined,
                  color: Colors.white38, size: 56),
            ),
          ),
          // Bottom gradient
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color(0x88000000)],
              ),
            ),
          ),
          // Star badge
          Positioned(
            top: 14,
            right: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: primaryRed,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star_rounded, color: Colors.white, size: 14),
                  SizedBox(width: 4),
                  Text(
                    '180K Stars',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Local inline image ────────────────────────────────────────────────────────
class _LocalInlineImage extends StatelessWidget {
  final String assetPath;
  final String caption;
  final double height;
  const _LocalInlineImage({
    required this.assetPath,
    required this.caption,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            assetPath,
            width: double.infinity,
            height: height,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              height: height,
              decoration: BoxDecoration(
                color: const Color(0xFFFFEBEE), // red[50]
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(Icons.broken_image_outlined,
                    color: primaryRed, size: 48),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          caption,
          style: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
              fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}

// ── Section heading ───────────────────────────────────────────────────────────
class _SectionHeading extends StatelessWidget {
  final String title;
  const _SectionHeading(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 4, height: 18, color: primaryRed),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: darkRed),
        ),
      ],
    );
  }
}

// ── Topic tags ────────────────────────────────────────────────────────────────
class _TagRow extends StatelessWidget {
  const _TagRow();

  @override
  Widget build(BuildContext context) {
    const tags = [
      ('Open Source', Color(0xFFFFEBEE), Color(0xFFB71C1C)),
      ('ECC',         Color(0xFFFFEBEE), Color(0xFFE53935)),
      ('Hermes AI',   Color(0xFFFFCDD2), Color(0xFF7F0000)),
    ];
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        for (final t in tags)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: t.$2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(t.$1,
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: t.$3)),
          ),
      ],
    );
  }
}

// ── Source item ───────────────────────────────────────────────────────────────
class _SourceItem extends StatelessWidget {
  final String number;
  final String title;
  final String url;
  const _SourceItem(
      {required this.number, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBEE),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Center(
              child: Text(number,
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: primaryRed)),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500)),
                Text(url,
                    style: const TextStyle(
                        fontSize: 11, color: primaryRed)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Author row ────────────────────────────────────────────────────────────────
class _AuthorRow extends StatelessWidget {
  const _AuthorRow();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFFFCDD2))),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: primaryRed,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text('TD',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tech Daily',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 13)),
              Text('June 6, 2026',
                  style: TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}