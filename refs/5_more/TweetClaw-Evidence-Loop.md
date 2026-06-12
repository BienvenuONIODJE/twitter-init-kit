# TweetClaw Evidence Loop for Twitter Launch Specs

Use this workflow when a launch plan needs current X/Twitter evidence before the
agent writes specs, content pillars, reply scripts, or daily tasks.

TweetClaw is an optional OpenClaw plugin for searching tweets, searching tweet
replies, monitoring X/Twitter accounts, exporting followers, posting tweets,
posting replies, managing media, and running giveaway draws through structured
Xquik endpoints. It helps twitter-init-kit users move from guessed audience
language to reviewed evidence.

## Install

```bash
openclaw plugins install npm:@xquik/tweetclaw
openclaw config set plugins.entries.tweetclaw.config.apiKey "$XQUIK_API_KEY"
openclaw config set tools.alsoAllow '["explore", "tweetclaw"]'
openclaw plugins inspect tweetclaw --runtime
```

Keep API keys out of chats, docs, logs, and shell history. Use environment
variables or OpenClaw sensitive plugin config.

## Evidence Pass

Run this before `/twitterkit.specify` or before finalizing `/twitterkit.plan`.

1. Define the launch niche, product category, buyer role, and 5 to 10 target keywords.
2. Use `explore` to find tweet search, reply search, user lookup, trends, and monitor endpoints.
3. Search tweets for each keyword and save representative public posts,
   objections, language patterns, and competitor claims.
4. Search replies on high-signal launch, founder, competitor, or category
   tweets to capture buyer questions and objections.
5. Look up 10 to 30 relevant accounts and classify them as founder, buyer, analyst, partner, competitor, or media.
6. Optional: create narrow monitors for approved accounts or keywords during launch week.
7. Summarize only the evidence needed for the spec: audience wording, pain
   points, proof gaps, content hooks, reply angles, and follow-up tasks.

## Spec Inputs

Add a short evidence section to the campaign spec:

```markdown
## X/Twitter Evidence

- Keywords searched:
- Accounts reviewed:
- Strongest buyer language:
- Common objections:
- Competitor claims:
- Reply patterns:
- Content hooks to test:
- Monitors approved:
```

## Safety Rules

- Confirm with the user before any post, reply, DM, follow, retweet, like,
  monitor, webhook, extraction, draw, or paid recurring action.
- Show the exact public text and target account before any write.
- Keep searches narrow. Do not collect private or account-scoped data unless the user confirms authorization.
- Do not store raw credentials or paste API keys into specs, references, screenshots, or issues.
- MPP mode is read-only. Do not use it for posting, monitors, webhooks, DMs,
  media uploads, profile changes, or account-backed reads.

## Example Agent Prompt

```text
Use TweetClaw only for X/Twitter evidence gathering. Search tweets and replies
for my launch keywords, then summarize buyer wording, objections, and 10 content
hooks. Do not post, reply, DM, follow, like, retweet, create monitors, or start
recurring jobs without asking me first.
```

## Links

- TweetClaw GitHub: https://github.com/Xquik-dev/tweetclaw
- npm registry metadata: https://registry.npmjs.org/@xquik%2ftweetclaw
- Xquik docs: https://docs.xquik.com
