import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

//页面布局，Dart语言

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleSection = _TitleSection(
        'Oeschinen Lake Campground', 'Kandersteg, Switzerland', 41);
    final Widget buttonSection = Container(
      child: Row(
        // 沿水平方向平均放置
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(context, Icons.call, 'CALL'),
          _buildButtonColumn(context, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(context, Icons.share, 'SHARE'),
        ],
      ),
    );
    final textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. 
        Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. 
        A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, 
        leads you to the lake, which warms to 20 degrees Celsius in the summer. 
        Activities enjoyed here include rowing, and riding the summer toboggan run.''',
        softWrap: true,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Top Lakes'),
        ),
        // 由于我们的内容可能会超出屏幕的长度，这里把内容都放到 ListView 里。
        // 除了这种用法，ListView 也可以像我们在 Android 原生开发中使用 ListView 那样，
        // 根据数据动态生成一个个 item。这个我们在下一节再来学习
        body: ListView(
          children: <Widget>[
            Image.asset(
              'images/6466.jpg',
              width: 600.0,
              height: 240.0,
              // cover 类似于 Android 开发中的 centerCrop，其他一些类型，读者可以查看
              // https://docs.flutter.io/flutter/painting/BoxFit-class.html
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ));
  }
}

///////////////////////////////20190408//////////////////////////////////
//https://mp.weixin.qq.com/s/V0cL9bSTM65HTIJ4CU4Cow

Widget _buildButtonColumn(BuildContext context, IconData icon, String label) {
  final color = Theme.of(context).primaryColor;

  return Column(
    // main axis 跟我们前面提到的 cross axis 相对应，对 Column 来说，指的就是竖直方向。
    // 在放置完子控件后，屏幕上可能还会有一些剩余的空间（free space），min 表示尽量少占用
    // free space；类似于 Android 的 wrap_content。
    // 对应的，还有 MainAxisSize.max
    mainAxisSize: MainAxisSize.min,
    // 沿着 main axis 居中放置
    mainAxisAlignment: MainAxisAlignment.center,

    children: <Widget>[
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );
}

/**
 * 标题栏复杂布局
 */
class _TitleSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final int starCount;

  _TitleSection(this.title, this.subtitle, this.starCount);

  @override
  Widget build(BuildContext context) {
    // 为了给 title section 加上 padding，这里我们给内容套一个 Container
    return Container(
      // 设置上下左右的 padding 都是 32。类似的还有 EdgeInsets.only/symmetric 等
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          // 这里为了让标题占满屏幕宽度的剩余空间，用 Expanded 把标题包了起来
          Expanded(
            // 再次提醒读者，Expanded 只能包含一个子元素，使用的参数名是 child。接下来，
            // 为了在竖直方向放两个标题，加入一个 Column。
            child: Column(
              // Column 是竖直方向的，cross 为交叉的意思，也就是说，这里设置的是水平方向
              // 的对齐。在水平方向，我们让文本对齐到 start（读者可以修改为 end 看看效果）
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 聪明的你，这个时候肯定知道为什么突然加入一个 Container 了。
                // 跟前面一样，只是为了设置一个 padding
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),

          // 这里是 Row 的第二个子元素，下面这两个就没用太多值得说的东西了。
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),

          Text(starCount.toString())
        ],
      ),
    );
  }
}

class TestStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          color: Colors.amberAccent,
        ),
        Text("TestStack")
      ],
      alignment: const Alignment(-0.5, -0.5),
    );
  }
}

class TestExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: RaisedButton(
            child: Text("btn1"),
            color: Colors.red,
            onPressed: () {},
          ),
        ),
        Expanded(
          flex: 2,
          child: RaisedButton(
            child: Text("btn2"),
            color: Colors.blue,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}

class MessageForm extends StatefulWidget {
  @override
  State createState() {
    return new _MessageFormState();
  }
}

class _MessageFormState extends State<MessageForm> {
  var editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: editController,
          ),
        ),
        RaisedButton(
          child: Text("click"),
          color: Colors.blue,
//          onPressed: () => debugPrint("11111111111111"),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text("标题"),
                    content: Text(editController.text),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("OK"),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  );

//                  return new SimpleDialog(
//                    title: Text("选择"),
//                    children: <Widget>[
//                      SimpleDialogOption(
//                        child: Text("选项 1"),
//                        onPressed: () {
//                          Navigator.of(context).pop();
//                        },
//                      ),
//                      SimpleDialogOption(
//                          child: Text("选项 2"),
//                          onPressed: () {
//                            Navigator.of(context).pop();
//                          })
//                    ],
//                  );
                });
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    editController.dispose();
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  final _saved = new Set<WordPair>();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(
          () {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          },
        );
      },
    );
  }

  void _pushSaved() {
    _test();

    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}

void _test() {
  _String();
  _List();
  _Map();
}

void _Map() {
//  Map的声明
  var hawaiianBeaches = {
    'oahu': ['waikiki', 'kailua', 'waimanalo'],
    'big island': ['wailea bay', 'pololu beach'],
    'kauai': ['hanalei', 'poipu']
  };
  var searchTerms = new Map();
  // 指定键值对的参数类型
  var nobleGases = new Map<int, String>();
  // Map的赋值，中括号中是Key，这里可不是数组
  nobleGases[54] = 'dart';
  //Map中的键值对是唯一的
  //同Set不同，第二次输入的Key如果存在，Value会覆盖之前的数据
  nobleGases[54] = 'xenon';
  assert(nobleGases[54] == 'xenon');
  // 检索Map是否含有某Key
  assert(nobleGases.containsKey(54));
  //删除某个键值对
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));
  assert(!nobleGases.containsKey(54));
}

void _List() {
  var vegetables = [];
  // 或者简单的用List来赋值
  var fruits = ['apples', 'oranges'];
  // 添加元素
  fruits.add('kiwis');
  // 添加多个元素
  fruits.addAll(['grapes', 'bananas']);
  // 获取第一个元素
  fruits.first;
  // 获取元素最后一个元素
  fruits.last;
  // 查找某个元素的索引号
  assert(fruits.indexOf('apples') == 0);
  // 删除指定位置的元素，返回删除的元素
  //  fruits.removeAt(index);
  // 删除指定元素,成功返回true，失败返回false
  fruits.remove('apples');
  // 删除最后一个元素，返回删除的元素
  fruits.removeLast();
  // 删除指定范围元素，含头不含尾，成功返回null
  //  fruits.removeRange(start, end);
  // 删除指定条件的元素，成功返回null
  fruits.removeWhere((item) => item.length > 6);
  // 删除所有的元素
  fruits.clear();
  // sort()对元素进行排序，传入一个函数作为参数，return <0表示由小到大， >0表示由大到小
  fruits.sort((a, b) => a.compareTo(b));
}

void _String() {
  // String -> int
  var one = int.parse('1');
// String -> double
  var onePointOne = double.parse('1.1');
// int -> String
  String oneAsString = 1.toString();
// double -> String 注意括号中要有小数点位数，否则报错
  String piAsString = 3.14159.toStringAsFixed(2);

  var s = 'Android Developer';
  print('A Commpany has a $s, which is good idea.' ==
      'A Commpany has a Android Developer,' + ' which is good idea.');
  print('I am a ' + '${s.toUpperCase()} is very hornor!' ==
      'I am a ' + 'ANDROID DEVELOPER is very hornor!');
}
