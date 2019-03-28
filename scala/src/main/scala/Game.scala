import poker.{Card, Rank, Suit}

object Game {
  def main(args: Array[String]): Unit = {
    println(new Card(Rank.Three,Suit.Hearts))
  }
}