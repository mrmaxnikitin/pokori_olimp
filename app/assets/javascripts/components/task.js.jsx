const Task = React.createClass({
  //BEGIN***************************************************DECLARE
  render: function() {
    var task = this.props.task

    var name_radio = "var-ans" + task.id
    var id_radio = "var" + task.id
    return (
      <div className='task-participate animated fadeIn'>
        <img src= {task.image} />
        <div className='task-body'>
          <div className='text'>
            {task.text}
          </div>
          <div className='variants'>
            <p className='wrap-radio'>
              <input className="radioanswer" type="radio" name={name_radio} id={id_radio+'1'} value="1" />
              <label htmlFor={id_radio+'1'}>{task.var1}</label>
            </p>
            <p className='wrap-radio'>
              <input className="radioanswer" type="radio" name={name_radio} id={id_radio+'2'} value="2" />
              <label htmlFor={id_radio+'2'}>{task.var2}</label>
            </p>
            <p className='wrap-radio'>
              <input className="radioanswer" type="radio" name={name_radio} id={id_radio+'3'} value="3" />
              <label htmlFor={id_radio+'3'}>{task.var3}</label>
            </p>
            <p className='wrap-radio'>
              <input className="radioanswer" type="radio" name={name_radio} id={id_radio+'4'} value="4" />
              <label htmlFor={id_radio+'4'}>{task.var4}</label>
            </p>
          </div>
        </div>
        <div className='clearboth'>
        </div>
      </div>
    );
  }
})
