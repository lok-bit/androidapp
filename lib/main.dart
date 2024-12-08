import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipPath example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green,),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final tabs=[
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return Scaffold(
      appBar: AppBar(title: Text('我的自傳'),
        centerTitle: true,),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        iconSize: 30,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: currentIndex==0?Image.asset('assets/1.jpg', width: 40, height: 40,):Image.asset('assets/1.jpg', width: 30, height: 30,), label: '自我介紹',),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '學習歷程',),
          BottomNavigationBarItem(icon: Icon(Icons.scale_outlined), label: '學習計畫',),
          BottomNavigationBarItem(icon: Icon(Icons.engineering), label: '專業方向',),
        ],
        onTap: (index) {
          setState(() {
            previousIndex=currentIndex;
            currentIndex=index;
            if (index==0) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("1.mp3"));
            }
            if (index==1) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("2.mp3"));
            }
            if (index==2) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("3.mp3"));
            }
            if (index==3) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("4.mp3"));
            }
          });
        },
      ),

    );
  }
}

class Screen1 extends StatelessWidget {
  Screen1({super.key});

  String s1='我出生在一個經濟能力小康的家庭，父親是個國中老師，母親是個公務員，在水利署上班，而姊姊和我都還在學校求學。父母嚴厲的管教我們，規定我們睡覺的時間、吃飯時間，維持健康的生活作息，爸爸在小時候總告訴我，睡覺、吃飯、上廁所是生活最重要的事情，對我沒有準時做這些事很不高興。'
      '在小學時代的我很活潑、很好動，一開始在課業上表現平平，但在小學三年級爸爸決定監督我的學校成績後，我的成績一直在進步。我在小學最有興趣的科目是自然，因為我從小在家就喜歡看媽媽給我訂購的每月的巧連智，也養成興趣讓我看更多地球科學相關的雜誌，所以自然是我唯一能贏過班上學霸的科目。'
      '小學畢業後，進入了一所還不錯的公立國中，不過同學變得不再像以前那樣好相處，跟家人相處也不融洽，於是我決定轉學到一間私立學校，在那邊住宿，暫時離開家裡。在那裡我學會了許多應有的禮節與待人處世的道理，也找到了我人生的目標，我希望可以用我的能力幫助許多人，所以我決定不直升那所學校的高中，我要回去面對我爸媽然後看更多的世界。'
      '進明道中學後，每天都覺得很充實、很快樂。在那裡我交到了許多朋友，有朋友能夠陪我一起玩，也有朋友能夠陪我一起讀書。我決定要看看自己的實力能不能達成目標，所以我努力學習，讓高三時班上有一個很好的學習環境，在學校我可以問同學問題他們都會很好心的回答，家裡可以問爸爸這個物理老師，所以我的課業一直在進步，直到最後統測的成績出來依舊是我考得最好的一次。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who an I', style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.bold),),
          ),
          //自傳部分
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20),),
          ),
          SizedBox(height: 15,),
          Container(
            color: Colors.redAccent,
            child: Image.asset('assets/rab1.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width:2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('assets/f1.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width:2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('assets/1.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Center(
        child: Text(
        '學習歷程',
        style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        ),
        ),
        ),
        ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // 大一時期
            buildLearningCard(
              title: '大一時期',
              content:
              '在大一期間，我專注於提升自己的英文能力，並初步接觸了組合語言的基礎知識。同時，努力考取了一些基礎的證照，如電腦操作相關證照。此外，積極參加校內外活動，擴展自己的人際關係網絡。',
              backgroundColor: Colors.lightBlue.shade50,
            ),
            SizedBox(height: 20),

            // 大二時期
            buildLearningCard(
              title: '大二時期',
              content:
              '進入大二，我學習了資料結構與演算法，還有網際網路的原理。透過實習課程，我將理論應用於實踐，同時加深了程式設計技能。此外，我還參與了幾個團隊專案，增強了團隊合作與溝通能力。',
              backgroundColor: Colors.green.shade50,
            ),
            SizedBox(height: 20),

            // 大三時期
            buildLearningCard(
              title: '大三時期',
              content:
              '在大三期間，我參與了學術研究專案，幫助專題教授處理大數據還有訓練AI模型。在課程上學習了作業系統，使我更加了解電腦運作的原理。在這段期間，我還完成了自己的第一個完整應用程式開發。',
              backgroundColor: Colors.orange.shade50,
            ),
          ],
        ),
      ),
    );
  }


  // Helper method to build a learning card
  Widget buildLearningCard({
    required String title,
    required String content,
    required Color backgroundColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(2, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class Screen3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大一時期'),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 150,
                width: 200,
                child: ListView(
                  children: [
                    Text('1. 學好英文'),
                    Text('2. 組合語言'),
                    Text('3. 考取證照'),
                    Text('4. 人際關係'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大二時期'),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 150,
                width: 200,
                child: ListView(
                  children: [
                    Text('1. 強化程式設計'),
                    Text('2. 完成專案實作'),
                    Text('3. 培養批判性思考'),
                    Text('4. 參與社團活動'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大三時期'),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 150,
                width: 200,
                child: ListView(
                  children: [
                    Text('1. 做好專題'),
                    Text('2. 尋找實習工作'),
                    Text('3. 累積團隊作業經驗'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大四時期'),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 150,
                width: 200,
                child: ListView(
                  children: [
                    Text('1. 累積職場經驗'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('專業方向', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '我在學習過程中的專業方向包括：',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. 軟體開發',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '專注於學習不同程式語言及框架，如 Dart 和 Flutter，並掌握應用程式的開發與維護。',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2. 數據分析',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '學習如何處理和分析大量數據，掌握 Python 和相關數據分析工具，如 Pandas 和 NumPy。',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '3. 人工智慧',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '研究和實踐機器學習及深度學習技術，以構建智能系統和應用於各種實際情境。',
                      style: TextStyle(fontSize: 16),
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
}

