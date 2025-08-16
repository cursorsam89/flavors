// features/dashboard/dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../l10n/app_localizations.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final String tabHome = AppLocalizations.of(context).tabHome;
    final String tabMore = AppLocalizations.of(context).tabMore;
    final List<Widget> pages = <Widget>[
      _HomeTab(onOpenSoroban: () => context.push('/soroban')),
      const _MoreTab(),
    ];
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (int i) => setState(() => _index = i),
        destinations: <NavigationDestination>[
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: tabHome,
          ),
          NavigationDestination(
            icon: const Icon(Icons.more_horiz),
            selectedIcon: const Icon(Icons.more),
            label: tabMore,
          ),
        ],
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab({required this.onOpenSoroban});

  final VoidCallback onOpenSoroban;

  @override
  Widget build(BuildContext context) {
    final Widget welcome = _WelcomeText();
    final String soroban = AppLocalizations.of(context).soroban;
    final String comingSoon = AppLocalizations.of(context).comingSoon;
    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Builder(
                builder: (BuildContext ctx) {
                  final TextStyle? style = Theme.of(ctx).textTheme.titleLarge;
                  return DefaultTextStyle(
                    style: style ?? const TextStyle(fontSize: 20),
                    child: welcome,
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: <Widget>[
                _GridCard(
                  icon: Icons.calculate,
                  label: soroban,
                  onTap: onOpenSoroban,
                ),
                _GridCard(icon: Icons.lock, label: comingSoon, onTap: null),
                _GridCard(icon: Icons.lock, label: comingSoon, onTap: null),
                _GridCard(icon: Icons.lock, label: comingSoon, onTap: null),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MoreTab extends StatelessWidget {
  const _MoreTab();

  @override
  Widget build(BuildContext context) {
    final String profile = AppLocalizations.of(context).profile;
    final String theme = AppLocalizations.of(context).theme;
    final String signOut = AppLocalizations.of(context).signOut;
    return SafeArea(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(profile),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: Text(theme),
            onTap: () => showModalBottomSheet<void>(
              context: context,
              builder: (_) => const _ThemeSheet(),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(signOut),
            onTap: () => Navigator.of(
              context,
            ).pushNamedAndRemoveUntil('/login', (Route<dynamic> _) => false),
          ),
        ],
      ),
    );
  }
}

class _GridCard extends StatelessWidget {
  const _GridCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size: 42),
              const SizedBox(height: 8),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeSheet extends StatelessWidget {
  const _ThemeSheet();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: const Text('System'),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: const Text('Light'),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: const Text('Dark'),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

class _WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadUserName(),
      builder: (BuildContext _, AsyncSnapshot<String> snap) {
        final String name = (snap.data == null || snap.data!.isEmpty)
            ? 'User'
            : snap.data!;
        final String text = AppLocalizations.of(context).welcomeUser(name);
        return Text(text);
      },
    );
  }
}

Future<String> _loadUserName() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? session = prefs.getString('settings.session');
    if (session == null) return '';
    final RegExp match = RegExp('\"displayName\"\\s*:\\s*\"([^\"]+)\"');
    final Match? m = match.firstMatch(session);
    return m == null ? '' : (m.group(1) ?? '');
  } catch (_) {
    return '';
  }
}
