import 'package:flutter/material.dart';

import '../../const/constants.dart';
import '../../generated/l10n.dart';
import '../utils/size_config.dart';

class customSearch extends StatelessWidget {
  const customSearch({
    super.key,
    this.onChanged,
    this.text,
    this.onTap,
  });
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        height: SizeConfig.defaultSize! * 5,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: S.of(context).Search,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.pink)),
                  ),
                  onChanged: onChanged,
                ),
              ),
              SizedBox(
                width: SizeConfig.defaultSize! / 2,
              ),
              GestureDetector(
                onTap: onTap,
                child: text == null
                    ? const Text('')
                    : Container(
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: kmainA,
                        ),
                        child: Center(
                          child: Text(
                            '    $text    ',
                            style: const TextStyle(
                                fontFamily: 'Pacifico', fontSize: 15),
                          ),
                        ),
                      ),
              ),
              SizedBox(
                width: SizeConfig.defaultSize! / 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
