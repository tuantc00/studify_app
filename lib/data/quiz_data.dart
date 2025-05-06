import 'package:cloud_firestore/cloud_firestore.dart';

final data = {
  "Tiếng Anh": {
    "title": "Tiếng Anh",
    "image_url": "",
    "questions": {
      "0": {
        "correctKey": "2",
        "options": {"1": "Run", "2": "Dog", "3": "Happy", "4": "Quickly"},
        "questionText": "Từ nào là danh từ trong các từ sau?",
      },
      "1": {
        "correctKey": "3",
        "options": {
          "1": "He don't like coffee.",
          "2": "He doesn't likes coffee.",
          "3": "He doesn't like coffee.",
          "4": "He not like coffee.",
        },
        "questionText": "Câu nào đúng ngữ pháp?",
      },
      "2": {
        "correctKey": "1",
        "options": {
          "1": "Beautiful",
          "2": "Run",
          "3": "Quickly",
          "4": "Happiness",
        },
        "questionText": "Từ nào là tính từ?",
      },
      "3": {
        "correctKey": "4",
        "options": {"1": "Book", "2": "Pen", "3": "Table", "4": "Swim"},
        "questionText": "Từ nào không phải là danh từ?",
      },
      "4": {
        "correctKey": "2",
        "options": {"1": "am", "2": "is", "3": "are", "4": "be"},
        "questionText": "Động từ nào đúng trong câu: She ___ a student?",
      },
      "5": {
        "correctKey": "1",
        "options": {"1": "What", "2": "Who", "3": "Where", "4": "When"},
        "questionText": "Từ nghi vấn nào dùng để hỏi về vật?",
      },
      "6": {
        "correctKey": "3",
        "options": {
          "1": "Fast",
          "2": "Faster",
          "3": "Fastest",
          "4": "Most fast",
        },
        "questionText": "Dạng so sánh cao nhất của 'fast' là gì?",
      },
      "7": {
        "correctKey": "2",
        "options": {"1": "go", "2": "went", "3": "gone", "4": "going"},
        "questionText": "Quá khứ của 'go' là gì?",
      },
      "8": {
        "correctKey": "4",
        "options": {
          "1": "I likes",
          "2": "She like",
          "3": "They likes",
          "4": "He likes",
        },
        "questionText": "Câu nào đúng ngữ pháp?",
      },
      "9": {
        "correctKey": "1",
        "options": {"1": "and", "2": "but", "3": "or", "4": "because"},
        "questionText": "Liên từ nào nối hai ý cùng hướng?",
      },
      "10": {
        "correctKey": "3",
        "options": {"1": "Big", "2": "Bigger", "3": "Biggest", "4": "Most big"},
        "questionText": "Dạng so sánh cao nhất của 'big' là gì?",
      },
      "11": {
        "correctKey": "2",
        "options": {"1": "play", "2": "playing", "3": "played", "4": "plays"},
        "questionText": "Dạng đúng của động từ trong câu: She is ___ soccer?",
      },
      "12": {
        "correctKey": "4",
        "options": {"1": "Cat", "2": "Dog", "3": "Bird", "4": "Run"},
        "questionText": "Từ nào không phải danh từ chỉ động vật?",
      },
      "13": {
        "correctKey": "1",
        "options": {"1": "is", "2": "are", "3": "am", "4": "be"},
        "questionText": "Động từ nào đúng trong câu: This ___ my book?",
      },
      "14": {
        "correctKey": "3",
        "options": {"1": "Good", "2": "Better", "3": "Best", "4": "Most good"},
        "questionText": "Dạng so sánh cao nhất của 'good' là gì?",
      },
      "15": {
        "correctKey": "2",
        "options": {"1": "I", "2": "me", "3": "my", "4": "mine"},
        "questionText": "Đại từ nào đúng trong câu: Give ___ the book?",
      },
      "16": {
        "correctKey": "4",
        "options": {"1": "Sing", "2": "Sings", "3": "Singing", "4": "Sang"},
        "questionText": "Quá khứ của 'sing' là gì?",
      },
      "17": {
        "correctKey": "1",
        "options": {"1": "at", "2": "in", "3": "on", "4": "to"},
        "questionText": "Giới từ nào đúng trong câu: I arrive ___ 5 PM?",
      },
      "18": {
        "correctKey": "3",
        "options": {
          "1": "Tall",
          "2": "Taller",
          "3": "Tallest",
          "4": "Most tall",
        },
        "questionText": "Dạng so sánh cao nhất của 'tall' là gì?",
      },
      "19": {
        "correctKey": "2",
        "options": {"1": "do", "2": "does", "3": "did", "4": "done"},
        "questionText": "Trợ động từ nào đúng trong câu: ___ she like coffee?",
      },
      "20": {
        "correctKey": "4",
        "options": {"1": "House", "2": "Car", "3": "Tree", "4": "Jump"},
        "questionText": "Từ nào không phải danh từ chỉ đồ vật?",
      },
      "21": {
        "correctKey": "1",
        "options": {"1": "am", "2": "is", "3": "are", "4": "be"},
        "questionText": "Động từ nào đúng trong câu: I ___ happy?",
      },
      "22": {
        "correctKey": "3",
        "options": {"1": "Hot", "2": "Hotter", "3": "Hottest", "4": "Most hot"},
        "questionText": "Dạng so sánh cao nhất của 'hot' là gì?",
      },
      "23": {
        "correctKey": "2",
        "options": {"1": "eat", "2": "ate", "3": "eaten", "4": "eating"},
        "questionText": "Quá khứ của 'eat' là gì?",
      },
      "24": {
        "correctKey": "4",
        "options": {
          "1": "They is",
          "2": "She are",
          "3": "I am not",
          "4": "He is",
        },
        "questionText": "Câu nào đúng ngữ pháp?",
      },
      "25": {
        "correctKey": "1",
        "options": {"1": "in", "2": "on", "3": "at", "4": "to"},
        "questionText": "Giới từ nào đúng trong câu: I live ___ Hanoi?",
      },
      "26": {
        "correctKey": "3",
        "options": {
          "1": "Small",
          "2": "Smaller",
          "3": "Smallest",
          "4": "Most small",
        },
        "questionText": "Dạng so sánh cao nhất của 'small' là gì?",
      },
      "27": {
        "correctKey": "2",
        "options": {"1": "run", "2": "running", "3": "ran", "4": "runs"},
        "questionText": "Dạng đúng của động từ trong câu: She is ___ now?",
      },
      "28": {
        "correctKey": "4",
        "options": {"1": "Apple", "2": "Banana", "3": "Orange", "4": "Walk"},
        "questionText": "Từ nào không phải danh từ chỉ trái cây?",
      },
      "29": {
        "correctKey": "1",
        "options": {"1": "Where", "2": "What", "3": "Who", "4": "Why"},
        "questionText": "Từ nghi vấn nào dùng để hỏi về nơi chốn?",
      },
    },
  },
  "Flutter": {
    "title": "Flutter",
    "image_url": "",
    "questions": {
      "0": {
        "correctKey": "4",
        "options": {
          "1": "widget.add()",
          "2": "widget.insert()",
          "3": "widget.append()",
          "4": "widget.build()",
        },
        "questionText":
            "Phương thức nào được sử dụng để xây dựng giao diện trong Flutter?",
      },
      "1": {
        "correctKey": "2",
        "options": {
          "1": "StatefulWidget",
          "2": "StatelessWidget",
          "3": "InheritedWidget",
          "4": "ProviderWidget",
        },
        "questionText": "Loại widget nào không thể thay đổi trạng thái?",
      },
      "2": {
        "correctKey": "1",
        "options": {"1": "Dart", "2": "Java", "3": "Python", "4": "C++"},
        "questionText": "Ngôn ngữ lập trình nào được sử dụng trong Flutter?",
      },
      "3": {
        "correctKey": "3",
        "options": {
          "1": "TextField",
          "2": "Image",
          "3": "Scaffold",
          "4": "Button",
        },
        "questionText": "Widget nào cung cấp cấu trúc cơ bản cho một màn hình?",
      },
      "4": {
        "correctKey": "2",
        "options": {
          "1": "setState()",
          "2": "build()",
          "3": "initState()",
          "4": "dispose()",
        },
        "questionText": "Phương thức nào được gọi để vẽ lại giao diện?",
      },
      "5": {
        "correctKey": "4",
        "options": {"1": "Row", "2": "Column", "3": "Stack", "4": "Container"},
        "questionText": "Widget nào dùng để chứa và định dạng một phần tử?",
      },
      "6": {
        "correctKey": "1",
        "options": {
          "1": "MaterialApp",
          "2": "CupertinoApp",
          "3": "FlutterApp",
          "4": "MainApp",
        },
        "questionText":
            "Widget nào là điểm bắt đầu của ứng dụng theo phong cách Material?",
      },
      "7": {
        "correctKey": "3",
        "options": {
          "1": "Padding",
          "2": "Margin",
          "3": "ElevatedButton",
          "4": "Text",
        },
        "questionText": "Widget nào là một nút bấm có bóng?",
      },
      "8": {
        "correctKey": "2",
        "options": {"1": "async", "2": "void", "3": "int", "4": "String"},
        "questionText": "Kiểu trả về của hàm build() là gì?",
      },
      "9": {
        "correctKey": "4",
        "options": {
          "1": "FlatButton",
          "2": "RaisedButton",
          "3": "OutlineButton",
          "4": "TextButton",
        },
        "questionText":
            "Widget nút nào thay thế cho FlatButton trong phiên bản mới?",
      },
      "10": {
        "correctKey": "1",
        "options": {"1": "Row", "2": "Column", "3": "Stack", "4": "ListView"},
        "questionText": "Widget nào sắp xếp các phần tử theo chiều ngang?",
      },
      "11": {
        "correctKey": "3",
        "options": {
          "1": "initState()",
          "2": "dispose()",
          "3": "setState()",
          "4": "build()",
        },
        "questionText":
            "Phương thức nào cập nhật trạng thái của StatefulWidget?",
      },
      "12": {
        "correctKey": "2",
        "options": {"1": "Image", "2": "Text", "3": "Icon", "4": "Button"},
        "questionText": "Widget nào dùng để hiển thị văn bản?",
      },
      "13": {
        "correctKey": "4",
        "options": {
          "1": "Flex",
          "2": "Expanded",
          "3": "Spacer",
          "4": "Flexible",
        },
        "questionText":
            "Widget nào điều chỉnh không gian linh hoạt trong Row hoặc Column?",
      },
      "14": {
        "correctKey": "1",
        "options": {
          "1": "Navigator",
          "2": "Router",
          "3": "Screen",
          "4": "Page",
        },
        "questionText": "Lớp nào được dùng để điều hướng giữa các màn hình?",
      },
      "15": {
        "correctKey": "3",
        "options": {"1": "Padding", "2": "Margin", "3": "Center", "4": "Align"},
        "questionText": "Widget nào căn giữa nội dung?",
      },
      "16": {
        "correctKey": "2",
        "options": {
          "1": "SingleChildScrollView",
          "2": "ListView",
          "3": "GridView",
          "4": "PageView",
        },
        "questionText": "Widget nào dùng để hiển thị danh sách có thể cuộn?",
      },
      "17": {
        "correctKey": "4",
        "options": {
          "1": "Box",
          "2": "Shape",
          "3": "Decoration",
          "4": "BoxDecoration",
        },
        "questionText": "Lớp nào dùng để tùy chỉnh nền và viền của Container?",
      },
      "18": {
        "correctKey": "1",
        "options": {
          "1": "AppBar",
          "2": "BottomBar",
          "3": "SideBar",
          "4": "ToolBar",
        },
        "questionText": "Widget nào tạo thanh tiêu đề trên cùng?",
      },
      "19": {
        "correctKey": "3",
        "options": {
          "1": "Gesture",
          "2": "Touch",
          "3": "GestureDetector",
          "4": "InkWell",
        },
        "questionText": "Widget nào phát hiện thao tác chạm và kéo?",
      },
      "20": {
        "correctKey": "2",
        "options": {"1": "Column", "2": "Stack", "3": "Row", "4": "Grid"},
        "questionText": "Widget nào xếp chồng các phần tử lên nhau?",
      },
      "21": {
        "correctKey": "4",
        "options": {
          "1": "TextField",
          "2": "Input",
          "3": "FormField",
          "4": "TextFormField",
        },
        "questionText": "Widget nào dùng để nhập liệu trong biểu mẫu?",
      },
      "22": {
        "correctKey": "1",
        "options": {"1": "main()", "2": "start()", "3": "run()", "4": "init()"},
        "questionText": "Hàm nào là điểm bắt đầu của ứng dụng Flutter?",
      },
      "23": {
        "correctKey": "3",
        "options": {
          "1": "Padding",
          "2": "Margin",
          "3": "SizedBox",
          "4": "Spacer",
        },
        "questionText": "Widget nào tạo khoảng cách cố định giữa các phần tử?",
      },
      "24": {
        "correctKey": "2",
        "options": {
          "1": "Hot Fix",
          "2": "Hot Reload",
          "3": "Hot Restart",
          "4": "Hot Update",
        },
        "questionText":
            "Tính năng nào cho phép cập nhật giao diện mà không mất trạng thái?",
      },
      "25": {
        "correctKey": "4",
        "options": {
          "1": "Icon",
          "2": "Image",
          "3": "Picture",
          "4": "IconButton",
        },
        "questionText": "Widget nào tạo nút với biểu tượng?",
      },
      "26": {
        "correctKey": "1",
        "options": {"1": "Future", "2": "Stream", "3": "Promise", "4": "Async"},
        "questionText": "Đối tượng nào biểu diễn một giá trị trong tương lai?",
      },
      "27": {
        "correctKey": "3",
        "options": {
          "1": "FlatList",
          "2": "ScrollView",
          "3": "GridView",
          "4": "TableView",
        },
        "questionText": "Widget nào hiển thị danh sách dạng lưới?",
      },
      "28": {
        "correctKey": "2",
        "options": {
          "1": "dispose()",
          "2": "initState()",
          "3": "build()",
          "4": "update()",
        },
        "questionText":
            "Phương thức nào khởi tạo trạng thái ban đầu của widget?",
      },
      "29": {
        "correctKey": "4",
        "options": {
          "1": "Theme",
          "2": "Style",
          "3": "Design",
          "4": "ThemeData",
        },
        "questionText": "Lớp nào định nghĩa chủ đề cho ứng dụng?",
      },
    },
  },
  "Hóa học 12": {
    "title": "Hóa học 12",
    "image_url": "",
    "questions": {
      "0": {
        "correctKey": "3",
        "options": {"1": "H2O", "2": "CO2", "3": "NaCl", "4": "O2"},
        "questionText": "Chất nào là muối ăn?",
      },
      "1": {
        "correctKey": "1",
        "options": {"1": "Cacbon", "2": "Oxy", "3": "Hidro", "4": "Nitơ"},
        "questionText": "Nguyên tố nào có ký hiệu C?",
      },
      "2": {
        "correctKey": "2",
        "options": {"1": "HCl", "2": "H2SO4", "3": "NaOH", "4": "KCl"},
        "questionText": "Chất nào là axit sunfuric?",
      },
      "3": {
        "correctKey": "4",
        "options": {"1": "Fe", "2": "Cu", "3": "Al", "4": "Na"},
        "questionText": "Nguyên tố nào có tính kiềm mạnh?",
      },
      "4": {
        "correctKey": "1",
        "options": {"1": "CH4", "2": "CO2", "3": "H2O", "4": "N2"},
        "questionText": "Hợp chất nào là metan?",
      },
      "5": {
        "correctKey": "3",
        "options": {"1": "O2", "2": "H2", "3": "Cl2", "4": "N2"},
        "questionText": "Chất nào có màu vàng lục?",
      },
      "6": {
        "correctKey": "2",
        "options": {"1": "KOH", "2": "NaOH", "3": "HCl", "4": "HNO3"},
        "questionText": "Chất nào là xút?",
      },
      "7": {
        "correctKey": "4",
        "options": {"1": "CaCO3", "2": "MgO", "3": "Fe2O3", "4": "NaCl"},
        "questionText": "Chất nào là muối ăn?",
      },
      "8": {
        "correctKey": "1",
        "options": {"1": "C2H5OH", "2": "CH3COOH", "3": "HCHO", "4": "CH3OH"},
        "questionText": "Hợp chất nào là rượu etylic?",
      },
      "9": {
        "correctKey": "3",
        "options": {"1": "Fe", "2": "Cu", "3": "Ag", "4": "Al"},
        "questionText":
            "Kim loại nào dẫn điện tốt nhất trong các kim loại sau?",
      },
      "10": {
        "correctKey": "2",
        "options": {"1": "H2O", "2": "NH3", "3": "CO2", "4": "SO2"},
        "questionText": "Hợp chất nào có liên kết hidro?",
      },
      "11": {
        "correctKey": "4",
        "options": {"1": "Na", "2": "K", "3": "Mg", "4": "Ca"},
        "questionText": "Nguyên tố nào thuộc nhóm IIA?",
      },
      "12": {
        "correctKey": "1",
        "options": {"1": "CH3COOH", "2": "C2H5OH", "3": "CH3CHO", "4": "HCOOH"},
        "questionText": "Hợp chất nào là axit axetic?",
      },
      "13": {
        "correctKey": "3",
        "options": {"1": "O2", "2": "N2", "3": "H2", "4": "Cl2"},
        "questionText": "Chất nào nhẹ nhất trong các chất sau?",
      },
      "14": {
        "correctKey": "2",
        "options": {"1": "NaCl", "2": "KOH", "3": "H2SO4", "4": "HNO3"},
        "questionText": "Chất nào là bazơ?",
      },
      "15": {
        "correctKey": "4",
        "options": {"1": "FeO", "2": "CuO", "3": "Al2O3", "4": "CaCO3"},
        "questionText": "Chất nào không phải oxit?",
      },
      "16": {
        "correctKey": "1",
        "options": {"1": "C6H12O6", "2": "C2H5OH", "3": "CH3COOH", "4": "CH4"},
        "questionText": "Hợp chất nào là glucozơ?",
      },
      "17": {
        "correctKey": "3",
        "options": {"1": "Na", "2": "K", "3": "Fe", "4": "Cu"},
        "questionText": "Kim loại nào có trong hemoglobin?",
      },
      "18": {
        "correctKey": "2",
        "options": {"1": "HCl", "2": "HNO3", "3": "H2SO4", "4": "NaOH"},
        "questionText": "Chất nào là axit nitric?",
      },
      "19": {
        "correctKey": "4",
        "options": {"1": "Mg", "2": "Al", "3": "Fe", "4": "Zn"},
        "questionText": "Kim loại nào phản ứng với dung dịch HCl tạo khí H2?",
      },
      "20": {
        "correctKey": "1",
        "options": {
          "1": "CH2=CH2",
          "2": "CH3-CH3",
          "3": "CH3OH",
          "4": "CH3COOH",
        },
        "questionText": "Hợp chất nào là etilen?",
      },
      "21": {
        "correctKey": "3",
        "options": {"1": "O2", "2": "N2", "3": "CO2", "4": "H2"},
        "questionText": "Khí nào sinh ra từ quá trình quang hợp?",
      },
      "22": {
        "correctKey": "2",
        "options": {"1": "NaCl", "2": "Ca(OH)2", "3": "H2SO4", "4": "KCl"},
        "questionText": "Chất nào là vôi tôi?",
      },
      "23": {
        "correctKey": "4",
        "options": {"1": "Cu", "2": "Fe", "3": "Al", "4": "Au"},
        "questionText": "Kim loại nào quý hiếm nhất trong các kim loại sau?",
      },
      "24": {
        "correctKey": "1",
        "options": {"1": "HCOOH", "2": "CH3COOH", "3": "C2H5OH", "4": "CH3CHO"},
        "questionText": "Hợp chất nào là axit fomic?",
      },
      "25": {
        "correctKey": "3",
        "options": {"1": "H2", "2": "O2", "3": "N2", "4": "Cl2"},
        "questionText": "Khí nào chiếm phần lớn trong không khí?",
      },
      "26": {
        "correctKey": "2",
        "options": {"1": "NaCl", "2": "MgSO4", "3": "KOH", "4": "HCl"},
        "questionText": "Chất nào là muối Epsom?",
      },
      "27": {
        "correctKey": "4",
        "options": {"1": "Fe", "2": "Cu", "3": "Al", "4": "Pb"},
        "questionText": "Kim loại nào có ký hiệu Pb?",
      },
      "28": {
        "correctKey": "1",
        "options": {"1": "C3H8", "2": "C2H4", "3": "CH4", "4": "C2H5OH"},
        "questionText": "Hợp chất nào là propan?",
      },
      "29": {
        "correctKey": "3",
        "options": {"1": "H2O", "2": "CO2", "3": "SO2", "4": "N2"},
        "questionText": "Khí nào gây hiệu ứng nhà kính ngoài CO2?",
      },
    },
  },
  "Vật lý 12": {
    "title": "Vật lý 12",
    "image_url": "",
    "questions": {
      "0": {
        "correctKey": "2",
        "options": {"1": "Newton", "2": "Joule", "3": "Watt", "4": "Volt"},
        "questionText": "Đơn vị của năng lượng là gì?",
      },
      "1": {
        "correctKey": "4",
        "options": {
          "1": "Điện trở",
          "2": "Cường độ dòng điện",
          "3": "Hiệu điện thế",
          "4": "Công suất",
        },
        "questionText": "Đại lượng nào được đo bằng Watt?",
      },
      "2": {
        "correctKey": "1",
        "options": {
          "1": "Newton",
          "2": "Kilogram",
          "3": "Meter",
          "4": "Second",
        },
        "questionText": "Đơn vị của lực là gì?",
      },
      "3": {
        "correctKey": "3",
        "options": {"1": "m/s", "2": "m/s²", "3": "kg·m/s²", "4": "Joule"},
        "questionText": "Đơn vị của gia tốc là gì?",
      },
      "4": {
        "correctKey": "2",
        "options": {"1": "Ampere", "2": "Ohm", "3": "Volt", "4": "Watt"},
        "questionText": "Đơn vị của điện trở là gì?",
      },
      "5": {
        "correctKey": "4",
        "options": {"1": "Hertz", "2": "Meter", "3": "Second", "4": "m/s"},
        "questionText": "Đơn vị của vận tốc là gì?",
      },
      "6": {
        "correctKey": "1",
        "options": {"1": "Hertz", "2": "Watt", "3": "Joule", "4": "Newton"},
        "questionText": "Đơn vị của tần số là gì?",
      },
      "7": {
        "correctKey": "3",
        "options": {"1": "Newton", "2": "Joule", "3": "Volt", "4": "Ampere"},
        "questionText": "Đơn vị của hiệu điện thế là gì?",
      },
      "8": {
        "correctKey": "2",
        "options": {"1": "Công", "2": "Năng lượng", "3": "Lực", "4": "Gia tốc"},
        "questionText": "Đại lượng nào có đơn vị Joule?",
      },
      "9": {
        "correctKey": "4",
        "options": {"1": "m/s", "2": "m/s²", "3": "kg", "4": "N·m"},
        "questionText": "Đơn vị của mômen lực là gì?",
      },
      "10": {
        "correctKey": "1",
        "options": {"1": "Ampere", "2": "Volt", "3": "Ohm", "4": "Watt"},
        "questionText": "Đơn vị của cường độ dòng điện là gì?",
      },
      "11": {
        "correctKey": "3",
        "options": {"1": "Joule", "2": "Watt", "3": "Pascal", "4": "Newton"},
        "questionText": "Đơn vị của áp suất là gì?",
      },
      "12": {
        "correctKey": "2",
        "options": {"1": "m", "2": "m/s", "3": "m/s²", "4": "kg"},
        "questionText": "Đơn vị của vận tốc là gì?",
      },
      "13": {
        "correctKey": "4",
        "options": {"1": "Newton", "2": "Joule", "3": "Watt", "4": "kg·m²/s²"},
        "questionText": "Đơn vị nào tương đương với Joule?",
      },
      "14": {
        "correctKey": "1",
        "options": {
          "1": "F = m·a",
          "2": "E = m·c²",
          "3": "P = U·I",
          "4": "V = I·R",
        },
        "questionText": "Công thức nào biểu diễn định luật II Newton?",
      },
      "15": {
        "correctKey": "3",
        "options": {"1": "Ohm", "2": "Ampere", "3": "Volt", "4": "Watt"},
        "questionText": "Đơn vị của hiệu điện thế là gì?",
      },
      "16": {
        "correctKey": "2",
        "options": {
          "1": "Công",
          "2": "Công suất",
          "3": "Năng lượng",
          "4": "Lực",
        },
        "questionText": "Đại lượng nào có đơn vị Watt?",
      },
      "17": {
        "correctKey": "4",
        "options": {"1": "m/s", "2": "m/s²", "3": "kg", "4": "Hz"},
        "questionText": "Đơn vị của tần số là gì?",
      },
      "18": {
        "correctKey": "1",
        "options": {"1": "Newton", "2": "Joule", "3": "Watt", "4": "Volt"},
        "questionText": "Đơn vị của lực là gì?",
      },
      "19": {
        "correctKey": "3",
        "options": {"1": "m", "2": "s", "3": "kg", "4": "N"},
        "questionText": "Đơn vị của khối lượng là gì?",
      },
      "20": {
        "correctKey": "2",
        "options": {
          "1": "V = I·R",
          "2": "P = U·I",
          "3": "F = m·a",
          "4": "E = m·c²",
        },
        "questionText": "Công thức nào biểu diễn công suất điện?",
      },
      "21": {
        "correctKey": "4",
        "options": {"1": "Joule", "2": "Newton", "3": "Watt", "4": "Ohm"},
        "questionText": "Đơn vị của điện trở là gì?",
      },
      "22": {
        "correctKey": "1",
        "options": {"1": "m/s", "2": "m/s²", "3": "kg", "4": "N"},
        "questionText": "Đơn vị của vận tốc là gì?",
      },
      "23": {
        "correctKey": "3",
        "options": {"1": "Newton", "2": "Joule", "3": "Hertz", "4": "Watt"},
        "questionText": "Đơn vị của tần số là gì?",
      },
      "24": {
        "correctKey": "2",
        "options": {
          "1": "Lực",
          "2": "Năng lượng",
          "3": "Công suất",
          "4": "Gia tốc",
        },
        "questionText": "Đại lượng nào có đơn vị Joule?",
      },
      "25": {
        "correctKey": "4",
        "options": {"1": "m", "2": "s", "3": "kg", "4": "m/s²"},
        "questionText": "Đơn vị của gia tốc là gì?",
      },
      "26": {
        "correctKey": "1",
        "options": {
          "1": "V = I·R",
          "2": "P = U·I",
          "3": "F = m·a",
          "4": "E = m·c²",
        },
        "questionText": "Công thức nào là định luật Ohm?",
      },
      "27": {
        "correctKey": "3",
        "options": {"1": "Newton", "2": "Joule", "3": "Pascal", "4": "Volt"},
        "questionText": "Đơn vị của áp suất là gì?",
      },
      "28": {
        "correctKey": "2",
        "options": {"1": "m", "2": "s", "3": "kg", "4": "N"},
        "questionText": "Đơn vị của thời gian là gì?",
      },
      "29": {
        "correctKey": "4",
        "options": {"1": "Ohm", "2": "Ampere", "3": "Volt", "4": "Watt"},
        "questionText": "Đơn vị của công suất là gì?",
      },
    },
  },
  "Ngữ văn 12": {
    "title": "Ngữ văn 12",
    "image_url": "",
    "questions": {
      "0": {
        "correctKey": "1",
        "options": {
          "1": "Nguyễn Du",
          "2": "Hồ Xuân Hương",
          "3": "Nguyễn Trãi",
          "4": "Nguyễn Khuyến",
        },
        "questionText": "Ai là tác giả của Truyện Kiều?",
      },
      "1": {
        "correctKey": "3",
        "options": {
          "1": "Văn học dân gian",
          "2": "Văn học trung đại",
          "3": "Văn học hiện đại",
          "4": "Văn học lãng mạn",
        },
        "questionText": "Thể loại văn học nào phổ biến ở thế kỷ 20?",
      },
      "2": {
        "correctKey": "2",
        "options": {
          "1": "Nguyễn Trãi",
          "2": "Hồ Chí Minh",
          "3": "Nguyễn Du",
          "4": "Tố Hữu",
        },
        "questionText": "Ai là tác giả của bài thơ Việt Nam máu lửa?",
      },
      "3": {
        "correctKey": "4",
        "options": {
          "1": "Truyện Kiều",
          "2": "Lục Vân Tiên",
          "3": "Chinh phụ ngâm",
          "4": "Tuyên ngôn độc lập",
        },
        "questionText": "Tác phẩm nào do Hồ Chí Minh sáng tác?",
      },
      "4": {
        "correctKey": "1",
        "options": {
          "1": "Nam Cao",
          "2": "Ngô Tất Tố",
          "3": "Nguyễn Công Hoan",
          "4": "Vũ Trọng Phụng",
        },
        "questionText": "Ai là tác giả của Chí Phèo?",
      },
      "5": {
        "correctKey": "3",
        "options": {
          "1": "Truyện ngắn",
          "2": "Truyện dài",
          "3": "Truyện vừa",
          "4": "Thơ",
        },
        "questionText": "Chí Phèo thuộc thể loại nào?",
      },
      "6": {
        "correctKey": "2",
        "options": {
          "1": "Nguyễn Du",
          "2": "Xuân Diệu",
          "3": "Hàn Mặc Tử",
          "4": "Lưu Trọng Lư",
        },
        "questionText": "Ai là tác giả của Tràng giang?",
      },
      "7": {
        "correctKey": "4",
        "options": {
          "1": "Truyện Kiều",
          "2": "Nhật ký trong tù",
          "3": "Tuyên ngôn độc lập",
          "4": "Tây Tiến",
        },
        "questionText": "Tác phẩm nào của Quang Dũng?",
      },
      "8": {
        "correctKey": "1",
        "options": {
          "1": "Tố Hữu",
          "2": "Xuân Diệu",
          "3": "Chế Lan Viên",
          "4": "Hàn Mặc Tử",
        },
        "questionText": "Ai là tác giả của Việt Bắc?",
      },
      "9": {
        "correctKey": "3",
        "options": {
          "1": "Truyện ngắn",
          "2": "Tiểu thuyết",
          "3": "Thơ",
          "4": "Kịch",
        },
        "questionText": "Việt Bắc thuộc thể loại nào?",
      },
      "10": {
        "correctKey": "2",
        "options": {
          "1": "Nguyễn Trãi",
          "2": "Nguyễn Đình Chiểu",
          "3": "Nguyễn Du",
          "4": "Hồ Xuân Hương",
        },
        "questionText": "Ai là tác giả của Lục Vân Tiên?",
      },
      "11": {
        "correctKey": "4",
        "options": {
          "1": "Truyện Kiều",
          "2": "Việt Bắc",
          "3": "Tây Tiến",
          "4": "Đất nước",
        },
        "questionText": "Tác phẩm nào của Nguyễn Khoa Điềm?",
      },
      "12": {
        "correctKey": "1",
        "options": {
          "1": "Vũ Trọng Phụng",
          "2": "Nam Cao",
          "3": "Ngô Tất Tố",
          "4": "Nguyễn Công Hoan",
        },
        "questionText": "Ai là tác giả của Số đỏ?",
      },
      "13": {
        "correctKey": "3",
        "options": {
          "1": "Truyện ngắn",
          "2": "Thơ",
          "3": "Tiểu thuyết",
          "4": "Kịch",
        },
        "questionText": "Số đỏ thuộc thể loại nào?",
      },
      "14": {
        "correctKey": "2",
        "options": {
          "1": "Tố Hữu",
          "2": "Hàn Mặc Tử",
          "3": "Xuân Diệu",
          "4": "Chế Lan Viên",
        },
        "questionText": "Ai là tác giả của Đây thôn Vĩ Dạ?",
      },
      "15": {
        "correctKey": "4",
        "options": {
          "1": "Truyện Kiều",
          "2": "Việt Bắc",
          "3": "Tây Tiến",
          "4": "Nhật ký trong tù",
        },
        "questionText": "Tác phẩm nào của Hồ Chí Minh?",
      },
      "16": {
        "correctKey": "1",
        "options": {
          "1": "Ngô Tất Tố",
          "2": "Nam Cao",
          "3": "Vũ Trọng Phụng",
          "4": "Nguyễn Công Hoan",
        },
        "questionText": "Ai là tác giả của Tắt đèn?",
      },
      "17": {
        "correctKey": "3",
        "options": {
          "1": "Truyện ngắn",
          "2": "Thơ",
          "3": "Tiểu thuyết",
          "4": "Kịch",
        },
        "questionText": "Tắt đèn thuộc thể loại nào?",
      },
      "18": {
        "correctKey": "2",
        "options": {
          "1": "Nguyễn Du",
          "2": "Chế Lan Viên",
          "3": "Xuân Diệu",
          "4": "Tố Hữu",
        },
        "questionText": "Ai là tác giả của Đàn ghi-ta của Lorca?",
      },
      "19": {
        "correctKey": "4",
        "options": {
          "1": "Truyện Kiều",
          "2": "Việt Bắc",
          "3": "Tây Tiến",
          "4": "Tràng giang",
        },
        "questionText": "Tác phẩm nào của Xuân Diệu?",
      },
      "20": {
        "correctKey": "1",
        "options": {
          "1": "Nguyễn Công Hoan",
          "2": "Nam Cao",
          "3": "Ngô Tất Tố",
          "4": "Vũ Trọng Phụng",
        },
        "questionText": "Ai là tác giả của Đôi lứa xứng đôi?",
      },
      "21": {
        "correctKey": "3",
        "options": {
          "1": "Tiểu thuyết",
          "2": "Thơ",
          "3": "Truyện ngắn",
          "4": "Kịch",
        },
        "questionText": "Đôi lứa xứng đôi thuộc thể loại nào?",
      },
      "22": {
        "correctKey": "2",
        "options": {
          "1": "Nguyễn Du",
          "2": "Lưu Trọng Lư",
          "3": "Xuân Diệu",
          "4": "Hàn Mặc Tử",
        },
        "questionText": "Ai là tác giả của Tiếng thu?",
      },
      "23": {
        "correctKey": "4",
        "options": {
          "1": "Truyện Kiều",
          "2": "Việt Bắc",
          "3": "Tắt đèn",
          "4": "Đất nước",
        },
        "questionText": "Tác phẩm nào của Nguyễn Khoa Điềm?",
      },
      "24": {
        "correctKey": "1",
        "options": {
          "1": "Hồ Xuân Hương",
          "2": "Nguyễn Du",
          "3": "Nguyễn Trãi",
          "4": "Nguyễn Khuyến",
        },
        "questionText": "Ai là tác giả của Bánh trôi nước?",
      },
      "25": {
        "correctKey": "3",
        "options": {
          "1": "Tiểu thuyết",
          "2": "Truyện ngắn",
          "3": "Thơ",
          "4": "Kịch",
        },
        "questionText": "Bánh trôi nước thuộc thể loại nào?",
      },
      "26": {
        "correctKey": "2",
        "options": {
          "1": "Nguyễn Du",
          "2": "Nguyễn Khuyến",
          "3": "Xuân Diệu",
          "4": "Tố Hữu",
        },
        "questionText": "Ai là tác giả của Thu điếu?",
      },
      "27": {
        "correctKey": "4",
        "options": {
          "1": "Truyện Kiều",
          "2": "Việt Bắc",
          "3": "Tắt đèn",
          "4": "Thu điếu",
        },
        "questionText": "Tác phẩm nào của Nguyễn Khuyến?",
      },
      "28": {
        "correctKey": "1",
        "options": {
          "1": "Nguyễn Trãi",
          "2": "Nguyễn Du",
          "3": "Hồ Xuân Hương",
          "4": "Nguyễn Đình Chiểu",
        },
        "questionText": "Ai là tác giả của Bình Ngô đại cáo?",
      },
      "29": {
        "correctKey": "3",
        "options": {
          "1": "Tiểu thuyết",
          "2": "Truyện ngắn",
          "3": "Thơ",
          "4": "Kịch",
        },
        "questionText": "Bình Ngô đại cáo thuộc thể loại nào?",
      },
    },
  },
  "Toán 12": {
    "title": "Toán 12",
    "image_url": "",
    "questions": {
      "0": {
        "correctKey": "2",
        "options": {"1": "1", "2": "0", "3": "∞", "4": "-1"},
        "questionText": "Giá trị của lim (x→0) sin(x)/x là bao nhiêu?",
      },
      "1": {
        "correctKey": "3",
        "options": {"1": "x^2", "2": "2x", "3": "2", "4": "0"},
        "questionText": "Đạo hàm của hàm số f(x) = x^2 là gì?",
      },
      "2": {
        "correctKey": "1",
        "options": {"1": "1", "2": "0", "3": "∞", "4": "-1"},
        "questionText": "Giá trị của cos(0) là bao nhiêu?",
      },
      "3": {
        "correctKey": "4",
        "options": {"1": "x", "2": "x^2", "3": "2x", "4": "1"},
        "questionText": "Đạo hàm của hàm số f(x) = x là gì?",
      },
      "4": {
        "correctKey": "2",
        "options": {"1": "0", "2": "1", "3": "∞", "4": "-1"},
        "questionText": "Giá trị của sin(π/2) là bao nhiêu?",
      },
      "5": {
        "correctKey": "3",
        "options": {"1": "2x", "2": "x^2", "3": "2", "4": "0"},
        "questionText": "Đạo hàm của hàm số f(x) = 2x là gì?",
      },
      "6": {
        "correctKey": "1",
        "options": {"1": "0", "2": "1", "3": "∞", "4": "-1"},
        "questionText": "Giá trị của tan(0) là bao nhiêu?",
      },
      "7": {
        "correctKey": "4",
        "options": {"1": "x", "2": "2x", "3": "x^2", "4": "1/x"},
        "questionText": "Đạo hàm của hàm số f(x) = ln(x) là gì?",
      },
      "8": {
        "correctKey": "2",
        "options": {"1": "1", "2": "0", "3": "∞", "4": "-1"},
        "questionText": "Giá trị của cos(π) là bao nhiêu?",
      },
      "9": {
        "correctKey": "3",
        "options": {"1": "x", "2": "2x", "3": "e^x", "4": "1"},
        "questionText": "Đạo hàm của hàm số f(x) = e^x là gì?",
      },
      "10": {
        "correctKey": "1",
        "options": {"1": "π", "2": "π/2", "3": "0", "4": "∞"},
        "questionText": "Chu kỳ của hàm số y = sin(x) là bao nhiêu?",
      },
      "11": {
        "correctKey": "4",
        "options": {"1": "x", "2": "2x", "3": "x^2", "4": "-1/x^2"},
        "questionText": "Đạo hàm của hàm số f(x) = -1/x là gì?",
      },
      "12": {
        "correctKey": "2",
        "options": {"1": "1", "2": "0", "3": "∞", "4": "-1"},
        "questionText": "Giá trị của sin(π) là bao nhiêu?",
      },
      "13": {
        "correctKey": "3",
        "options": {"1": "x", "2": "2x", "3": "cos(x)", "4": "sin(x)"},
        "questionText": "Đạo hàm của hàm số f(x) = sin(x) là gì?",
      },
      "14": {
        "correctKey": "1",
        "options": {"1": "2π", "2": "π", "3": "π/2", "4": "0"},
        "questionText": "Chu kỳ của hàm số y = cos(x) là bao nhiêu?",
      },
      "15": {
        "correctKey": "4",
        "options": {"1": "x", "2": "2x", "3": "x^2", "4": "-sin(x)"},
        "questionText": "Đạo hàm của hàm số f(x) = cos(x) là gì?",
      },
      "16": {
        "correctKey": "2",
        "options": {"1": "1", "2": "0", "3": "∞", "4": "-1"},
        "questionText": "Giá trị của cos(π/2) là bao nhiêu?",
      },
      "17": {
        "correctKey": "3",
        "options": {"1": "x", "2": "2x", "3": "1/cos^2(x)", "4": "sin(x)"},
        "questionText": "Đạo hàm của hàm số f(x) = tan(x) là gì?",
      },
      "18": {
        "correctKey": "1",
        "options": {"1": "1", "2": "0", "3": "∞", "4": "-1"},
        "questionText": "Giá trị của sin(0) là bao nhiêu?",
      },
      "19": {
        "correctKey": "4",
        "options": {"1": "x", "2": "2x", "3": "x^2", "4": "x^3/3"},
        "questionText": "Nguyên hàm của hàm số f(x) = x^2 là gì?",
      },
      "20": {
        "correctKey": "2",
        "options": {"1": "π", "2": "π/2", "3": "0", "4": "∞"},
        "questionText": "Chu kỳ của hàm số y = tan(x) là bao nhiêu?",
      },
      "21": {
        "correctKey": "3",
        "options": {"1": "x", "2": "2x", "3": "x^2/2", "4": "x^3"},
        "questionText": "Nguyên hàm của hàm số f(x) = x là gì?",
      },
      "22": {
        "correctKey": "1",
        "options": {"1": "0", "2": "1", "3": "∞", "4": "-1"},
        "questionText": "Giá trị của tan(π/2) là bao nhiêu?",
      },
      "23": {
        "correctKey": "4",
        "options": {"1": "x", "2": "2x", "3": "x^2", "4": "e^x"},
        "questionText": "Nguyên hàm của hàm số f(x) = e^x là gì?",
      },
      "24": {
        "correctKey": "2",
        "options": {"1": "1", "2": "0", "3": "∞", "4": "-1"},
        "questionText": "Giá trị của cos(2π) là bao nhiêu?",
      },
      "25": {
        "correctKey": "3",
        "options": {"1": "x", "2": "2x", "3": "sin(x)", "4": "cos(x)"},
        "questionText": "Nguyên hàm của hàm số f(x) = cos(x) là gì?",
      },
      "26": {
        "correctKey": "1",
        "options": {"1": "-cos(x)", "2": "sin(x)", "3": "x", "4": "2x"},
        "questionText": "Nguyên hàm của hàm số f(x) = sin(x) là gì?",
      },
      "27": {
        "correctKey": "4",
        "options": {"1": "x", "2": "2x", "3": "x^2", "4": "ln|x|"},
        "questionText": "Nguyên hàm của hàm số f(x) = 1/x là gì?",
      },
      "28": {
        "correctKey": "2",
        "options": {"1": "1", "2": "0", "3": "∞", "4": "-1"},
        "questionText": "Giá trị của sin(2π) là bao nhiêu?",
      },
      "29": {
        "correctKey": "3",
        "options": {"1": "x", "2": "2x", "3": "3x^2", "4": "x^3"},
        "questionText": "Đạo hàm của hàm số f(x) = x^3 là gì?",
      },
    },
  },
};

Future<void> uploadQuiz() async {
  try {
    // Upload đồng thời tất cả các chủ đề
    await Future.wait(
      data.entries.map((entry) async {
        await uploadQuestionsForField(entry.key, entry.value);
      }),
    );
    print('All quizzes uploaded successfully!');
  } catch (e) {
    print('Error uploading quizzes: $e');
  }
}

Future<void> uploadQuestionsForField(String field, dynamic data) async {
  try {
    await FirebaseFirestore.instance
        .collection('QuizQuestions')
        .doc(field)
        .set(data);
    print('Uploaded quiz for field: $field');
  } catch (e) {
    print('Failed to upload quiz for field $field: $e');
  }
}
