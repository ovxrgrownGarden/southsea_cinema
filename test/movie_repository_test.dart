import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns two movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 2);
    });

    test('getMovies contains valid Phantom of the Opera and Lion King', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie phantom = movies[0];
      expect(phantom.id, 'movie-1');
      expect(phantom.title, 'The Phantom of the Opera');
      expect(phantom.price, 9.50);
      expect(phantom.posterPath, isNotEmpty);

      final Movie lionKing = movies[1];
      expect(lionKing.id, 'movie-2');
      expect(lionKing.title, 'The Lion King');
      expect(lionKing.price, 8.00);
      expect(lionKing.posterPath, isNotEmpty);
    });

    test('getMovieById returns matching movie when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('movie-1');

      expect(movie, isNotNull);
      expect(movie?.title, 'The Phantom of the Opera');
      expect(movie?.price, 9.50);
    });

    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('non-existent');

      expect(movie, isNull);
    });
  });
}
