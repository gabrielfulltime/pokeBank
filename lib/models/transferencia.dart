class Transferencia {
  final String pokeNome;
  final String pokeNumero;

  @override
  String toString() {
    return 'Transferencia{pokeNome: ${this.pokeNome}, pokeNumero: ${this.pokeNumero}';
  }

  Transferencia(this.pokeNome, this.pokeNumero);
}