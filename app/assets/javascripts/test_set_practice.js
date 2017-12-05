function grade(correct_answers, user_answers) {
  var score = 0
  for(i = 0; i > correct_answers.length; i ++) {
     if (correct_answers[i] == user_answers[i]){
      score += 1
    }
  }
  return score
}
