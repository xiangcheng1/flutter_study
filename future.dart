void main() {
  // test1();
  // test2();
  // test3();
  // test4();
  // test5();
  // test6();
  // test7();
  // test8();
  // test9();
  // test10();
  test11();
}

test11() async {
  print("test11函数开始了：${DateTime.now()}");
  print(await firstString2());
  print(await secondString2());
  print(await thirdString2());
  print("test11函数结束了：${DateTime.now()}");
}

firstString2() async {
  return Future.delayed(Duration(milliseconds: 300), () {
    return "我是一个字符串";
  });
}

secondString2() {
  return Future.delayed(Duration(milliseconds: 300), (() {
    return "我是二个字符串";
  }));
}

thirdString2() {
  return Future.delayed(Duration(milliseconds: 300), (() {
    return "我是三个字符串";
  }));
}

test10() {
  print("test10函数开始了");
  firstString1();
  secondString1();
  thirdString1();
  print("test10函数结束了");
}

firstString1() async {
  print("firstString函数开始了");
  Future future = Future.delayed(Duration(milliseconds: 300), () {
    return "我是一个字符串";
  });
  print(await future);
  print("firstString函数结束了");
}

secondString1() {
  print("我是二个字符串");
}

thirdString1() {
  print("我是三个字符串");
}

test9() {
  print("test9函数开始了");
  firstString();
  secondString();
  thirdString();
  print("test9函数结束了");
}

firstString() async {
  print("firstString函数开始了");
  Future.delayed(Duration(milliseconds: 300), () {
    return "我是一个字符串";
  }).then((value) => {print(value)});
  print("firstString函数结束了");
}

secondString() {
  print("我是二个字符串");
}

thirdString() {
  print("我是三个字符串");
}

test8() async {
  Future f1 = Future.delayed(Duration(milliseconds: 2000), () {
    return "我是第一个";
  });
  Future f2 = Future(() {
    return "我是第二个";
  });
  f2.then((value) => print("哦哦哦"));
  print("开始了${DateTime.now()}");
  print("${await f1} : ${await f2}");
  print("结束了：${DateTime.now()}");
}

test7() async {
  Future f1 = new Future(() => null);
  Future f2 = new Future(() => null);

  f1
      .then((value) {
        return Future.error("错误了");
      })
      .then((value) => print("执行成功了吗"), onError: (error) => print(error))
      .then((value) => Future.error("错了！"))
      .catchError((error) => {print("我也发现：$error")});

  f2.then((value) {
    print("我是f2");
    Future f3 = Future(() => null);
    f3.then((value) => print("我是f3"));
    return new Future(() => {print("全新的Future")});
  }).whenComplete(() => print("完成了"));
}

test6() {
  Future f2 = Future(() => null);

  f2
      .then((value) {
        print("我是真正的f2");
        Future f1 = Future(() => null);
        f1.then((value) => print("我是f1"));
        return new Future(() => {print("全新的Future")});
      })
      .then((value) => print("我还是f2吗"))
      .then((value) => print("我是个锤子"));
}

void test5() async {
  Future f2 = Future(() => null);
  f2
      .then((value) {
        print("我是真正的f2");
        Future f1 = Future(() => null);
        f1.then((value) => print("我是f1"));
        return "f2返回结果";
      })
      .then((value) => print(value))
      .then((value) => print("我还是f2吗啊"));
}

void test4() {
  Future f1 = new Future(() => null);
  Future f2 = new Future(() => null);
  Future f3 = new Future(() => {print("创建f3")});

  f3.then((value) => print("我是f3"));
  f2
      .then((value) {
        print("我是f2");
        new Future(() => print("我是一个新的"));
        f1.then((value) => print("我是f1"));
      })
      .then((value) => print("我还是f2.2"))
      .then((value) => print("我还是f2.2.2"));
}

void test3() {
  Future f1 = new Future(() => null);
  Future f2 = new Future(() => null);
  Future f3 = new Future(() => {print("创建f3")});

  f3.then((value) => print("我是f3"));
  f2.then((value) => print("我是f2"));
  f1.then((value) => print("我是f1"));
}

void test2() {
  Future.delayed(Duration(milliseconds: 200), () {
    print("我是延迟的Future");
  });
  var future = Future.value("我是Future");
  future.then((value) => print(value));
}

void test1() {
  Future f1 = Future(() {
    print("我是第一个");
  });
  f1.then((value) => print("f1 then"));
  print("main");
}
