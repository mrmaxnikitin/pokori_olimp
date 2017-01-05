const Game1 = React.createClass({
  //BEGIN***************************************************DECLARE
  propTypes: {
    
  },
  getInitialState: function () {
    return {
      score: 0,
      current_expression: '',
      current_answer: 0,
      right_answer: 0,
      range_right_answer: 0
    };
  },
  componentDidMount: function () {
    this.generateExpression()
  },
  getRandom: function (min_num, max_num) {
    return Math.floor(Math.random() * (max_num - min_num + 1)) + min_num;
  },
  randomResult: function (answer, result_deviation) {
    if(this.getRandom(0, 100) > 40)
        return result_deviation;
    return answer;
  },
  generateExpression: function () {
    var minus_sign = 1;
    var plus_sign = 2;
    var arithmetic_sign = this.getRandom(minus_sign, plus_sign);

    var result_deviation, right_answer, current_answer, current_expression;
    var n1 = this.getRandom(0, 100);
    var n2 = this.getRandom(0, 100);

    if(arithmetic_sign == 2){
        right_answer = n1 + n2;
        result_deviation = right_answer + this.getRandom(-15, 15);
        current_answer = this.randomResult(right_answer, result_deviation)
        current_expression = n1+" + "+n2+" = "+current_answer;   
    }
    else{
        right_answer = n1 - n2;
        result_deviation = right_answer + this.getRandom(-15, 15);
        current_answer = this.randomResult(right_answer, result_deviation)
        current_expression = n1+" - "+n2+" = "+current_answer;
    }

    this.setState({
      current_expression: current_expression,
      current_answer: current_answer,
      right_answer: right_answer
    });
  },
  answerNot: function (){
    var current_answer = this.state.current_answer
    var right_answer = this.state.right_answer
    var score = this.state.score
    var range_right_answer = this.state.range_right_answer

    if(current_answer != right_answer){
      range_right_answer++;
      score += 10;
      $('.card').addClass('get-right-answer');
      setTimeout(function () {
        $('.card').delay(1000).removeClass('get-right-answer')
      }, 505);
    }else{
      range_right_answer = 0;
      $('.card').addClass('get-wrong-answer');
      setTimeout(function () {
        $('.card').delay(1000).removeClass('get-wrong-answer')
      }, 505);

    }

    this.setState({
      score: score,
      range_right_answer: range_right_answer
    });
    this.generateExpression()
  },
  answerYes: function (){
    var current_answer = this.state.current_answer
    var right_answer = this.state.right_answer
    var score = this.state.score
    var range_right_answer = this.state.range_right_answer

    if(current_answer == right_answer){
      range_right_answer++;
      score += 10;
      $('.card').addClass('get-right-answer');
      setTimeout(function () {
        $('.card').delay(1000).removeClass('get-right-answer')
      }, 505);
    }else{
      range_right_answer = 0;
      $('.card').addClass('get-wrong-answer');
      setTimeout(function () {
        $('.card').delay(1000).removeClass('get-wrong-answer')
      }, 505);
    }

    this.setState({
      score: score,
      range_right_answer: range_right_answer
    });
    this.generateExpression()
  },
  render: function() {
    function clickArrows(e) {
      if (e.keyCode == 49) {
        console.log('left')
      }
      if (e.keyCode == 50) {
        console.log('right')
      }
    }
    document.onkeypress = clickArrows;


    var score = this.state.score
    var current_expression = this.state.current_expression
    if(this.state.range_right_answer){
      $('.range').empty();
      for(var i = 0; i < this.state.range_right_answer; i++)
       $('.range').append("<img src='/images/success.png' />");
    }
    else{
       $('.range').empty();
       $('.range').append("<img src='/images/success_grey.png' />");
    }

    return (
      <div>
        <div className='result'>
          <h1>{score}</h1>
        </div>
        <div className='card'>
          <div className='content'>
            <div className='range'>
              <img src='/images/success_grey.png' />
            </div>
            <h1>{current_expression}</h1>
          </div>
          <div className='buttons'>
            <button className='btn btn-our btn-our-red' onClick={this.answerNot}>Неверно</button>
            <button className='btn btn-our btn-our-green' onClick={this.answerYes}>Верно</button>
          </div>
        </div>
      </div>
    );
  }
});
