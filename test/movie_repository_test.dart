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

    test('getMovies contains valid The Bad Guys and The Bad Guys 2', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie badGuys = movies[0];
      expect(badGuys.id, 'movie-1');
      expect(badGuys.title, 'The Bad Guys');
      expect(badGuys.price, 7.99);
      expect(badGuys.posterPath, isNotEmpty);

      final Movie badGuys2 = movies[1];
      expect(badGuys2.id, 'movie-2');
      expect(badGuys2.title, 'The Bad Guys 2');
      expect(badGuys2.price, 7.99);
      expect(badGuys2.posterPath, isNotEmpty);
    });

    test('getMovieById returns matching movie when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('movie-1');

      expect(movie, isNotNull);
      expect(movie?.title, 'The Bad Guys');
      expect(movie?.price, 7.99);
    });

    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('non-existent');

      expect(movie, isNull);
    });
  });
}
