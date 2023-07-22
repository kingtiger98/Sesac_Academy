import UIKit

// Raw String이란?
// 문자열에서 "나 \를 사용할 떈 앞에 \를 붙여야하는 불편함이 있습니다.
// 하지만 Raw String을 사용하면 #"원하는문자열"# , 이러한 불편함을 해소할 수 있습니다.

// ex) I love "YOU"를 출력

// 기존의 방법
let sentence1: String = "I love \"YOU\""
print(sentence1)

// Raw String 사용
let sentence2: String = #"I love "YOU""#
print(sentence2)

// 즉, Raw String에서는 #" "# 안에 내용을 작성한다면
//  ㄴ 경계문자, 이스케이프 문자가 그대로 문자열과 같이 출력됩니다.


// 단 주의할 점이 크게 두 가지가 있습니다.

// 1. 이스케이프 문자를 단순히 출력하기 때문에 줄바꿈(\n)을 할 땐 뒤에 #를 붙여줘야 합니다. => \#n
// ex) 이스케이프 문자 사용하기
let useEscapeWord: String = #"이스케이프 문자는 \#n이렇게 사용하세요!"#
print(useEscapeWord)

// 2. 문자열 보간 사용시에도 똑같이 주의하여 사용해주시면 됩니다.
// ex) 문자열 보간 사용하기
let name: String = "황재하"
let intepolationUse: String = #"열심히 하는 iOS 개발자 \#(name)입니다!"#
print(intepolationUse)
