export const pagesConfig = [
  { id: 2, path: '/page/2', component: 'Welcome', label: 'Welcome' },
  { id: 3, path: '/page/3', component: 'Anniversary', label: 'Our Special Day' },
  { id: 4, path: '/page/4', component: 'HowItStarted', label: 'How It All Started' },
  { id: 5, path: '/page/5', component: 'Memories', label: 'Our Memories' },
  { id: 6, path: '/page/6', component: 'Firsts', label: 'Our Firsts' },
  { id: 7, path: '/page/7', component: 'Reasons', label: 'Reasons I Love You' },
  { id: 8, path: '/page/8', component: 'Surprise', label: 'Little Surprise' },
  { id: 9, path: '/page/9', component: 'PhotoWall', label: 'Photo Wall' },
  { id: 10, path: '/page/10', component: 'Letter', label: 'A Letter For You' },
  { id: 11, path: '/page/11', component: 'FavoriteMoments', label: 'Favorite Moments' },
  { id: 12, path: '/page/12', component: 'BucketList', label: 'Bucket List' },
  { id: 13, path: '/page/13', component: 'Universe', label: 'Our Little Universe' },
  { id: 14, path: '/page/14', component: 'LastSurprise', label: 'One Last Surprise' },
  { id: 15, path: '/page/15', component: 'Finale', label: 'Anniversary Finale' },
];
export const getNextPage = (currentId) => {
  const index = pagesConfig.findIndex(p => p.id === currentId);
  if (index === -1 || index === pagesConfig.length - 1) return null;
  return pagesConfig[index + 1].path;
};
export const getPrevPage = (currentId) => {
  const index = pagesConfig.findIndex(p => p.id === currentId);
  if (index <= 0) return null;
  return pagesConfig[index - 1].path;
};
export default pagesConfig;
