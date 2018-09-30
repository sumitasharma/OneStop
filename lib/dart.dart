class IntroItem {
  IntroItem({
    this.title,
    this.category,
    this.imageUrl,
    this.navigationTab
  });

  final String title;
  final String category;
  final String imageUrl;
  final String navigationTab;
}

final sampleItems = <IntroItem>[
  new IntroItem(
      title: 'Keep yourself updated with news all around the World!',
      category: 'NEWS',
      imageUrl: 'assets/newsImage.jpg',
      navigationTab: 'NewsTabs'),
  new IntroItem(
      title: 'What events are takiing place in my neighbourhood!',
      category: 'EVENTS',
      imageUrl: 'assets/eventsImage.jpg',
      navigationTab: 'EventsTabs'),
  new IntroItem(title: 'Listening to the best podcast!',
      category: 'PODCAST',
      imageUrl: 'assets/podcastImage.jpg',
      navigationTab: 'PodcastsTabs'),
];