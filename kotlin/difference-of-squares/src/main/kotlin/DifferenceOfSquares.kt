import kotlin.math.pow

class Squares(private val n: Int) {
    fun sumOfSquares(): Int = (1..n).sumOf { it.pow() }

    fun squareOfSum(): Int = (1..n).sum().pow(2)

    fun difference(): Int = squareOfSum() - sumOfSquares()
}

private fun Int.pow(int: Int = 2) : Int = toDouble().pow(int).toInt()
