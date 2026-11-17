import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'movie-1',
        title: 'The Bad Guys',
        synopsis:
            'A crew of notorious animal criminals pretends to reform in order to pull off their '
            'biggest heist yet, only to discover they might actually enjoy being good.',
        ageRating: 'PG',
        screeningTime: 'Saturday 21 Nov 2026 17:30',
        price: 7.99,
        posterPath: 'assets/images/the_bad_guys_movie_poster.jpg',
      ),
      Movie(
        id: 'movie-2',
        title: 'The Bad Guys 2',
        synopsis:
            'Trying to go straight, the reformed crew is pulled back into action when a new '
            'all-female crew of criminals sets them up for a high-stakes heist that tests their '
            'loyalty and their new image.',
        ageRating: 'PG',
        screeningTime: 'Saturday 21 Nov 2026 19:30',
        price: 7.99,
        posterPath: 'assets/images/the_bad_guys_2_movie_poster.jpg',
      ),
    ];
  }
}
