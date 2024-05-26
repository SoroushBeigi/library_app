import 'package:flutter/material.dart';
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

class __HomeScreenState extends State<_HomeScreen> {
  @override
  void initState() {
    super.initState();
    final provider = context.read<HomeProvider>();
    provider.getBooks();
    provider.getPublishers();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Center(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => provider.addItem(context),
          ),
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            bottom: TabBar(
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
          ),
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
          ),
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
          ),
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
          ),
          itemCount: provider.employees.length,
        ),
      ),
    );
  }
}
