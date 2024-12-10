import 'package:flutter/material.dart';
import 'package:new_move_app/views/widgets/custom_recommended.dart';
import 'package:provider/provider.dart';

import '../../providers/movie_provider.dart';
import '../widgets/custom_category.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF070420),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                style: const TextStyle(color: Colors.white, fontSize: 18),
                controller: searchController,
                onChanged: (query) {
                  if (query.isNotEmpty) {
                    movieProvider.searchMovies(query); // Trigger search
                  } else {
                    movieProvider.searchResults = []; // Clear results on empty query
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF25233D),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(width: 0.8, color: Color(0xFF17212C)),
                  ),
                  hintText: 'Search by title, genre, actor',
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(Icons.search, size: 30, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (movieProvider.isSearching)
              const Center(child: CircularProgressIndicator())
            else if (movieProvider.searchResults.isNotEmpty)
              buildCategory('Search Results', movieProvider.searchResults, context),
             // CustomRecommended(title: "Recommended"),
            if (movieProvider.searchResults.isEmpty && !movieProvider.isSearching)
              Column(
                children: [
                  buildCategory('Popular', movieProvider.popularMovies, context),
                  CustomRecommended(title: "Recommended"),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
