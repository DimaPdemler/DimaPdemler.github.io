---
title: "Chess Review MCP — AI Chess Coach"
excerpt: "A chess coach you can actually talk to, grounded in real Stockfish lines instead of guesses. It reviews any game (Lichess, Chess.com, or any PGN), flags your inaccuracies, mistakes, and blunders, then explains them in plain words. It runs both as an MCP server inside Claude Code and as an interactive web board with an eval bar, win graph, move arrows, and an in-browser AI coach. Project website: https://chess-analysis-mcp.github.io/tintins-chess-analysis/"
header:
  teaser: chess_review.png
collection: portfolio
date: 2026-06-01
redirect_from:
  - /projects/projects-6/
---

[Chess Review MCP](https://chess-analysis-mcp.github.io/tintins-chess-analysis/) is a chess coach you can actually **talk to**, and one that **doesn't make things up**. Ask why a move was a mistake or what you should have played, and you get a straight answer **in words**, grounded in real **Stockfish** lines rather than guessed. Under the hood it reviews your game with the engine and finds exactly where you went wrong; the difference is that it then explains it. It works with games from anywhere — Lichess, Chess.com, or any PGN you can paste — and Lichess players get a few extras (fetch recent games by username, auto-load on launch).

It runs two ways that share one engine and one analysis, so they never disagree: from the **Claude Code terminal** as an MCP server, and as an **interactive web board** in the browser.

## Features

- **Full-game review** — an ordered list of your inaccuracies / mistakes / blunders with per-side accuracy, using Lichess-style win%-drop thresholds.
- **Explanations in words** — every flagged move gets a concrete, engine-grounded comment (the better move, its line, and how your move gets punished). No guessing: it is built directly from the engine sweep.
- **Interactive board** (chessground) — replay each mistake, try your own moves, and free-explore down any line, with an eval bar and a Lichess-style win graph that orient to the side you played.
- **Move arrows** — gray for the move you played, green for engine best moves (live multi-PV with progressive deepening), and red for the refutation of a move you try.
- **In-browser AI coach (Snowie)** — a "why? / what now?" chat fed pre-computed engine facts so answers are grounded, not estimated.
- **Cross-game history and a coaching profile** — every reviewed game is saved locally and tagged with recurring mistake motifs (hung pieces, missed forks, back-rank, time trouble…), rolled up into a per-player profile the coach can draw on.

## How it works

One Python process holds a single Stockfish engine pool and one in-memory review session. The MCP server (for Claude Code) and a FastAPI web server run in that **same process** and share the session, so the terminal and the board are always looking at the same analysis. The only part that reaches outside the process is the chat: the backend shells out to the headless `claude` CLI (running on a Claude subscription — no API key, no per-token billing), and the whole pipeline can alternatively be pointed at a local model that speaks the Anthropic API (Ollama, LM Studio, llama.cpp, LiteLLM).

The project is open source under the MIT License. Visit the [project website](https://chess-analysis-mcp.github.io/tintins-chess-analysis/) for an overview, or see the full write-up, installation, and code in the [GitHub repository](https://github.com/Chess-analysis-mcp/tintins-chess-analysis).
