import 'package:flutter/material.dart';
import 'nav_drawer.dart';
import 'paginator.dart';

class ListLayout extends StatelessWidget {
  final List<String> columns;
  final List<DataRow> rows;
  final String title;
  final int page;
  final int total;
  final bool loading;
  final void Function() onAdd;
  final void Function() onPrevPage;
  final void Function() onNextPage;

  ListLayout(
      {@required this.columns,
      @required this.rows,
      this.title = 'List',
      this.page = 1,
      this.total = 0,
      this.loading = false,
      this.onAdd,
      this.onPrevPage,
      this.onNextPage});

  @override
  Widget build(BuildContext context) {
    final ScrollController verticalController = ScrollController();
    final ScrollController horizontalController = ScrollController();

    List<DataColumn> dataColumns =
        columns.map((i) => DataColumn(label: Text(i))).toList();

    void Function() resetScroll = () {
      verticalController.jumpTo(0);
      horizontalController.jumpTo(0);
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
        bottom: loading
            ? PreferredSize(
                preferredSize: Size.fromHeight(8),
                child: LinearProgressIndicator(),
              )
            : null,
      ),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        controller: verticalController,
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              controller: horizontalController,
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: dataColumns,
                rows: rows,
              ),
            ),
            Paginator(
              current: page,
              total: total,
              onNext: () {
                resetScroll();
                onNextPage();
              },
              onPrev: () {
                resetScroll();
                onPrevPage();
              },
            )
          ],
        ),
      ),
    );
  }
}
