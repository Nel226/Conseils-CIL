import 'package:conseils_cil/dao/dao_conseils.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'quiz.dart';
import 'package:image_card/image_card.dart';
import 'package:conseils_cil/models/conseils.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  final controller = StoryController();
  bool showStory = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    List<StoryItem> storyItems = [
      StoryItem.text(title: "Hello world!", backgroundColor: Colors.red),
      StoryItem.pageImage(
        url:
            'https://burkina24.com/wp-content/uploads/2022/08/2C5330B8-BBDB-4A1F-BC3A-C6554877AA3D.jpeg',
        caption: Text("Beautiful scenery"),
        controller: controller,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Conseils CIL',
          style: TextStyle(
            color: Colors.white, // Couleur du texte en blanc
            fontWeight: FontWeight.bold, // Texte en gras
          ),
        ),
        backgroundColor: const Color(0xFF6FA562), // Couleur de fond verte
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          login();
        },
        backgroundColor: const Color(0xFF6FA562),
        child: const Icon(
          Icons.forum_rounded,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color(0xFF6FA562),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Badge(
              child: Icon(Icons.home_rounded, color: Colors.white),
            ),
            icon: Icon(Icons.home_rounded),
            label: 'Accueil',
          ),
          NavigationDestination(
            selectedIcon: Badge(
              child: Icon(Icons.lightbulb_rounded, color: Colors.white),
            ),
            icon: Badge(child: Icon(Icons.lightbulb_rounded)),
            label: 'Conseils',
          ),
          NavigationDestination(
            selectedIcon: Badge(
              label: Text('2', style: TextStyle(color: Colors.white)),
              child: Icon(Icons.help_rounded, color: Colors.white),
            ),
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.help_rounded),
            ),
            label: 'Quiz',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.description_rounded, color: Colors.white),
            icon: Icon(Icons.description_rounded),
            label: 'Documents',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          // Home page

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    showStory = true;
                  });
                },
                child: Card(
                  elevation: 4.0,
                  shadowColor: const Color.fromARGB(255, 206, 209, 211),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        margin: const EdgeInsets.all(
                            26.0), // Marge entre le cercle et le texte
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2.0),
                          color: Colors.green,
                        ),
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://burkina24.com/wp-content/uploads/2022/08/2C5330B8-BBDB-4A1F-BC3A-C6554877AA3D.jpeg",
                          ),
                          radius: 100,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: 'A la une\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      "Suivez l'actualité partagée par la CIL",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Autres widgets ici
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (showStory)
                Expanded(
                  child: StoryView(
                    storyItems: storyItems,
                    controller: controller,
                    repeat: false,
                    inline: false,
                    onComplete: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: [
                    // Première carte
                    SizedBox(
                      width: MediaQuery.of(context).size.width / (2.5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 16 /
                                  9, // Ratio d'aspect de l'image (peut être différent pour chaque image)
                              child: Image.asset(
                                'assets/images/bananas.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Titre 1',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('Sous-titre 1'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Deuxième carte
                    SizedBox(
                      width: MediaQuery.of(context).size.width / (2.5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: Colors.grey, // Couleur de la bordure
                            width: 1, // Largeur de la bordure
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 16 /
                                  9, // Ratio d'aspect de l'image (peut être différent pour chaque image)
                              child: Image.asset(
                                'assets/images/logo_cil.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Titre 2',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('Sous-titre 2'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / (2.5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: Colors.grey, // Couleur de la bordure
                            width: 1, // Largeur de la bordure
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 16 /
                                  9, // Ratio d'aspect de l'image (peut être différent pour chaque image)
                              child: Image.asset(
                                'assets/images/logo_cil.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Titre 2',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('Sous-titre 2'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / (2.5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: Colors.grey, // Couleur de la bordure
                            width: 1, // Largeur de la bordure
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 16 /
                                  9, // Ratio d'aspect de l'image (peut être différent pour chaque image)
                              child: Image.asset(
                                'assets/images/logo_cil.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Titre 2',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('Sous-titre 2'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Ajoutez les autres cartes de la même manière
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 4,

                margin: EdgeInsets.all(10), // Marge autour de la carte
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'La protection de vos données',
                            style: TextStyle(
                              color:
                                  Colors.black, // Couleur du texte de l'en-tête
                              fontWeight: FontWeight.bold, // Texte en gras
                            ),
                          ),
                          Divider(), // Diviseur entre l'en-tête et le corps
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              height:
                                  5), // Espacement entre le titre et le contenu

                          SingleChildScrollView(
                            child: Card(
                              margin: EdgeInsets.all(16.0),
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height - 300.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [Colors.blue, Colors.green],
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    // Contenu de la carte
                                    Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Protections sur les réseaux sociaux',
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            softWrap: true,
                                          ),
                                          SizedBox(height: 8.0),
                                          Row(
                                            children: [
                                              Icon(Icons.access_time),
                                              SizedBox(width: 8.0),
                                              Expanded(
                                                child: Text(
                                                  'Première ligne de texte',
                                                  softWrap: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8.0),
                                          Row(
                                            children: [
                                              Icon(Icons.star),
                                              SizedBox(width: 8.0),
                                              Expanded(
                                                child: Text(
                                                  'Deuxième ligne de texte',
                                                  softWrap: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8.0),
                                          Row(
                                            children: [
                                              Icon(Icons.favorite),
                                              SizedBox(width: 8.0),
                                              Expanded(
                                                child: Text(
                                                  'Troisième ligne de texte',
                                                  softWrap: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),

          // Notifications page

          const Padding(
            padding: EdgeInsets.all(28.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            Colors.blue, // Couleur de fond du cercle
                        child: Icon(
                          Icons.notifications_sharp,
                          color: Colors.white, // Couleur de l'icône
                        ),
                      ),
                      title: Text('Notification 1'),
                      subtitle: Text('This is a notification'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Messages page
          ListView.builder(
            reverse: true,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Hello',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.colorScheme.onPrimary),
                    ),
                  ),
                );
              }
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hi!',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
