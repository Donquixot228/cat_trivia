class DataBaseRepository {
  DataBaseRepository();

  static final DataBaseRepository _repositories = DataBaseRepository();

  static DataBaseRepository get instance => _repositories;



}
