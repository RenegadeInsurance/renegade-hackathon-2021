// Next.js API route support: https://nextjs.org/docs/api-routes/introduction

export default function handler(req, res) {
  fetch();
  if (req.method !== 'POST') {
    res.status(400).send({ message: 'Only POST requests allowed' });
    return;
  }

  fetch('http://localhost:3001/questions', {
    method: req.method,
    headers: {
      'Content-Type': 'application/json',
    },
    body: req.body,
  })
    .then(response => response.json())
    .then(response => {
      // window.location.reload();
    });
  res.status(200).json({ name: 'John Does' });
}
