package poker

class Card(rank: Rank.Value, suit: Suit.Value) { // .Value? Ewww!
  override def toString() : String = {
    s"${this.rank}${this.suit}"
  }
}

object Suit extends Enumeration {
  val Hearts = Value("♥")
  val Diamonds = Value("♦")
  val Clubs = Value("♣")
  val Spades = Value("♠")
}

object Rank extends Enumeration {
  val Ace = Value("A")
  val Two = Value("2")
  val Three = Value("3")
  val Four = Value("4")
  val Five = Value("5")
  val Six = Value("6")
  val Seven = Value("7")
  val Eight = Value("8")
  val Nine = Value("9")
  val Ten = Value("10")
  val Jack = Value("J")
  val Queen = Value("Q")
  val King = Value("K")
}