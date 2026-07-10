// server.js
// Simple Express backend that keeps your Anthropic API key secret
// and proxies farming questions from the browser to Claude.

require('dotenv').config();
const express = require('express');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.static('public')); // serves index.html if placed in /public

const API_KEY = process.env.ANTHROPIC_API_KEY;
const MODEL = 'claude-sonnet-4-5'; // change if you have access to a different model

if (!API_KEY) {
  console.warn('⚠️  No ANTHROPIC_API_KEY found. Copy .env.example to .env and add your key.');
}

app.post('/api/ask', async (req, res) => {
  try {
    const { question, state, domain } = req.body;

    if (!question || !question.trim()) {
      return res.status(400).json({ error: 'Question is required.' });
    }

    const systemPrompt = `You are an expert agricultural advisor for Indian farmers.
Answer farming questions clearly and practically.
The farmer is from ${state || 'India'} and is interested in ${domain || 'general farming'}.
Keep answers helpful, concise (3-5 sentences), and practical.
Include relevant local context when possible.
If the question is not related to farming/agriculture, politely redirect them.`;

    const response = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY,
        'anthropic-version': '2023-06-01'
      },
      body: JSON.stringify({
        model: MODEL,
        max_tokens: 1000,
        system: systemPrompt,
        messages: [{ role: 'user', content: question }]
      })
    });

    const data = await response.json();

    if (!response.ok) {
      console.error('Anthropic API error:', data);
      return res.status(response.status).json({ error: data.error?.message || 'API error' });
    }

    const answer = data.content.map(b => (b.type === 'text' ? b.text : '')).join('');
    res.json({ answer });

  } catch (err) {
    console.error('Server error:', err);
    res.status(500).json({ error: 'Something went wrong on the server.' });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`✅ Server running at http://localhost:${PORT}`);
});
