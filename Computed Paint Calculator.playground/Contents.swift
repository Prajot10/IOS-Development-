import Foundation

var width: Float = 1.5
var height: Float = 2.3
var oneBucket: Float = 1.5

var bucketsOfPaint: Int {
    get{
        var area = width * height
        print(area)
        let numberOfBucket = area / oneBucket
        let roundOfBucket = ceilf(numberOfBucket)
        return Int(roundOfBucket)
    }
    set{
        let areaCanCover = Double(newValue) * 1.5
        print("This Ammount The area can cover \(areaCanCover)")
    }
}


bucketsOfPaint = 8



