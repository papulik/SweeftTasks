import UIKit

//MARK: - 1. გვაქვს 1,5,10,20 და 50 თეთრიანი მონეტები. დაწერეთ ფუნქცია, რომელსაც გადაეცემა თანხა (თეთრებში) და აბრუნებს მონეტების მინიმალურ რაოდენობას, რომლითაც შეგვიძლია ეს თანხა დავახურდაოთ.


func minSplit(amount: Int) -> Int {
    var remainingAmount = amount
    var coin1 = 0
    var coin5 = 0
    var coin10 = 0
    var coin20 = 0
    var coin50 = 0
    
    coin50 = remainingAmount / 50
    remainingAmount %= 50
    
    coin20 = remainingAmount / 20
    remainingAmount %= 20
    
    coin10 = remainingAmount / 10
    remainingAmount %= 10
    
    coin5 = remainingAmount / 5
    remainingAmount %= 5
    
    coin1 = remainingAmount
    
    let minCoins = coin1 + coin5 + coin10 + coin20 + coin50
    let minCoinStatus = "minNeeded 1 Tetri: \(coin1), minNeeded 5 Tetri: \(coin5), minNeeded 10 Tetri: \(coin10), minNeeded 20 Tetri: \(coin20), minNeeded 50 Tetri: \(coin50)"
    
    print(minCoinStatus)
    
    return minCoins
}

minSplit(amount: 9)
minSplit(amount: 26)
minSplit(amount: 172)


//MARK: - დაწერეთ ფუნქცია რომელიც დააჯამებს ციფრებს ორ რიცსხვს შორის. მაგალითად გადმოგვეცემა 19 და 22. მათ შორის ციფრების ჯამი იქნება:

func sumOfDigits(start: Int, end: Int) -> Int {
    var totalSum = 0
    
    for number in start...end {
        var currentNumber = number
        
        while currentNumber > 0 {
            totalSum += currentNumber % 10
            currentNumber /= 10
        }
    }
    
    return totalSum
}

sumOfDigits(start: 7, end: 8)
sumOfDigits(start: 17, end: 20)
sumOfDigits(start: 10, end: 12)

//MARK: - მოცემულია String რომელიც შედგება „(" და „)" ელემენტებისგან. დაწერეთ ფუნქცია რომელიც აბრუნებს ფრჩხილები არის თუ არა მათემატიკურად სწორად დასმული.

func isProperly(sequence: String) -> Bool {
    var stack: [Character] = []
    
    for char in sequence {
        if char == "(" {
            stack.append(char)
        } else if char == ")" {
            if stack.isEmpty {
                return false
            }
            stack.removeLast()
        }
    }
    
    return stack.isEmpty
}

isProperly(sequence: "(()())")
isProperly(sequence: ")(()")
isProperly(sequence: "(()())(")

//MARK: - გვაქვს N ფიცრისგან შემდგარი ხიდი. სიძველის გამო ზოგიერთი ფიცარი ჩატეხილია. ზურიკოს შეუძლია გადავიდეს შემდეგ ფიცარზე ან გადაახტეს ერთ ფიცარს. (რათქმაუნდა ჩატეხილ   ფიცარზე ვერ გადავა) ჩვენი ამოცანაა დავითვალოთ რამდენი განსხვავებული კომბინაციით შეუძლია ზურიკოს ხიდის გადალახვა. გადმოგვეცემა ხიდის სიგრძე და ინფორმაცია ჩატეხილ ფიცრებზე. 0 აღნიშნავს ჩატეხილ ფიცარს 1_ანი კი მთელს. დასაწყისისთვის ზურიკო დგას ხიდის ერთ მხარეს (არა პირველ ფიცარზე) და გადალახვად ჩათვლება ხიდის მეორე მხარე (ბოლო ფიცრის შემდეგი ნაბიჯი)

func countWays(n: Int, steps: [Int]) -> Int {
    var dp = [Int](repeating: 0, count: n + 1)
    dp[0] = 1
    
    for i in 1...n {
        if steps[i - 1] == 1 {
            dp[i] += dp[i - 1]
            if i >= 2 {
                dp[i] += dp[i - 2]
            }
        }
    }
    
    var result = 0
    
    if n >= 1 && steps[n - 1] == 1 {
        result += dp[n]
    }
    if n >= 2 && steps[n - 2] == 1 {
        result += dp[n - 1]
    }
    
    return result
}

countWays(n: 3, steps: [0, 1, 0])
countWays(n: 4, steps: [0, 1, 1, 0])
countWays(n: 5, steps: [1, 1, 0, 1, 1])

//MARK: - გადმოგეცემათ მთელი რიცხვი N. დაწერეთ ფუნქცია რომელიც დაითვლის რამდენი 0ით ბოლოვდება N! (ფაქტორიალი) შენიშვნა 1000! შედგება 2568 სიმბოლოსაგან.

func zeros(N: Int) -> Int {
    var count = 0
    var n = N
    
    while n >= 5 {
        n /= 5
        count += n
    }
    
    return count
}

zeros(N: 7)
zeros(N: 12)
zeros(N: 490)

