import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:library_app/pages/home_page/widgets/cards/book_card.dart';
import 'package:library_app/pages/home_page/widgets/cards/employee_card.dart';
import 'package:library_app/pages/home_page/widgets/cards/member_card.dart';
import 'package:library_app/pages/home_page/widgets/cards/publisher_card.dart';
import 'package:library_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      builder: (context, child) => const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({super.key});

  @override
  State<_HomeScreen> createState() => __HomeScreenState();
}

class __HomeScreenState extends State<_HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    final provider = context.read<HomeProvider>();
    provider.getBooks();
    provider.getPublishers();
    tabController = TabController(vsync: this, length: 4);
    tabController.addListener(() {
      provider.selectedTab=tabController.index;
      if (provider.selectedTab != tabController.index) {
        provider.onTabChanged(tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Center(
      child: Scaffold(
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.receipt_sharp),
              onPressed: () => provider.addItem(context),
            ),
            const SizedBox(width: 8,),
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => provider.addItem(context),
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(
                icon: Column(
                  children: [
                    Icon(Icons.book),
                    FittedBox(child: Text('Books')),
                  ],
                ),
              ),
              Tab(
                icon: Column(
                  children: [
                    Icon(Icons.person),
                    FittedBox(child: Text('Members')),
                  ],
                ),
              ),
              Tab(
                icon: Column(
                  children: [
                    Icon(Icons.home_work),
                    FittedBox(child: Text('Publishers')),
                  ],
                ),
              ),
              Tab(
                icon: Column(
                  children: [
                    Icon(Icons.emoji_people),
                    FittedBox(child: Text('Employees')),
                  ],
                ),
              ),
            ],
            onTap: (value) {
              provider.onTabChanged(value);
            },
          ),
          title: const Text('Home Page'),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            provider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildBookListView(),
            provider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildMemberListView(),
            provider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildPublisherListView(),
            provider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildEmployeeListView(),
          ],
        ),
      ),
    );
  }

  Widget _buildBookListView() {
    final provider = context.watch<HomeProvider>();
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width >= 600
            ? 500
            : MediaQuery.of(context).size.width * 0.9,
        child: ListView.builder(
          itemBuilder: (context, index) => BookCard(
            model: provider.books[index],
          ).animate(effects: [FadeEffect(delay: Duration(milliseconds: index*400),curve: Curves.ease)]),
          itemCount: provider.books.length,
        ),
      ),
    );
  }

  Widget _buildMemberListView() {
    final provider = context.watch<HomeProvider>();
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width >= 600
            ? 500
            : MediaQuery.of(context).size.width * 0.75,
        child: ListView.builder(
          itemBuilder: (context, index) => MemberCard(
            model: provider.members[index],
          ).animate(effects: [FadeEffect(delay: Duration(milliseconds: index*400),curve: Curves.ease)]),
          itemCount: provider.members.length,
        ),
      ),
    );
  }

  Widget _buildPublisherListView() {
    final provider = context.watch<HomeProvider>();
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width >= 600
            ? 500
            : MediaQuery.of(context).size.width * 0.75,
        child: ListView.builder(
          itemBuilder: (context, index) => PublisherCard(
            model: provider.publishers[index],
          ).animate(effects: [FadeEffect(delay: Duration(milliseconds: index*400),curve: Curves.ease)]),
          itemCount: provider.publishers.length,
        ),
      ),
    );
  }

  Widget _buildEmployeeListView() {
    final provider = context.watch<HomeProvider>();
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width >= 600
            ? 500
            : MediaQuery.of(context).size.width * 0.75,
        child: ListView.builder(
          itemBuilder: (context, index) => EmployeeCard(
            model: provider.employees[index],
          ).animate(effects: [FadeEffect(delay: Duration(milliseconds: index*400),curve: Curves.ease)]),
          itemCount: provider.employees.length,
        ),
      ),
    );
  }
}
