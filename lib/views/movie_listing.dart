import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({super.key, required this.movie});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _bookingMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        color: cinemaSurface,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.movie.title} (${widget.movie.ageRating})',
              style: cinemaHeaderStyle,
            ),
            const SizedBox(height: 16),
            const Text(
              'Southsea Cinema Room',
              style: TextStyle(color: cinemaFontWhite, fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              widget.movie.screeningTime,
              style: const TextStyle(color: cinemaFontWhite, fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              widget.movie.synopsis,
              style: const TextStyle(color: cinemaFontMuted, fontSize: 15),
            ),
            const SizedBox(height: 24),
            const Text(
              'Please note that Discounts / Membership Benefits will be '
              'applied once you have selected your tickets',
              style: TextStyle(color: cinemaFontWhite, fontSize: 14),
            ),
            const SizedBox(height: 12),
            const Text(
              'Select Quantities (Up to 5 in total)',
              style: TextStyle(color: cinemaFontWhite, fontSize: 14),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tickets',
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                DropdownMenu<int>(
                  initialSelection: _ticketQuantity,
                  width: 100,
                  textStyle: const TextStyle(color: Colors.black),
                  inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: InputBorder.none,
                  ),
                  onSelected: (int? value) {
                    if (value != null) {
                      setState(() {
                        _ticketQuantity = value;
                      });
                    }
                  },
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: 1, label: '1'),
                    DropdownMenuEntry(value: 2, label: '2'),
                    DropdownMenuEntry(value: 3, label: '3'),
                    DropdownMenuEntry(value: 4, label: '4'),
                    DropdownMenuEntry(value: 5, label: '5'),
                  ],
                ),
                const SizedBox(width: 12),
                Text(
                  'Adult (${widget.movie.formattedPrice})',
                  style: const TextStyle(color: cinemaFontWhite, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Tickets selected: $_ticketQuantity',
              style: const TextStyle(color: cinemaFontMuted, fontSize: 14),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: cinemaBrand,
                foregroundColor: cinemaFontWhite,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: () {
                setState(() {
                  _bookingMessage =
                      'Added $_ticketQuantity tickets to the order';
                });
              },
              child: const Text('Add to order'),
            ),
            const SizedBox(height: 12),
            Text(
              _bookingMessage,
              style: const TextStyle(color: cinemaFontWhite, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
