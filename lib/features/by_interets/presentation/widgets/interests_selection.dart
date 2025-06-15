import 'package:flutter/material.dart';

import '../../../../../core/common/constants/colors/app_colors.dart';
import '../../../../../core/common/constants/styles/textstyles/mulish_textstyle.dart';
import '../../../../../service_locator.dart';

class Category {
  final String emoji;
  final String title;

  Category({required this.emoji, required this.title});
}

class SelectableCategoryGrid extends StatefulWidget {
  const SelectableCategoryGrid({super.key});

  @override
  State<SelectableCategoryGrid> createState() => _SelectableCategoryGridState();
}

class _SelectableCategoryGridState extends State<SelectableCategoryGrid> {
  final List<Category> categories = [
    Category(emoji: "🎓", title: "Ta’lim"),
    Category(emoji: "🌍", title: "Sayohat"),
    Category(emoji: "🎨", title: "San’at"),
    Category(emoji: "📚", title: "Kitoblar"),
    Category(emoji: "🎵", title: "Musiqa"),
    Category(emoji: "🎬", title: "Film"),
    Category(emoji: "📰", title: "Yangiliklar"),
    Category(emoji: "🐶", title: "Hayvonlar"),
    Category(emoji: "🍕", title: "Ovqat"),
    Category(emoji: "🏀⚽", title: "Sport"),
    Category(emoji: "🎮", title: "O’yinlar"),
    Category(emoji: "🚗", title: "Mashinalar"),
    Category(emoji: "🪻", title: "Botanika"),
    Category(emoji: "🌐", title: "Geografiya"),
  ];

  final Set<String> selectedTitles = {};

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: categories.map((category) {
        final isSelected = selectedTitles.contains(category.title);
        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedTitles.remove(category.title);
              } else {
                selectedTitles.add(category.title);
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color:  AppColors.white,
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.orange,
                width: 1.8,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  category.emoji,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 6),
                Text(
                  category.title,
                  style: sl<MulishTextStyles>().bold(
                    color: isSelected ? AppColors.primary : AppColors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
