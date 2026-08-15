#!/bin/bash

# Replace Memory Images
sed -i 's|/images/memory-1.jpg|https://picsum.photos/seed/mem1/400/300|g' client/src/data/content.js
sed -i 's|/images/memory-2.jpg|https://picsum.photos/seed/mem2/400/300|g' client/src/data/content.js
sed -i 's|/images/memory-3.jpg|https://picsum.photos/seed/mem3/400/300|g' client/src/data/content.js
sed -i 's|/images/memory-4.jpg|https://picsum.photos/seed/mem4/400/300|g' client/src/data/content.js

# Replace Photo Wall Images
sed -i 's|/images/wall-1.jpg|https://picsum.photos/seed/wall1/400/400|g' client/src/data/content.js
sed -i 's|/images/wall-2.jpg|https://picsum.photos/seed/wall2/400/400|g' client/src/data/content.js
sed -i 's|/images/wall-3.jpg|https://picsum.photos/seed/wall3/400/400|g' client/src/data/content.js
sed -i 's|/images/wall-4.jpg|https://picsum.photos/seed/wall4/400/400|g' client/src/data/content.js
sed -i 's|/images/wall-5.jpg|https://picsum.photos/seed/wall5/400/400|g' client/src/data/content.js
sed -i 's|/images/wall-6.jpg|https://picsum.photos/seed/wall6/400/400|g' client/src/data/content.js

# Replace Favorite Moments Images
sed -i 's|/images/fav-1.jpg|https://picsum.photos/seed/fav1/400/300|g' client/src/data/content.js
sed -i 's|/images/fav-2.jpg|https://picsum.photos/seed/fav2/400/300|g' client/src/data/content.js
sed -i 's|/images/fav-3.jpg|https://picsum.photos/seed/fav3/400/300|g' client/src/data/content.js
sed -i 's|/images/fav-4.jpg|https://picsum.photos/seed/fav4/400/300|g' client/src/data/content.js
sed -i 's|/images/fav-5.jpg|https://picsum.photos/seed/fav5/400/300|g' client/src/data/content.js
sed -i 's|/images/fav-6.jpg|https://picsum.photos/seed/fav6/400/300|g' client/src/data/content.js

# Replace Surprise & Finale Photos
sed -i 's|/images/surprise-photo.jpg|https://picsum.photos/seed/surprise/600/400|g' client/src/data/content.js
sed -i 's|/images/finale-photo.jpg|https://picsum.photos/seed/finale/600/400|g' client/src/data/content.js

# Add Online Music (Free Sample)
sed -i 's|/music/romantic.mp3|https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3|g' client/src/context/MusicContext.jsx

echo "✅ All images and music updated to online sources!"
echo "Now run: npm run dev"
