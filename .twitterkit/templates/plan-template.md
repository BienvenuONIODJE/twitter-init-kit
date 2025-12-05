# Twitter Growth Plan: [CAMPAIGN NAME]

**Branch**: `[###-campaign-name]` | **Date**: [DATE] | **Spec**: [link to spec.md]
**Input**: Campaign specification from `/specs/[###-campaign-name]/spec.md`

**Note**: This template is filled in by the `/twitterkit.plan` command. See `.twitterkit/templates/commands/twitterkit.plan.md` for the execution workflow.

---

## Summary

[Extract from campaign spec: primary persona + hero workflow + growth objective]

---

## Twitter Context

<!--
  Define the Twitter landscape for this campaign.
  Focus on personas, channels, content strategy - NOT technical implementation.
-->

**Primary Persona**: [e.g., Senior Backend Engineers, Video Creators, In-House Counsel]
**Twitter Narrative Type**: [Super-Suit (Incremental) OR Digital Employee (Revolutionary)]
**Core Channels**: [Twitter/X, Reddit, Product Hunt, LinkedIn, Discord, YouTube, TikTok]
**Content Pillars**: [e.g., Build in Public, Demo-Driven, Founder-Led, Data Insights]
**Launch Timeline**: [e.g., 8-week campaign from Stealth Alpha to Public Launch]
**Campaign Constraints**: [e.g., founder-only resources, no paid ads, compliance restrictions]

---

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after creating full plan.*

### Alignment with Twitter Marketing Principles

- [ ] **Founder-Led Marketing**: Founder is primary voice (not corporate account)
- [ ] **Build in Public**: Transparent about process, frequent shipping updates
- [ ] **Demo-Driven**: Every major post includes visual proof (video, screenshot, metric)
- [ ] **Narrative & Philosophy**: Selling a better way of working, not just features
- [ ] **Product-Led Growth Loops**: Content naturally encourages sharing/collaboration
- [ ] **Workflow-Level Activation**: Success measured by completed hero workflows, not vanity metrics

### Risk Gates

- [ ] **No "Autonomy Theater"**: Not over-promising AI capabilities
- [ ] **No Generic Wrapper**: Clear defensibility beyond foundation models
- [ ] **No Spam Automation**: Engagement is authentic, not bot-driven
- [ ] **Narrative Alignment**: Twitter promises match product reality

---

## Campaign Structure

### Documentation (this campaign)

```text
specs/[###-campaign]/
├── spec.md              # Campaign specification (/twitterkit.specify output)
├── plan.md              # This file (/twitterkit.plan output)
├── research.md          # Phase 0 output (optional deep-dive research)
├── content-calendar.md  # Phase 1 output (2-week sprint content plan)
├── experiment-log.md    # Phase 1 output (hypothesis testing tracker)
├── growth-loops.md      # Phase 1 output (detailed viral mechanism design)
└── tasks.md             # Phase 2 output (/twitterkit.tasks - NOT created by /twitterkit.plan)
```

### Content Assets (repository root or external)

<!--
  Define where content assets live. Could be in repo or external tools.
-->

```text
# Option 1: In-Repo Content Bank
content/
├── demos/               # Screen recordings, GIFs, demo videos
├── threads/             # Pre-written thread drafts
├── graphics/            # Charts, infographics, comparison tables
├── templates/           # User-shareable templates
└── case-studies/        # Customer stories, testimonials

# Option 2: External Tools
- Notion: Content calendar & experiment log
- Figma: Graphics & social media assets
- Loom/CloudApp: Demo videos
- Typefully/Buffer: Scheduled threads
- Discord: Community engagement hub
```

