const TaskBox = React.createClass({
  //BEGIN***************************************************DECLARE
  propTypes: {
    tasks_url: React.PropTypes.string.isRequired
  },
  getInitialState: function () {
    return {
      complete_task: false,
      tasks_count: 10,
      tasks: [],
      num_current_task: 0,
      status_current_task: 0,   // 0 в процессе ответа, -1 неправильно, 1 правильно
      sum_right_answers: 0,
      diploma_id: 0,
      reward: false
    };
  },
  componentDidMount: function() {
    this.loadTasksFromServer();
  },
  componentWillUnmount: function(){
  },
  loadTasksFromServer: function() {
    $.ajax({
      url: this.props.tasks_url,
      dataType: 'json',
      data: {
        count: this.state.tasks_count
      },
      cache: false,
      success: function(data) {
        this.setState({
          complete_task: false,
          tasks: data
        });
      }.bind(this),
      error: function(xhr, status, err) {
        //CE(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  completeTask: function(){
    var num_current_task = this.state.num_current_task;

    var user_answer
    var radio = document.getElementsByName('var-ans'+this.state.tasks[num_current_task].id);
    for (var j = 0; j < radio.length; j++) {
      if (radio[j].type == "radio" && radio[j].checked){
        user_answer = radio[j].value
        break
      }
      if (j == radio.length - 1) user_answer = 'none'
    }

    var right_answer = 0, status_current_task = -1
    if(this.state.tasks[num_current_task].answer == user_answer){
      right_answer = 1
      status_current_task = 1
    }

    var sum_right_answers = this.state.sum_right_answers + right_answer
    this.setState({
      complete_task: true,
      status_current_task: status_current_task,
      sum_right_answers: sum_right_answers
    });
  },
  nextTask: function(){
    new_num_current_task = this.state.num_current_task + 1

    this.setState({
      complete_task: false,
      num_current_task: new_num_current_task,
      status_current_task: 0
    });
  },
  chooseDiploma: function(diploma_id){
    this.setState({
      diploma_id: diploma_id
    });
  },
  getReward: function(){
    var name_input = ReactDOM.findDOMNode(this.refs.name)
    var age_input = ReactDOM.findDOMNode(this.refs.age)
    var institution_input = ReactDOM.findDOMNode(this.refs.institution)
    var name = name_input.value.trim(), age = age_input.value.trim(), institution = institution_input.value.trim()

    if(this.state.diploma_id && name.length && age.length && institution.length){

      var prize
      sum_wrong_answers = 10 - this.state.sum_right_answers
      if(sum_wrong_answers == 0){
        prize = 1
      }else if(sum_wrong_answers == 1){
        prize = 2
      }else if(sum_wrong_answers == 2){
        prize = 3
      }else prize = 0
      
      reward = {
        name: name,
        age: age,
        institution: institution,
        prize: prize,
        score: this.state.sum_right_answers,
        contest_id: this.state.tasks[0].contest_id,
        number: this.state.diploma_id
      };
      $.ajax({
        url: '/rewards',
        //dataType: 'json',
        type: 'POST',
        data: {reward: reward},
        success: function(data) {
          this.setState({
            reward: true
          });
        }.bind(this),
        error: function(xhr, status, err) {
          //console.error(this.props.url, status, err.toString());
        }.bind(this)
      });
    }else{
      alert('Заполните все поля и выберите диплом!')
    }
  },
  render: function() {

    var sum = this.state.sum_right_answers, task_num = this.state.num_current_task + 1
    var content
    if(task_num <= this.state.tasks_count){

      var button_task
      if(!this.state.complete_task){
        button_task = <a className='btn btn-our btn-our-violete'
               onClick={this.completeTask}>Ответить</a>
      }else{
        if(task_num == this.state.tasks_count){
         button_task = <a className='btn btn-our btn-our-orange'
               onClick={this.nextTask}>Узнать результат!</a>
        }else{
          button_task = <a className='btn btn-our btn-our-green'
               onClick={this.nextTask}>Следующий вопрос</a>
        }
      }

      var like_answer
      if(this.state.status_current_task == 1){
        var mySound = new buzz.sound("/sounds/snap", {
            formats: [ "mp3", "wav" ],
            preload: true,
            autoplay: true,
            loop: false
        });
        like_answer = <div className='result col col-2of6 animated bounceIn'><span className='positive-result'><img src = '/images/success.png' /> <span>Правильно!</span></span></div>
      }else if (this.state.status_current_task == -1){
        var mySound = new buzz.sound("/sounds/metal_plate_2", {
            formats: [ "mp3", "wav" ],
            preload: true,
            autoplay: true,
            loop: false
        });
        like_answer = <div className='result col col-2of6 animated bounceIn'><span className='negative-result animated slideInRight'><img src = '/images/error.png' /> <span>Упс...</span></span></div>
      } 

      var tasks = this.state.tasks.map(function (task) {   // подумать над реализацией, чтобы постоянно значения не мапились в tasks
        return (
          <Task
            key={task.id}
            task={task}/>
        );
      }.bind(this));

      content = (
        <div className='participate-page'>
          {tasks[this.state.num_current_task]}
          <div className='wrap-bar-task'>
            <div className='statistics-tasks col col-2of6'>
              <div>
                <span className='sum-progress'><img src = '/images/like.png' /> <span>{sum}</span></span>
                <span className='sum-progress'><img src = '/images/database1.png' /> <span>{task_num}/{this.state.tasks_count}</span></span>
              </div>
              <div className='clearboth'></div>
            </div>
            <div className='col col-2of6 button-task'>
              {button_task}
            </div>
            {like_answer}
            <div className='clearboth'></div>
          </div>
        </div>
      );
    }else{

      var button_get_prize = <a className='btn btn-our btn-our-violete'
               onClick={this.getReward}>Получить награду!</a>

      var diploma_samples = [1,2,3,4,5,6,7,8,9,10].map(function (n) {
        return (
          <DiplomaSample
          key={n}
          item={n}
          chooseDiploma={this.chooseDiploma}
          diploma_id={this.state.diploma_id} />
        );
      }.bind(this));

      content = (
        <div className='participate-page'>
          <div className='participate-result animated bounceIn'>
            <div className='h3 clrw mtl'>Поздравляем! Вы успешно прошли олимпиаду!</div>
            <div className='h1 clrw mbm'>Ваши баллы: {this.state.sum_right_answers}</div>
            <p>Заполняя данные для получения диплома, вы даете согласие на обработку персональных данных</p>
            <div className='user-data'>
              <div>
                <input className='tac' ref='name' type='text' placeholder='Электронная почта' />
              </div>
              <div>
                <input className='tac' ref='name' type='text' placeholder='Фамилия и имя участника' maxLength="25" />
              </div>
              <div>
                <input className='tac' ref='age' type='text' placeholder='Класс' maxLength="44" />
              </div>
              <div>
                <input className='tac' ref='institution' type='text' placeholder='Учебное заведение' maxLength="44" />
              </div>
            </div>
            <div className='diploma-samples mbm'>
              <h4>Выберите диплом</h4>
              {diploma_samples}
              <div className='clear'></div>
            </div>
            <div className='clear'></div>
            {button_get_prize}
          </div>
        </div>
      );
    }

    if(this.state.reward){
      content = (
        <div className='participate-page'>
          <div className='participate-result-diploma'>
            <div className='card pd40 h1 mbm'>Вы можете приобрести свой диплом в разделе <a href='/rewards'>ИТОГИ</a>.</div>
          </div>
        </div>
      );
    }

    return (
      <div>
        {content}
      </div>
    );
  }
});

