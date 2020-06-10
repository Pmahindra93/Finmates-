// import cable from '../cable'

// const initOwnContentCable = () => {
//   const ownContentCommentContainer = document.getElementById('own_content_comments');
//   if (ownContentCommentContainer) {
//     const id = ownContentCommentContainer.dataset.chatroomId;

//     consumer.subscriptions.create({ channel: "OwnContentChannel", id: id }, {
//       received(data) {
//         ownContentCommentContainer.insertAdjacentHTML('beforeend', data);
//         // console.log(data); // called when data is broadcast in the cable
//       },
//     });
//   }
// }

// export { initOwnContentCable };
