package org.example
import scala.io.StdIn.readLine

object App {
  def main(args : Array[String]) {
    println("Введите годовой доход:")
    val yearSalalry = readLine().toInt
    println("Введите размер премии:")
    val bonus = readLine().toFloat
    println("Компенсация питания:")
    val eatBonus = readLine().toInt
    val Salary = ((yearSalalry * bonus / 100 + eatBonus + yearSalalry)/12) * 0.87
    println( s"Зарплата сотрудника в месяц = ${Salary}" )

  val firstList = List(100, 150, 200, 80, 120, 75)
  val commonSalary = firstList.sum
  val countPersons = firstList.size
  val  AverageSalary = firstList.sum/firstList.size
  println( s"Средняя зарплата по отделу в месяц = ${AverageSalary}" )
3
    val deviation = AverageSalary - Salary
    val DevFromSalary = Salary * 100 / AverageSalary
    if (deviation > 0) {
    println(s"Зарплата сотрудника ниже средней, ${DevFromSalary.round} %")
    } else {
      println(s"Зарплата сотрудника выше средней - ${DevFromSalary.round} % ")
    }

  }

}
