// Next.js API route support: https://nextjs.org/docs/api-routes/introduction

export default function handler(req, res) {
  fetch();
  if (req.method !== 'POST') {
    res.status(400).send({ message: 'Only POST requests allowed' });
    return;
  }

  const question = req.body
  //saveAnswer
  question.answers.forEach(async (answer, index) => {
    await fetch('http://165.232.186.133/api/answers', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(answer),
    }).then(response => response.json())
    .then(response => {
      question.answers[index] = {...{_id: response.payload.data._id}};
    })
    .catch(e => {
      console.log(e);
    })
  });


  fetch('http://165.232.186.133/api/questions', {
    method: req.method,
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(question),
  })
    .then(response => response.json())
    .then(response => {
      // code..
    })
    .catch(e => {
      console.log("error while saving question");
    });
  res.status(200).json(question);
}