**Content Strategy Decision**: [Document where content lives and how it's managed]

---

## Campaign Phases & Timeline

### Phase 0: Foundation Setup (Week 0 - Pre-Launch)

**Objective**: Establish Twitter presence and content bank

**Deliverables**:
- [ ] Founder Twitter profile optimized (bio, pinned tweet, banner)
- [ ] Product Twitter account created (if separate from founder)
- [ ] Content bank created with 10-15 "evergreen" posts
- [ ] Hero workflow demo video (60s "Irrefutable Demo") produced
- [ ] Discord/Slack community server set up

**Success Criteria**:
- Founder account has clear positioning in bio
- Demo video demonstrates "time-to-wow" < 15 seconds
- Content bank covers all content pillars (build in public, demos, insights, founder story)

---

### Phase 1: Stealth Alpha (Weeks 1-4)

**Objective**: Validation with high-signal "Lighthouse Users"

**Strategy**: "The All-Bound Engine"
1. Publish authentic content (build in public, founder journey)
2. Identify users complaining about the specific problem you solve
3. Engage with helpful, non-promotional replies
4. DM when they show intent (like, reply, visit website)

**Target**:
- 50-100 Lighthouse Users (founders, senior practitioners, micro-influencers)

**Channels**:
- **Primary**: Twitter DMs & replies (founder-led, manual)
- **Secondary**: Discord invites (exclusive early access)
- **Tertiary**: Reddit (targeted subreddit participation)

**Content Strategy**:
- **3x per week**: "Building in Public" updates (progress, challenges, wins)
- **2x per week**: Problem/pain-point threads (show you understand their struggle)
- **1x per week**: Early demo teasers (show progress, build anticipation)

**Execution**:
1. **Days 1-7**: Identify 50-100 target users (use Twitter lists, search pain-point keywords)
2. **Days 8-14**: Monitor their tweets, draft helpful replies, manually approve & post (10-15 replies/day max)
3. **Days 15-21**: DM users who engage: "I saw you hate [X]. I built a tool that fixes this in 30s. Want to break it?"
4. **Days 22-28**: Onboard alpha users, collect feedback, iterate

**Metrics**:
- **DM Response Rate**: Target >20%
- **Alpha Signup Rate**: 50-100 signups
- **Alpha Activation Rate**: 70%+ complete hero workflow
- **Organic Tweets**: 20+ tweets from alpha users with screenshots

**Risks & Mitigation**:
- **Risk**: Low DM response rate → Mitigation: Improve targeting, make DM more specific to their pain
- **Risk**: Alpha users don't activate → Mitigation: Simplify onboarding, focus on one hero workflow
- **Risk**: No organic sharing → Mitigation: Make "share to X" frictionless in product

---

### Phase 2: Waitlist Beta (Weeks 5-8)

**Objective**: Manufacturing scarcity and social proof

**Strategy**: "The Waitlist for Retweet Loop"
1. Launch landing page with 60s "Irrefutable Demo" video
2. Offer "Skip the Line" access for users who QT launch tweet with their use case
3. Onboard users in cohorts (50/day) to ensure quality & high-touch support

**Channels**:
- **Primary**: Twitter launch thread + demo video
- **Secondary**: Product Hunt launch
- **Tertiary**: Reddit, Hacker News, LinkedIn (cross-post launch)

**Content Strategy**:
- **1x per week**: Major product update thread (new features, improvements)
- **3x per week**: User success stories (quote-tweet alpha user posts)
- **2x per week**: "Behind the scenes" content (how it works, design decisions)
- **1x per week**: Founder insights/"Wall Street Secret" data analysis

**Launch Sequence** (Week 5, Day 1):
1. **6 AM**: Founder posts teaser ("We're launching today. Here's the problem we solve...")
2. **9 AM**: Product account posts launch thread with demo video
3. **12 PM**: Engage with every reply/QT within 2 hours
4. **3 PM**: Post "What we've learned in the first 6 hours" mini-thread
5. **6 PM**: Product Hunt launch goes live
6. **9 PM**: Founder posts "Behind the launch" story thread

**Post-Launch** (Weeks 5-8):
- **Daily**: Engage with new signups' tweets (like, reply, retweet)
- **Weekly**: "Changelog Friday" - recap week's wins & data insights
- **Bi-weekly**: Twitter Spaces AMA (30-45 min, founder + early users)

**Metrics**:
- **Waitlist Signups**: Target 500+ within 48 hours of launch
- **Quote-Tweet Ratio**: >10% on launch tweet
- **DM Inbound Rate**: 50+ DMs from high-value prospects
- **Product Hunt**: Top 5 in category
- **Twitter Engagement Rate**: 3-5% from target personas

**Risks & Mitigation**:
- **Risk**: Launch fizzles → Mitigation: Seed with influencer DMs 48h before, coordinate launch with product drop
- **Risk**: Can't handle inbound volume → Mitigation: Auto-responder for DMs, cohort-based onboarding
- **Risk**: Product breaks under load → Mitigation: Transparent communication, "blooper reel" content to build trust

---

### Phase 3: Public Launch & Momentum (Weeks 9-12)

**Objective**: Unleashing the "User-Generated Content" loop

**Strategy**: Product-led sharing
1. Add "Share to X" button at moment of victory (workflow completion)
2. Incentivize sharing: "Tweet your creation to get [feature/credits] for a month"
3. Feature best user creations on official account

**Growth Loops** (from spec.md):

**Loop A: Demo-to-Retweet**
1. User sees stunning demo of product on Twitter
2. "Wow" factor compels them to retweet with comment
3. Their followers see retweet, loop restarts

**Loop B: Artifact Sharing**
1. User completes workflow (e.g., generates video, builds app, resolves issue)
2. Product generates branded public link with "Made with [Product]" badge
3. User shares artifact, which acts as landing page for new users

**Loop C: Template/Community**
1. Power users create custom workflows/prompts
2. Feature these as "Community Templates"
3. Creator promotes their template to their audience, driving traffic

**Channels**:
- **Primary**: Twitter (founder + product accounts)
- **Secondary**: Discord (community engagement, support, beta features)
- **Tertiary**: YouTube (tutorial videos, case studies)
- **Quaternary**: LinkedIn (founder thought leadership, enterprise positioning)

**Content Strategy**:
- **Daily**: UGC retweets (showcase user creations)
- **3x per week**: Educational threads (how to maximize product, tips & tricks)
- **2x per week**: Data-driven insights ("We analyzed 10,000 workflows, here's what we found...")
- **1x per week**: Founder story/philosophy ("Why we built this", contrarian takes)

**The "Twitter Sprint" Cycle** (2-week cadence):

| **Day** | **Activity** | **Owner** |
|---------|--------------|-----------|
| **Mon (Day 1)** | Sprint Planning: Define "Feature of the Sprint" + narrative hook | Founder + Product |
| **Tue-Thu (Days 2-4)** | Build & Tease: Ship feature, post WIP screenshots to build hype | Eng + Founder |
| **Fri (Day 5)** | The "Drop": Launch feature with thread + demo video, tag influencers | Growth/Marketing |
| **Sat-Tue (Days 6-9)** | Amplify: Engage with every reply, retweet reactions, run Spaces if high traction | Founder |
| **Fri (Day 10)** | The "Changelog": Recap week's wins, share data insight | Founder |
| **Weekend** | Rest & Research: Passive monitoring, identify new pain points for next sprint | Auto-Agent (optional) |

**Metrics**:
- **Weekly Active Users**: 30% week-over-week growth
- **Artifact Shares**: 10+ "Built With [Product]" posts per week
- **Viral Coefficient (K-factor)**: >1.0 (each user brings 1+ new users)
- **Retention (Week 4)**: 50%+ of users still active
- **Influencer Mentions**: 3+ organic mentions/threads per month
- **Share of Voice**: Track mentions in key conversations (brand monitoring tool)

**Risks & Mitigation**:
- **Risk**: Growth plateaus → Mitigation: Launch new growth loop (referral program, integration partnerships)
- **Risk**: Negative sentiment spike → Mitigation: Founder directly addresses concerns, transparent fix timeline
- **Risk**: Founder burnout → Mitigation: Cap manual engagement to 30 min/day, use scheduled threads

---

## Objectives & Strategy Summary

### Strategic Pillars

1. **The "All-Bound" Engine**: Use high-performing organic content to identify prospects, then engage when they show intent
2. **Sprint-Based Experimentation**: 2-week sprints with specific hypotheses, feature drops, content themes
3. **The "Wow" Loop**: Every product update produces a visual artifact users are incentivized to share

### Key Results (OKRs)

**Month 1 (Alpha)**:
- [ ] **Activation**: 70% of alpha signups complete hero workflow within 24 hours
- [ ] **Organic UGC**: 20+ tweets with product screenshots from users
- [ ] **DM Response Rate**: >20% on cold outreach to target personas

**Month 2 (Beta Launch)**:
- [ ] **Waitlist Signups**: 500+ within 48 hours of launch
- [ ] **Retention**: 30% of beta users still active after 4 weeks
- [ ] **Distribution**: Quote-Tweet Ratio >10% on launch announcement

**Month 3 (Public & Scale)**:
- [ ] **Growth**: 30% week-over-week WAU growth
- [ ] **Virality**: 10+ "Built With [Product]" posts per week
- [ ] **Sentiment**: 3+ influencer mentions/threads per month

---

## Metrics & Measurement

Track these weekly in a simple spreadsheet/Notion doc.

| **Category** | **Metric** | **Why It Matters** | **Target** |
|--------------|------------|-------------------|------------|
| **Acquisition** | High-Quality Inbound DMs | Vanity metrics (likes) don't convert. DMs from ICPs do. | 50+/week |
| **Activation** | Time-to-Wow | % of Twitter signups who reach "Aha!" moment < 5 mins | 70% |
| **Retention** | Week 4 Workflow Retention | Are they still using the tool after hype fades? | 50% |
| **Virality** | Artifact Shares per User | Is product generating its own marketing? | 0.3 shares/user/month |
| **Sentiment** | Quote-Tweet Ratio | Are people endorsing (QT) or just scrolling (Like)? | >10% on major posts |
| **Community** | Discord MAU/WAU Ratio | Is community engaged beyond Twitter? | 60% WAU |

### Dashboard Setup

**Tools**:
- **Twitter Analytics**: Track impressions, engagement rate, top tweets
- **Notion/Airtable**: Campaign tracker, experiment log, content calendar
- **Typefully/Buffer**: Schedule threads, track best-performing content
- **Discord Analytics**: Track community growth, message volume, retention
- **Custom Script** (optional): Aggregate Twitter metrics (followers, mentions, sentiment)

---

## Growth Loops & Viral Mechanisms (Detailed)

### Primary Loop: Demo-to-Retweet

**Trigger**: Founder posts 45s screen recording of complex task being solved
**User Action**: Viewers QT with "This changes everything" or similar endorsement
**Capture Mechanism**: DM auto-reply (using Typefully/Hypefury) sends link to waitlist form
**Restart**: QT reaches viewer's followers, loop restarts

**Optimization Tactics**:
- Test different demo lengths (30s vs 60s vs 90s)
- A/B test framing ("Watch this" vs "This is insane" vs "Problem → Solution" structure)
- Track which workflows/features generate highest QT ratio

---

### Secondary Loop: Artifact Sharing (Product-Led)

**Trigger**: User completes hero workflow (e.g., generates video, builds app, resolves issue)
**Product Mechanism**: Generates branded public link (e.g., `myproduct.com/s/xyz`) with "Made with [Product]" badge
**User Action**: Shares artifact on Twitter (incentivized with credits/premium features)
**Viral Effect**: Shared artifact acts as landing page for new users

**Implementation**:
- "Share to X" button at moment of victory (workflow completion screen)
- Pre-filled tweet template: "I just [achieved outcome] in [time] using @ProductHandle. Check it out: [link]"
- Credit/feature unlock for sharing (gamification)

---

### Tertiary Loop: Template/Community

**Trigger**: Power users create custom workflows/prompts
**Product Mechanism**: Feature as "Community Templates" with creator attribution
**Creator Action**: Promotes their template to their audience, linking back to product
**Viral Effect**: Cascading creator-driven distribution

**Implementation**:
- "Publish as Template" feature in product
- Creator profile page with all their templates
- Monthly "Top Creator" spotlight on Twitter

---

## Experiment Log Template

Use this to track Twitter Sprints and growth experiments.

| **Sprint** | **Hypothesis** | **Experiment** | **Target Metric** | **Result** | **Decision** |
|------------|----------------|----------------|-------------------|------------|--------------|
| 1 | "Devs care more about speed than accuracy" | Thread comparing speed vs. quality benchmarks | Engagement Rate | Pivot: They cared about accuracy | Test "correctness" angle |
| 2 | "Video memes drive more clicks than threads" | Post 3 memes vs. 3 threads | Link Clicks | Double Down: Memes worked for top-of-funnel | Increase meme cadence |
| 3 | "Influencers want exclusive access" | DM 20 influencers with VIP invites | Reply Rate | Kill: They ignored it | Try different bait (data insights, not access) |
| 4 | "Before/After comparisons drive signups" | Create 5 comparison graphics | Conversion Rate | TBD | |

---

## Risk Management & Mitigation

### Risk 1: "Autonomy Theater" Backlash

**Description**: If promising autonomous agents, risk massive backlash if agent fails publicly

**Likelihood**: Medium | **Impact**: High

**Mitigation**:
- Be radically transparent about failure rates in content
- Post "blooper reels" of AI messing up to build trust (anti-marketing)
- Frame as "copilot" vs "autopilot" if reliability < 90%
- Have "human-in-the-loop handoff" for graceful degradation

---

### Risk 2: Platform Risk (Twitter Algorithm Shifts)

**Description**: Algorithm changes could tank reach overnight

**Likelihood**: Medium | **Impact**: Medium

**Mitigation**:
- Aggressively move Twitter followers to owned channel (email/Discord)
- Lead magnets: "The Ultimate [Domain] Prompt Guide", exclusive templates
- Build multi-channel presence (YouTube, LinkedIn) early
- Focus on DMs & replies (relationship-driven, algorithm-resistant)

---

### Risk 3: Founder Burnout

**Description**: Founder-led marketing is unsustainable at scale

**Likelihood**: High | **Impact**: Medium

**Mitigation**:
- Cap manual engagement at 30 min/day
- Use scheduled threads for "heavy lifting" content
- Batch content creation (1 day per week for all content)
- Hire community manager at 500+ WAU milestone

---

### Risk 4: Negative Sentiment Spiral

**Description**: One bad experience goes viral, damages brand

**Likelihood**: Low | **Impact**: High

**Mitigation**:
- Founder directly addresses concerns within 2 hours
- Transparent fix timeline and post-mortem
- Turn critics into advocates (personalized outreach, beta program invite)
- "We messed up, here's what we learned" thread (vulnerability builds trust)

---

### Risk 5: "Generic Wrapper" Accusation

**Description**: Community dismisses product as "just another ChatGPT wrapper"

**Likelihood**: Medium (AI products) | **Impact**: Medium

**Mitigation**:
- Content focuses on workflow UX, not AI capability
- Highlight proprietary data, domain expertise, or integration moat
- Show side-by-side comparisons with "raw ChatGPT" to demonstrate value-add
- Customer stories emphasizing workflow transformation, not AI magic

---

## Next Steps

1. **Review this plan** with team/founder for alignment
2. **Run `/twitterkit.clarify`** if any sections need deeper investigation
3. **Run `/twitterkit.tasks`** to break down into executable tasks with ownership
4. **Set up experiment tracking** (Notion, Airtable, or spreadsheet)
5. **Begin Phase 0** (Foundation Setup) immediately

---

**Generated**: [DATE]
**Tool**: `/twitterkit.plan` (twitter-init-kit workflow)
**Next Step**: Run `/twitterkit.tasks` to create execution task breakdown
