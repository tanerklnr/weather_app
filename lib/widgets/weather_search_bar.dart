import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/cities.dart';

class WeatherSearchBar extends StatelessWidget {
  final Function(String) onSearch;
  final bool isLoading;

  const WeatherSearchBar({
    super.key,
    required this.onSearch,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return Cities.getSuggestions(textEditingValue.text);
      },
      onSelected: onSearch,
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width - 40, // Padding'i hesaba katıyoruz
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: options.length > 5 ? 5 : options.length,
                itemBuilder: (BuildContext context, int index) {
                  final String option = options.elementAt(index);
                  return ListTile(
                    title: Text(
                      option,
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      onSelected(option);
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
      fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: TextField(
            controller: textEditingController,
            focusNode: focusNode,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: 'Şehir ara...',
              hintStyle: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 16,
              ),
              border: InputBorder.none,
              icon: Icon(Icons.search, color: Colors.white.withOpacity(0.7)),
            ),
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-ZğüşıöçĞÜŞİÖÇ\s]')),
            ],
            onSubmitted: (String value) {
              if (value.isNotEmpty) {
                onSearch(value);
              }
            },
            enabled: !isLoading,
          ),
        );
      },
    );
  }
} 