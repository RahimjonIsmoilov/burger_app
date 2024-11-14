import 'package:burger_app/profil_page/widgets/setlist.dart';
import 'package:burger_app/varible.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincol1,
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 70,
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            "Профиль",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        centerTitle: true,
        backgroundColor: maincol1,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 44,
            width: 44,
            margin: const EdgeInsets.only(left: 16, top: 30),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: maincolor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 367,
                height: 96,
                margin: const EdgeInsets.only(top: 48, bottom: 20),
                decoration: BoxDecoration(
                    color: maincol2, borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("images/user.png"),
                      maxRadius: 28,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Максим Петров",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Text(
                          "rahimjoni360@mail.ru",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.mode_edit_rounded,
                          size: 24,
                          color: maincolor,
                        ))
                  ],
                ),
              ),
            ),
            const Text(
              "Общее",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              height: 272,
              width: 367,
              margin: const EdgeInsets.only(top: 10, bottom: 37),
              padding: const EdgeInsets.only(top: 28, left: 22, right: 26),
              decoration: BoxDecoration(
                  color: maincol2, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  SetList(
                    title: "Общее",
                    icon: Icon(
                      Icons.person_outline_rounded,
                      color: maincolor,
                    ),
                    description: "Изменяйте вашу личную raxmat",
                  ),
                  SetList(
                    title: "Уведомления",
                    icon: Icon(
                      Icons.notifications_active_outlined,
                      color: maincolor,
                    ),
                    description: "Будьте в курсе всех событий",
                  ),
                  SetList(
                    title: "О нас",
                    icon: Icon(
                      Icons.favorite_border_rounded,
                      color: maincolor,
                    ),
                    description: "Напишите нам, если хотите помочь",
                  ),
                  SetList(
                    title: "Безопасность",
                    icon: Icon(
                      Icons.shield_outlined,
                      color: maincolor,
                    ),
                    description: "Ваши данные никто не украдет",
                  ),
                ],
              ),
            ),
            const Text(
              "Больше",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(top: 18, right: 26, left: 22),
              height: 82,
              width: 367,
              decoration: BoxDecoration(
                  color: maincol2, borderRadius: BorderRadius.circular(16)),
              child: SetList(
                title: "Общее",
                icon: Icon(
                  Icons.person_outline_rounded,
                  color: maincolor,
                ),
                description: "Изменяйте вашу личную raxmat",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
