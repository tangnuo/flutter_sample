import 'package:flutter/material.dart';

/// 1、导航到新页面并返回
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SecondScreen();
            }));
          },
          child: Text("next screen"),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("back"),
        ),
      ),
    );
  }
}

/// 2、给新页面传值
class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class PassingDataApp extends StatelessWidget {
  final List<Todo> items = List.generate(
    20,
    (index) => Todo(
      'Todo $index',
      'A description of what needs to be done for Todo $index',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passing Data',
      home: TodoScreen(items),
    );
  }
}

/// 列表页面
class TodoScreen extends StatelessWidget {
  final List<Todo> todos;

  TodoScreen(this.todos);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(todos[index])),
              );
            },
          );
        },
        itemCount: todos.length,
      ),
    );
  }
}

/// 详情页面
class DetailScreen extends StatelessWidget {
  final Todo todo;

  DetailScreen(this.todo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}

/// 3、从新页面返回数据给上一个页面
class NavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Returning App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Returning Data Demo'),
        ),
        body: Center(
          child: SelectionButton(),
        ),
      ),
    );
  }
}

// 添加一个打开选择页面的按钮。
class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Pick an option, any option!'),
    );
  }
}

_navigateAndDisplaySelection(BuildContext context) async {
  final result = await Navigator.push(
      context, MaterialPageRoute(builder: (context) => SelectionScreen()));

  Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, 'Yep!');
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context, 'Nope!');
                },
                child: Text('Nope!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
