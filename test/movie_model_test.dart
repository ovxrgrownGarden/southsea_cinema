import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      const movie = Movie(
        id: 'test',
        title: 'Test Film',
        synopsis: 'A test synopsis.',
        ageRating: 'PG',
        screeningTime: 'Friday 6:00 PM',
        price: 7.50,
        posterPath: 'assets/images/phantom_of_the_opera.jpeg',
      );

      expect(movie.id, 'test');
      expect(movie.title, 'Test Film');
      expect(movie.synopsis, 'A test synopsis.');
      expect(movie.ageRating, 'PG');
      expect(movie.screeningTime, 'Friday 6:00 PM');
      expect(movie.price, 7.50);
      expect(movie.posterPath, 'assets/images/phantom_of_the_opera.jpeg');
    });

    test('formattedPrice shows two decimal places for a whole-pound price', () {
      const movie = Movie(
        id: 'test',
        title: 'Test Film',
        synopsis: 'A test synopsis.',
        ageRating: 'U',
        screeningTime: 'Friday 6:00 PM',
        price: 8.0,
        posterPath: 'assets/images/the_lion_king.jpeg',
      );

      expect(movie.formattedPrice, '£8.00');
    });

    test('formattedPrice shows two decimal places for a price with pence', () {
      const movie = Movie(
        id: 'test',
        title: 'Test Film',
        synopsis: 'A test synopsis.',
        ageRating: 'U',
        screeningTime: 'Friday 6:00 PM',
        price: 9.5,
        posterPath: 'assets/images/the_lion_king.jpeg',
      );

      expect(movie.formattedPrice, '£9.50');
    });
  });
}
