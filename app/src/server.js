const express = require("express");
const helmet = require("helmet");

const app = express();
app.use(helmet());
app.use(express.json());

app.get("/health", (req, res) => res.status(200).json({ status: "ok" }));

app.get("/", (req, res) => {
  res
    .status(200)
    .send("✅ Cloud4Future Node.js app running on EKS via GitHub Actions 🚀");
});

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Listening on port ${port}`));
