
import 'package:flutter/material.dart';
class SimpleListDialog<T> extends StatefulWidget {
  final String title;
  final List<T> list;
  final int initSelected;
  SimpleListDialog(this.title, this.list, {this.initSelected});

  @override
  State<StatefulWidget> createState()=>SimpleListState();
}

class SimpleListState extends State<SimpleListDialog> {
  int _selectId = -1;

  @override
  void initState() {
    _selectId=widget.initSelected??-1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget contentWidget;

    contentWidget = Flexible(
      child: _buildContent(context)
      ,
    );

    Widget dialogChild = IntrinsicWidth(
      stepWidth: 56.0,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 280.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[_buildTitle(context), contentWidget],
        ),
      ),
    );

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: dialogChild,
      clipBehavior: Clip.antiAlias,
    );
  }

  _buildItem(BuildContext context, int index) {
    return   InkWell(

      onTap: (){
        setState(() {
          _selectId=index;
        });
      },

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27,vertical: 15),
        child: Row(children: [
          Expanded(
              child: Text(
                "${widget.list[index]}",
                style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
              )),
          Image.asset(
            _selectId ==index?'images/ic_checked_blue.png':'images/ic_unchecked.png' ,
            width: 16,
            height: 16,
          ),
        ]),
      ) ,
    );
  }

  _buildContent(context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _buildItem(context,index);
        },
        separatorBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 27),
            color: Color(0xFFeeeeee),
            height: 1,
          );
        },
        itemCount: widget.list.length);
  }

  _buildTitle(context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              SizedBox(
                height: 24,
                width: 60,
              ),
              Expanded(
                child: Text(
                  '${widget.title}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333)),
                ),
              ),
              Container(
                  decoration: BoxDecoration(),
                  height: 24,
                  width: 60,
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12)))),
                        padding: MaterialStateProperty.all(EdgeInsets.only(
                            right: 0, left: 0, top: 0, bottom: 0)),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.blue)),
                    child: Text(
                      '确定',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(_selectId);
                    },
                  ))
            ],
          ),
        ),
        Container(
          height: 1,
          color: Color(0xFFeeeeee),
        )
      ],
    );
  }
}
