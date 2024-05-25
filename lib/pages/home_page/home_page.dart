import 'package:flutter/material.dart';
import 'package:library_app/pages/home_page/widgets/book_card.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Center(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Column(
                    children: [
                      Icon(Icons.book),
                      Text('Books'),
                    ],
                  ),
                ),
                Tab(
                  icon: Column(
                    children: [
                      Icon(Icons.person),
                      Text('Members'),
                    ],
                  ),
                ),
                Tab(
                  icon: Column(
                    children: [
                      Icon(Icons.home_work),
                      Text('Publishers'),
                    ],
                  ),
                ),
                Tab(
                  icon: Column(
                    children: [
                      Icon(Icons.emoji_people),
                      Text('Employees'),
                    ],
                  ),
                ),
              ],
            ),
            title: const Text('Home Page'),
          ),
          body: TabBarView(
            children: [
              provider.isLoading
                  ? const Center(child:  CircularProgressIndicator())
                  : _buildBookListView(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Icon(Icons.airline_seat_flat_sharp),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookListView() {
    final provider = context.watch<HomeProvider>();
    return ListView.builder(
      itemBuilder: (context, index) => BookCard(
        model: provider.books[index],
      ),
      itemCount: provider.books.length,
    );
  }
}
