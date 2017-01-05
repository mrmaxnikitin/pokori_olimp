var game = new Phaser.Game(
    800,
    600,
    Phaser.AUTO,
    'game',
    {
        preload: preload,
        create: create,
        update: update
    }
);


function preload() {
    game.load.image('button_yes', '../assets/diamond.png');
    game.load.image('button_no', '../assets/diamond.png');
}
var task, n1, n2, arithmetic_sign, answer, current_answer, btn_yes, btn_no, btn_group, arrow_answers, text_expression;
var score, text_score;
var buttonPressed = false;
function create() {

    //  Мы будем использовать физику, для этого добвам в наш мир
    //  аркадную физику
    //game.physics.startSystem(Phaser.Physics.ARCADE);
    score = 0;
    text_score = game.add.text(20, 20, "Правильных ответов: " + score, { font: "25px Arial", fill: "#ff0044", align: "center" });

    generateExpression();

    if(answer==current_answer) game.stage.backgroundColor = '#0072bc';
    

    var style = { font: 'bold 50pt Arial', fill: 'white', align: 'left', wordWrap: true, wordWrapWidth: 450 };
    text_expression = game.add.text(game.world.centerX, game.world.centerY - 75, task, style);
    text_expression.anchor.set(0.5);

    btn_group = game.add.group();
    btn_yes = game.add.button(game.world.centerX + 80, game.world.centerY+15, 'button_yes', clickYes, this);
    btn_no = game.add.button(game.world.centerX - 80, game.world.centerY+15, 'button_no', clickNo, this);
    btn_yes.anchor.set(1);
    btn_no.anchor.set(1);
    // Создаем группу для выступов на которые мы будем прыгать
    /*platforms = game.add.group();

    //  Добавляем физику для всех объектов группы
    platforms.enableBody = true;

    // Создаем пол
    var ground = platforms.create(0, game.world.height - 64, 'ground');

    //  Подгоняем размер пола по размерам игры (оригинальный спрайт размером 400x32)
    ground.scale.setTo(2, 2);

    //  Предотвращаем "перемещение" пола
    ground.body.immovable = true;

    //  Создаем два выступа и предотвращаем их "перемещение"
    var ledge = platforms.create(400, 400, 'ground');

    ledge.body.immovable = true;

    ledge = platforms.create(-150, 250, 'ground');

    ledge.body.immovable = true;



    // Персонаж и настройки для него
    player = game.add.sprite(32, game.world.height - 150, 'dude');

    // Добавляем физику для персонажа
    game.physics.arcade.enable(player);

    //  Настройки. Добавим небольшой отскок при приземлении.
    player.body.bounce.y = 0.2;
    player.body.gravity.y = 400;
    player.body.collideWorldBounds = true;

    //  Добавим две анимации для движения влево и вправо
    player.animations.add('left', [0, 1, 2, 3], 10, true);
    player.animations.add('right', [5, 6, 7, 8], 10, true);

    cursors = game.input.keyboard.createCursorKeys();*/
    arrow_answers = game.input.keyboard.createCursorKeys();
    

}
function clickYes (element) {
   if(answer == current_answer){
    score++;
   }
   else{

   }
   text_score.text = "Правильных ответов: "+score;
   generateExpression();
   text_expression.text = task;
   if(answer==current_answer) game.stage.backgroundColor = '#0072bc';
   else game.stage.backgroundColor = '#000';
}
function clickNo (element) {
   if(answer != current_answer){
    score++;
   }
   text_score.text = "Правильных ответов: "+score;
   generateExpression();
   text_expression.text = task;
   if(answer==current_answer) game.stage.backgroundColor = '#0072bc';
   else  game.stage.backgroundColor = '#000';
}
function getRandom (min_num, max_num){
    return Math.floor(Math.random() * (max_num - min_num + 1)) + min_num;
}
function randomResult (answer, current_answer){
    if(getRandom(0, 100) > 40)
        return current_answer;
    return answer;
}
function generateExpression () {
    var minus_sign = 1;
    var plus_sign = 2;
    var result_deviation;
    n1 = getRandom(0, 100);
    n2 = getRandom(0, 100);
    arithmetic_sign = getRandom(minus_sign, plus_sign);

    if(arithmetic_sign == 2){
        answer = n1 + n2;
        result_deviation = answer + getRandom(-10, 10);
        current_answer = randomResult(answer, result_deviation)
        task = n1+" + "+n2+" = "+current_answer;   
    }
    else{
        answer = n1 - n2;
        result_deviation = answer + getRandom(-10, 10);
        current_answer = randomResult(answer, result_deviation)
        task = n1+" - "+n2+" = "+current_answer;
    }
}

function update() {
    if (arrow_answers.left.isDown && !buttonPressed){
        buttonPressed = true;
        clickYes();
        generateExpression();
    }
    else if(arrow_answers.right.isDown && !buttonPressed){
        buttonPressed = true;
        clickNo();
        generateExpression();
    }
    //  Проверка на столкновение игрока с полом
    /*game.physics.arcade.collide(player, platforms);

    //  Обнулим скорость перемещения персонажа в пространстве
    player.body.velocity.x = 0;

    if (cursors.left.isDown)
    {
        //  Движение влево
        player.body.velocity.x = -150;

        player.animations.play('left');
    }
    else if (cursors.right.isDown)
    {
        //  Движение вправо
        player.body.velocity.x = 150;

        player.animations.play('right');
    }
    else
    {
        //  Состояние покоя
        player.animations.stop();

        player.frame = 4;
    }

    //  Высота прыжка
    if (cursors.up.isDown && player.body.touching.down)
    {
        player.body.velocity.y = -350;
    }*/

}