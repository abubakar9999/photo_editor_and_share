// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Editor_screen extends StatefulWidget {
  String name;
  String img;
  Editor_screen({
    Key? key,
    required this.name,
    required this.img,
  }) : super(key: key);

  @override
  State<Editor_screen> createState() => _Editor_screenState();
}

class _Editor_screenState extends State<Editor_screen> {
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.brown,
  ];
  List<String> imageUrls = [
    'https://img.freepik.com/free-vector/realistic-three-dimensional-arabic-ornamental-background_52683-59086.jpg?size=626&ext=jpg',
    'https://img.freepik.com/free-photo/moon-light-shine-through-window-into-islamic-mosque-interior_1217-2597.jpg?size=626&ext=jpg',
    'https://img.freepik.com/free-vector/ramadan-card-vector_43623-1049.jpg?size=626&ext=jpg',
    'https://img.freepik.com/free-vector/golden-arabesque-arabis-style-islamic-pattern-background_1017-26083.jpg?size=626&ext=jpg',
    'https://img.freepik.com/free-vector/oriental-mandala-background-with-empty-space_52683-64824.jpg?size=626&ext=jpg',
    'https://img.freepik.com/premium-photo/lantern-is-lit-up-front-wall-that-says-ramadan_867452-1701.jpg?size=626&ext=jpg',
    'https://img.freepik.com/premium-vector/arabic-islamic-frame-ramadan-kareem-arch-golden-luxury-ornamental-pattern-background-eid-mubarak_511846-136.jpg?size=626&ext=jpg',
    'https://img.freepik.com/free-vector/detailed-dark-mandala-background_52683-63037.jpg?size=626&ext=jpg',
    'https://img.freepik.com/free-vector/golden-arabeqsue-mandala-pattern-arabis-style-backgroud_1017-26080.jpg?size=626&ext=jpg&ga=GA1.1.890090917.1701580142&semt=ais',
    'https://img.freepik.com/free-photo/free-photo-ramadan-kareem-eid-mubarak-royal-elegant-lamp-with-mosque-holy-gate-with-fireworks_1340-23597.jpg?size=626&ext=jpg&ga=GA1.1.890090917.1701580142&semt=ais',
    'https://img.freepik.com/free-vector/realistic-muharram-illustration_52683-66031.jpg?size=626&ext=jpg&ga=GA1.1.890090917.1701580142&semt=ais',
    'https://t3.ftcdn.net/jpg/04/82/13/28/240_F_482132893_BQQGxkmjky0wGAZbMjXAQ3niCMUpUPhH.jpg',
    'https://t4.ftcdn.net/jpg/02/55/69/71/240_F_255697136_JjNcDLO94YVshDEpIQ0Rh7oU5lDWlYtv.jpg',
    'https://t3.ftcdn.net/jpg/05/77/97/88/240_F_577978852_AbngHY2Bwm2IxtPEt3w2hFvvu8tSONwS.jpg',
    // Add more image URLs as needed
  ];

  Color? color;
  String? selectedImageUrl;
  Offset position = Offset(160, 100);
  Offset imgposition = Offset(160, 20);
  bool isclick=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 360,
                  decoration: BoxDecoration(
                    color: color ?? Colors.green,
                    image: selectedImageUrl != null
                        ? DecorationImage(
                            image: NetworkImage(selectedImageUrl!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      isclick=!isclick;
                    });

                  },
                  child:isclick? Positioned(
                    left: imgposition.dx,
                    top: imgposition.dy,
                    child:GestureDetector(
                onScaleUpdate: (details) {
                  setState(() {
                    containerHeight *= details.scale + scaleMultiplier;
                    containerWidth *= details.scale + scaleMultiplier;

                    // Limit the minimum size to avoid disappearance
                    containerHeight = containerHeight.clamp(50.0, double.maxFinite);
                    containerWidth = containerWidth.clamp(100.0, double.maxFinite);
                  });
                },
                onScaleEnd: (_) {
                  // Limit the minimum size after scaling ends
                  containerHeight = containerHeight.clamp(50.0, double.maxFinite);
                  containerWidth = containerWidth.clamp(100.0, double.maxFinite);
                },
                      child: Card(
                        color: Colors.amber,
                        child: Image.network(
                          widget.img,
                          height: 90.0,
                          width: 90,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ):Positioned(
                    left: imgposition.dx,
                    top: imgposition.dy,
                    child: GestureDetector(
                      onScaleUpdate: (details) {
                        setState(() {
                          containerHeight *= details.scale + scaleMultiplier;
                          containerWidth *= details.scale + scaleMultiplier;
                  
                          // Limit the minimum size to avoid disappearance
                          containerHeight = containerHeight.clamp(50.0, double.infinity);
                          containerWidth = containerWidth.clamp(100.0, double.infinity);
                        });
                      },
                      onScaleEnd: (_) {
                        // Limit the minimum size after scaling ends
                        containerHeight = containerHeight.clamp(50.0, double.infinity);
                        containerWidth = containerWidth.clamp(100.0, double.infinity);
                      },
                      // onPanUpdate: (details) {
                      //   setState(() {
                      //     imgposition += details.delta;
                      //   });
                      // },
                      child: Image.network(
                        widget.img,
                        height: containerHeight,
                        width: containerWidth,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                ),
                Positioned(
                  left: position.dx,
                  top: position.dy,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        position += details.delta;
                      });
                    },
                    child: Center(
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 245, 244, 241),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        color = colors[index];
                        selectedImageUrl = null; // Reset selected image
                        setState(() {});
                      },
                      child: Container(
                        color: colors[index],
                        height: 50.0,
                        width: 50,
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      // Set the selected image URL
                      selectedImageUrl = imageUrls[index];
                      color = null; // Reset selected color
                      setState(() {});
                    },
                    child: Container(
                      child: Image.network(
                        imageUrls[index],
                        height: 70.0,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 200,
              width: 350,
              color: Colors.green,
              alignment: Alignment.center,
              child: GestureDetector(
                onScaleUpdate: (details) {
                  setState(() {
                    containerHeight *= details.scale + scaleMultiplier;
                    containerWidth *= details.scale + scaleMultiplier;

                    // Limit the minimum size to avoid disappearance
                    containerHeight = containerHeight.clamp(50.0, double.maxFinite);
                    containerWidth = containerWidth.clamp(100.0, double.maxFinite);
                  });
                },
                onScaleEnd: (_) {
                  // Limit the minimum size after scaling ends
                  containerHeight = containerHeight.clamp(50.0, double.maxFinite);
                  containerWidth = containerWidth.clamp(100.0, double.maxFinite);
                },
                child: Container(
                  height: containerHeight,
                  width: containerWidth,
                  color: Colors.yellow,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  double containerHeight = 50.0;
  double containerWidth = 100.0;
  double scaleMultiplier = 0.005;
}
