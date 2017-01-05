const DiplomaSample = React.createClass({
  //BEGIN***************************************************DECLARE
  clickHandler: function(){   
      this.props.chooseDiploma(this.props.item);
  },
  render: function() {
    var item = this.props.item
    var src_url = '/diploma_samples/' + item + '.jpg'
    var classImg = 'col-2of6 pd10 '
    if (this.props.diploma_id == item)
      classImg += 'emphasize'
    return (
      <img className={classImg} src={src_url}  onClick={this.clickHandler}/>
    );
  }
})
