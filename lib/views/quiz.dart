import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

void main() {
  runApp(const NavigationBarApp());
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
        caption: const Text("Beautiful scenery"),
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
                        margin: const EdgeInsets.all(26.0),
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
                      RichText(
                        text: const TextSpan(
                          text: 'A la une',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
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
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(28.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.notifications_sharp,
                          color: Colors.white,
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
