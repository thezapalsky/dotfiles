# Agent skills

Reusable workflows in the [Agent Skills format](https://agentskills.io/specification).

- [`tiktok`](tiktok/SKILL.md): scan and price MTG openings, edit vertical videos, and handle requested TikTok drafts or schedules.

Each skill contains a `SKILL.md` with YAML metadata and optional `references/`, `scripts/` or `assets/`. This video skill intentionally ships no sound recordings or personal project data. Supply your own effects and keep footage, price snapshots, account details and edit manifests outside this repository.

## Use with Codex

For user-wide discovery, copy or symlink the individual skill folder into `~/.agents/skills/`. For example, replacing the checkout location with your own:

```sh
mkdir -p ~/.agents/skills
ln -s /path/to/dotfiles/skills/tiktok ~/.agents/skills/tiktok
```

If a same-name skill is already installed, reconcile it first rather than creating a duplicate or overwriting local assets. For a project-only install, use that project's `.agents/skills/` directory instead. Keeping folders under this repository's `skills/` alone does not enable automatic discovery.

Invoke the installed skill as `$tiktok`. See [Codex skill documentation](https://learn.chatgpt.com/docs/build-skills) for current discovery rules.
