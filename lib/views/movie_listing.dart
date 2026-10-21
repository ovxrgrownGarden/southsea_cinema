import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

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
            const Text(
              'THE BAD GUYS (2022) (U)',
              style: cinemaHeaderStyle,
            ),
            const SizedBox(height: 16),
            const Text(
              'Southsea Cinema Room',
              style: TextStyle(color: cinemaFontWhite, fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Thursday 22 Oct 2026, 18:00 - 100 mins',
              style: TextStyle(color: cinemaFontWhite, fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'The Bad Guys is a 2022 American animated crime comedy film '
              'produced by DreamWorks Animation. Loosely based on the '
              "children's book series by Aaron Blabey.",
              style: TextStyle(color: cinemaFontMuted, fontSize: 15),
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
                  textStyle: TextStyle(color: Colors.black),
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
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 1, label: '1'),
                    DropdownMenuEntry(value: 2, label: '2'),
                    DropdownMenuEntry(value: 3, label: '3'),
                    DropdownMenuEntry(value: 4, label: '4'),
                    DropdownMenuEntry(value: 5, label: '5'),
                  ],
                ),
                const SizedBox(width: 12),
                const Text(
                  'Adult (£7.50)',
                  style: TextStyle(color: cinemaFontWhite, fontSize: 16),
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
                print(_bookingMessage);
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
