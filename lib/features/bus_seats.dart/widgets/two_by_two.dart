import 'package:flutter/material.dart';
import 'package:moovbe/utils/moovbe_icons_icons.dart';

import '../../../utils/colors.dart';

class TwoByTwo extends StatefulWidget {
  const TwoByTwo({
    Key? key,
  }) : super(key: key);

  @override
  State<TwoByTwo> createState() => _TwoByTwoState();
}

class _TwoByTwoState extends State<TwoByTwo> {
  final _chairStatus = [
    [1, 1, 1, 1, 1],
    [1, 3, 1, 1, 1],
    [1, 1, 1, 2, 1],
    [2, 2, 2, 1, 1],
    [1, 1, 1, 1, 1],
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: colorDCDCDC),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 30, right: 10),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  MoovbeIcons.seat,
                  color: color2a2a2a,
                  size: 30,
                ),
              ),
            ),
            for (int i = 0; i < 5; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  margin: EdgeInsets.only(top: i == 0 ? 10 : 0),
                  child: Row(
                    children: <Widget>[
                      for (int x = 1; x < 6; x++)
                        Expanded(
                          child: (x == 3)
                              ? Container()
                              : Container(
                                  height: 60,
                                  margin: const EdgeInsets.all(5),
                                  child: _chairStatus[i][x - 1] == 1
                                      ? availableChair(i, x - 1)
                                      : _chairStatus[i][x - 1] == 2
                                          ? selectedChair(i, x - 1)
                                          : reservedChair(),
                                ),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget selectedChair(int a, int b) {
    return InkWell(
      onTap: () {
        _chairStatus[a][b] = 1;
        setState(() {});
      },
      child: const Center(
          child: Icon(
        MoovbeIcons.seat,
        color: colorRed,
        size: 30,
      )),
    );
  }

  Widget availableChair(int a, int b) {
    return InkWell(
      onTap: () {
        _chairStatus[a][b] = 2;
        setState(() {});
      },
      child: const Center(
          child: Icon(
        MoovbeIcons.seat,
        color: colorDCDCDC,
        size: 30,
      )),
    );
  }

  Widget reservedChair() {
    return const Center(
        child: Icon(
      MoovbeIcons.seat,
      color: color2a2a2a,
      size: 30,
    ));
  }
}
