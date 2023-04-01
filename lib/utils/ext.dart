

extension ListExt<T> on List<T>{

  T? firstOrNull(){
    return isEmpty ? null : first;
  }

}