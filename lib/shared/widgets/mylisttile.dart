import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final bool isOdd;
  final String title;
  final String? line01Text;
  final String? line02Text;
  final String? imagePath;
  final VoidCallback? onEditPressed;
  final VoidCallback? onSharedPressed;
  final bool visivelSeLista;

  const MyListTile({
    super.key,
    this.isOdd = false,
    required this.title,
    this.line01Text,
    this.line02Text,
    this.imagePath,
    this.onEditPressed,
    this.onSharedPressed,
    this.visivelSeLista = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 3, 4, 2),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
            color: isOdd ? Colors.yellow.shade100 : Colors.grey.shade500,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.15),
                  spreadRadius: 4,
                  blurRadius: 50)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (imagePath != null)
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: Image.asset(imagePath!).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(line01Text ?? ''),
                      Text(line02Text ?? ''),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: onEditPressed,
                        icon: const Icon(
                          Icons.edit,
                          size: 20,
                        ),
                      )),
                ),
                Visibility(
                  visible: visivelSeLista,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: onSharedPressed,
                          icon: const Icon(
                            Icons.share_rounded,
                            size: 20,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
