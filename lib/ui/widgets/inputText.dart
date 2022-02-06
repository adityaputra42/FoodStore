part of 'widget.dart';

class InputText extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const InputText(
      {Key? key,
      required this.obscureText,
      required this.title,
      required this.hintText,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: whiteTextStyle.copyWith(fontSize: 15, fontWeight: regular),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: inputTextColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: TextField(
              cursorColor: whiteColor,
              controller: controller,
              style: whiteTextStyle,
              obscureText: obscureText,
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hintText: hintText,
                  hintStyle: greyTextStyle,
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
