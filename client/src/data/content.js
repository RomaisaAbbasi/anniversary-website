import CONFIG from './config.js';
const { partner1, partner2, anniversaryDate } = CONFIG;

export const CONTENT = {
  welcome: {
    title: `Hey ${partner1} ❤️`,
    subtitle: 'Welcome to a little world made just for us.',
    anniversary: `Happy Wedding Anniversary, ${partner1} & ${partner2} 💍❤️`,
    button: "Let's Begin Our Story →",
  },
  anniversary: {
    title: 'Our Beautiful Journey ❤️',
    togetherSince: `Together since ${anniversaryDate}`,
    years: 'Years', months: 'Months', days: 'Days', hours: 'Hours', minutes: 'Minutes', seconds: 'Seconds',
    button: 'Continue to Our Story →',
  },
  howItStarted: {
    title: 'How It All Started...',
    timeline: [
      { title: 'First Meeting', description: 'The moment our eyes met, something magical happened.', date: 'June 15, 2023', sticker: '👀' },
      { title: 'First Conversation', description: 'We talked for hours and it felt like minutes.', date: 'June 16, 2023', sticker: '💬' },
      { title: 'First Picture Together', description: 'A photo that captured the beginning of our story.', date: 'June 20, 2023', sticker: '📸' },
      { title: 'First Special Day', description: 'The day we knew this was something extraordinary.', date: 'July 1, 2023', sticker: '🌟' },
    ],
    button: 'Continue to Memories →',
  },
  memories: {
    title: 'Our Memories ❤️',
    cards: [
      { title: 'First Date', description: 'A beautiful evening we\'ll never forget.', date: 'June 2023', image: 'https://picsum.photos/seed/mem1/400/300', sticker: '🌸' },
      { title: 'Our First Trip', description: 'Exploring new places together.', date: 'July 2023', image: 'https://picsum.photos/seed/mem2/400/300', sticker: '✈️' },
      { title: 'Lazy Sundays', description: 'The best days are the ones spent with you.', date: 'August 2023', image: 'https://picsum.photos/seed/mem3/400/300', sticker: '☕' },
      { title: 'Celebrating Love', description: 'Every day with you is a celebration.', date: 'September 2023', image: 'https://picsum.photos/seed/mem4/400/300', sticker: '🎉' },
    ],
    button: 'Continue to Our Firsts →',
  },
  firsts: {
    title: 'Our Firsts ❤️',
    cards: [
      { title: 'First Hello', description: 'The very first word that started it all.', emoji: '👋' },
      { title: 'First Call', description: 'That nervous but exciting first phone call.', emoji: '📞' },
      { title: 'First Picture', description: 'The first photo we took together.', emoji: '📸' },
      { title: 'First Meeting', description: 'When we finally met in person.', emoji: '💕' },
      { title: 'First Date', description: 'A perfect first date I\'ll always cherish.', emoji: '🍽️' },
      { title: 'First "I Love You"', description: 'Those three words that changed everything.', emoji: '❤️' },
      { title: 'First Special Memory', description: 'A moment that became our treasure.', emoji: '✨' },
    ],
    button: 'Continue to Reasons →',
  },
  reasons: {
    title: 'Little Reasons I Love You ❤️',
    cards: [
      'Because you make ordinary days feel special.',
      'Because your smile lights up my whole world.',
      'Because you understand me without words.',
      'Because you make me a better person.',
      'Because your laugh is my favorite sound.',
      'Because you believe in us, always.',
      'Because you are my home, no matter where we are.',
      'Because you chose me, and I\'ll never stop being grateful.',
      'Because you are my favorite person, forever.',
      'Because every moment with you is a treasure.',
    ],
    button: 'Continue to Surprise →',
  },
  surprise: {
    title: 'I have a little surprise for you...',
    subtitle: 'Wanna see it? 👀❤️',
    yesText: 'YES ❤️',
    noText: 'NO 🙈',
    noResponse: 'How dare you click NO? 🥺',
    noResponseSub: 'Try Again ❤️',
    revealedMessage: 'You just made me smile so big! 😊 Here\'s to us, to love, and to forever. I love you! ❤️',
    button: 'Continue →',
  },
  photoWall: {
    title: 'Our Photo Wall 📸',
    photos: [
      { src: 'https://picsum.photos/seed/wall1/400/400', caption: 'Us ❤️', sticker: '💕' },
      { src: 'https://picsum.photos/seed/wall2/400/400', caption: 'Happy Days', sticker: '🌸' },
      { src: 'https://picsum.photos/seed/wall3/400/400', caption: 'Love', sticker: '💖' },
      { src: 'https://picsum.photos/seed/wall4/400/400', caption: 'Forever', sticker: '✨' },
      { src: 'https://picsum.photos/seed/wall5/400/400', caption: 'Together', sticker: '💑' },
      { src: 'https://picsum.photos/seed/wall6/400/400', caption: 'Memories', sticker: '📷' },
    ],
    button: 'Continue to Letter →',
  },
  letter: {
    title: 'To My Favorite Person ❤️',
    button: 'Open Letter 💌',
    content: `
      My Dearest ${partner1},

      From the moment you came into my life, everything changed for the better.
      You brought light, laughter, and a love I never knew was possible.

      Every day with you feels like a beautiful dream — one I never want to wake up from.
      Your smile, your kindness, your heart... they are my favorite things in this world.

      Thank you for choosing me, for loving me, and for being my forever person.
      I can't wait to spend the rest of my life making memories with you.

      Forever yours,
      ${partner2} ❤️
    `,
    buttonNext: 'Continue to Favorite Moments →',
  },
  favoriteMoments: {
    title: 'Our Favorite Moments ✨',
    cards: [
      { title: 'That Day...', description: 'The day we knew we were meant to be.', image: 'https://picsum.photos/seed/fav1/400/300', sticker: '🌟' },
      { title: 'That Smile...', description: 'Your smile that makes my heart skip.', image: 'https://picsum.photos/seed/fav2/400/300', sticker: '😊' },
      { title: 'Our Random Adventures', description: 'Getting lost together, finding joy.', image: 'https://picsum.photos/seed/fav3/400/300', sticker: '🗺️' },
      { title: 'My Favorite Picture', description: 'A moment frozen in time, forever.', image: 'https://picsum.photos/seed/fav4/400/300', sticker: '📷' },
      { title: 'That One Special Moment', description: 'When I knew I was home.', image: 'https://picsum.photos/seed/fav5/400/300', sticker: '🏠' },
      { title: 'Just Us', description: 'The best part of every day.', image: 'https://picsum.photos/seed/fav6/400/300', sticker: '💑' },
    ],
    button: 'Continue to Bucket List →',
  },
  bucketList: {
    title: 'Things I Still Want To Do With You ❤️',
    items: [
      { text: 'Travel together ✈️', completed: false },
      { text: 'Watch sunsets 🌅', completed: false },
      { text: 'Take more pictures 📷', completed: false },
      { text: 'Celebrate more anniversaries 🎉', completed: false },
      { text: 'Make more memories 🌸', completed: false },
      { text: 'Grow old together 👴👵', completed: false },
      { text: 'Dance in the rain 🌧️', completed: false },
      { text: 'Build our forever home 🏠', completed: false },
    ],
    button: 'Continue to Our Universe →',
  },
  universe: {
    title: 'Our Little Universe 🌙❤️',
    quote: 'In a universe of possibilities, I\'m grateful you\'re my constant.',
    stars: [
      { message: 'You are my favorite person.' },
      { message: 'I\'d choose you again, every time.' },
      { message: 'More memories to come.' },
      { message: 'You make my world brighter.' },
      { message: 'Forever starts with you.' },
      { message: 'Love you to the moon and back.' },
    ],
    button: 'Continue to Last Surprise →',
  },
  lastSurprise: {
    title: 'Wait... there\'s still one more thing.',
    button: 'Open Your Surprise 🎁',
    revealedMessage: `After everything we've shared, I still can't wait for everything that's yet to come.`,
    revealedSub: `You are my greatest adventure, ${partner1}. I love you more than words can say. ❤️`,
    buttonNext: 'Continue to Finale →',
  },
  finale: {
    title: `Happy Anniversary, ${partner1} ❤️`,
    message: `To more memories, more laughter, more adventures, and a lifetime of choosing each other.`,
    anniversary: `Happy Wedding Anniversary ${partner1} & ${partner2} 💍❤️`,
    forever: 'Forever & Always ❤️',
    button: 'Replay Our Story ↺',
    date: anniversaryDate,
  },
};
export default CONTENT;
