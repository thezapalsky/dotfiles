---
name: tiktok
description: Scan and price Magic the Gathering booster or bulk-card footage, then edit finished TikToks with readable reveals, EUR values, sound and consistent episode pacing. Use for scan-first reports, video revisions and requested TikTok handoffs; not general product reviews or deck construction.
---

# MTG booster video workflow

Edit local booster-opening and bulk-card footage into actual playable TikToks. Adapt the workflow to the current source and user request; do not treat one project’s unusual framing, caption or sound profile as a universal template.

Prefer FFmpeg/ffprobe for inspection, cutting, color conversion, compositing, audio mixing, and encoding. Use image analysis for card identification and framing; an editor UI is optional when it materially helps. Preserve original recordings. Save versioned outputs and reproducible edit data outside unrelated repositories.

## Editing defaults

Use these defaults unless the current user or project specifies otherwise:

- Use moving footage, with natural card reveals and some handling between them. Cut or speed up boring parts; do not slow down the whole video or turn it into a slideshow.
- On-screen text is card values in EUR. No spoken commentary, subtitles or card-name labels by default. Short approved hooks, result summaries and future-episode teasers are allowed; see the series section and optional edit modes below.
- Correct lighting and color, and crop/rotate when needed. Use straightforward framing rather than automatic background blur or perspective-flattened card cutouts.
- Use the three configurable price-sound tiers below for ordinary booster reveals when suitable effects are supplied. An approved bulk sound profile overrides these tiers. Preserve useful original opening audio underneath. Leave background music for TikTok unless the user asks to embed it.
- Keep the style consistent across parts. A request to do the next video with the same instructions carries these choices forward without asking the user to repeat them.
- When revising an approved edit, change the requested section or property and preserve the rest.

## Optional modes and references

Load only the reference relevant to the request:

- [Bulk cards, supporting photos and result summaries](references/special-edits.md): individual price flashes plus cumulative sums, sparse full-length sound effects, purchase cost/FX, packaging photos and approved endings.
- [Captions and TikTok handoff](references/tiktok-handoff.md): spoiler-free descriptions, Chrome/browser or computer-use control, covers/music, verified drafts and authorized schedules.
- [Collection evidence](references/collection-evidence.md): combine scans and check reported ownership without treating reference catalogs or repeated edits as new pulls.

Keep current decisions in a project manifest: target duration, sources/booster groups, internal part and public episode, crop/color settings, overlay layout, sound assets/threshold/volume/tail policy, caption/cover/music and publishing status. Carry this state across revisions and parts. Skill text is not the current episode counter.

## 1. Inspect footage and establish the parts

Inspect each source's duration, decoded dimensions, rotation/display matrix, frame rate, audio, and color metadata. Account for FFmpeg autorotation before adding another rotation.

Extract coarse timestamped contact sheets, then closer samples around wrapper openings and reveals. Inspect actual full-resolution frames when identifying cards. Do not use thumbnail sharpness alone as proof that a card is legible.

Identify:

- How many boosters are actually opened in each source and where each one begins/ends.
- Whether a recording starts midway through an opening or continues a previous recording.
- The ordered card reveals, repeated views, tokens, and lands.
- Useful opening action, pauses, sorting, camera detours, and shaky or unreadable stretches.

Count boosters from observed opening sequences, not by dividing the number of price overlays by an assumed pack size.

Keep separate outputs for requested parts. Reuse the established typography, price format, sound threshold, and general pacing across them, while adjusting exposure and crop to each recording.

### Scan-first requests and bundle structure

When asked to scan and price before editing, deliver the card manifest, dated price list, observed booster counts and proposed part boundaries first. Do not start the edit during that phase. Report total raw duration separately from the footage relevant to each part.

For a bundle, separate packaging, accessories, promo and land packets from actual booster openings, even when they share a source file. A bundle land/promo paper wrapper is not a Collector Booster wrapper. Keep initial scan groups separate from final episode groups: a later pacing revision may split the same nine Play Boosters into three episodes of three rather than two rushed episodes. Verify actual footage and counts instead of treating any historical split as the default.

## 2. Build the card log and edit manifest

Create a durable manifest before attaching prices and sounds. It should connect source footage to final output timing, rather than relying on handwritten offsets scattered through scripts.

Useful fields:

```text
project_id, part, public_episode, source_file, booster_id, pull_id, reveal_id
source_in, source_out, reveal_source_time
card_name, set_code, collector_number, scryfall_id, oracle_id, finish, identification_confidence, quantity
price_eur, price_metric, price_source_url, price_retrieved_at
speed, crop, rotation, output_in, output_out, reveal_output_time, effect_asset
individual_value, cumulative_value, overlay_layout, sound_profile, cue_suppressed_reason
```

Keep a scan manifest for physical pulls and a separate edit timeline for appearances, linked by stable IDs. Keep downloaded reference catalogs separate from both; catalog presence is not ownership. Separate physical pulls from repeated appearances of the same card. Two copies from separate boosters are two pulls; the same card shown again is not automatically a new reveal or another sound cue.

Identify exact printing and foil/nonfoil finish using card name, artwork, set symbol, collector number, and visible foil behavior. Inspect neighboring frames for obscured details. Do not guess an uncertain variant or treat missing information as confirmed.

Keep cached reference data and selected inspection frames if they will help revisions, but do not replace the user's video with official card images unless requested.

## 3. Retrieve and document EUR values

Use the requested Cardmarket metric where it can be verified. Distinguish lowest listings, trend prices, and averages; never silently substitute one for another.

Scryfall's Cardmarket-linked EUR feed can be a practical fallback. If used, describe it as a dated indicative feed value, not a verified live Cardmarket listing or trend price. Match the exact printing and use `prices.eur` for nonfoil or `prices.eur_foil` for foil. Missing prices remain unknown, not zero.

Save currency, finish, printing identifiers, source links, metric/feed, and retrieval date. Fetch current values when requested rather than reusing an old project's prices. Keep a consistent source/metric across parts unless the user chooses otherwise.

If a printing or price remains unresolved, seek a clearer frame or flag the gap. Do not invent a price to complete the overlay list.

### Land packets and totals

Preserve individual prices for clearly, slowly presented lands. When the user starts rapidly fanning through the rest of a land packet, show one approximate total near the end, such as `≈ €2.54`. For a rapidly shown nonfoil packet, use only its summary. Keep foil and nonfoil packet totals separate and exclude the promo from both. A summary includes the earlier individually priced lands; do not add those values twice.

Calculate totals from the current project snapshot and exact quantities; do not reuse example prices as current values. Label quantities derived from standard bundle contents rather than individually counted footage. Distinguish booster pulls including booster lands, promo, and separate bundle lands in overall totals; keep tokens and accessories separate.

When matching a catalog, constrain the set as well as name/collector number. A name such as Shock can exist in both SPM and MAR at different values. OCR can miss short names or mistake flavor-text names for pulls; visually check every reveal and apparent gap.

## 4. Make the picture edit

Choose pacing from the source and requested outcome. A multi-booster montage and a single short opening need different durations. There is no universal 24-second or 40-second target. When asked to fit one minute, target at most 60 seconds including opening and ending; if that makes reveals rushed, divide the boosters into more episodes instead of forcing unreadable cuts. Keep each requested single-booster video separate. Verify exported duration rather than relying on an intended timeline length.

- Keep a useful piece of wrapper opening and natural card flips. Retain a deliberate moving intro, such as the box sliding across the table, from the start of its motion rather than only after it stops.
- Shorten long pauses, repeated sorting, empty table shots, and camera detours. Speed ramps or accelerated handling can work for boring sections, but return to normal speed for reveals.
- Give each card a recognizable, reasonably clear moment. Do not convert “readable” into mandatory long freezes for every rules paragraph.
- Use brief holds or selective slowing only when consistent with the user's request. Avoid heavy slow motion or a full still-frame presentation unless requested.
- Preserve useful movement between reveals instead of cutting every shot to an isolated card image.

Apply the simplest crop and rotation that make the cards upright and reasonably large. Hands and some ordinary table background can remain. Use wider framing for a clean opening and closer framing for reveals when appropriate.

For unusual camera movement, start with a few stable crops or gentle reframing. Feature matching or optical flow can guide rectangular crops if necessary, but validate estimates and reject jumps. Do not turn tracking into aggressive per-frame zooming, perspective warping, or cropped-off card text.

End on a completed action, such as setting the cards aside, with a brief natural settling moment. Do not stop halfway through sorting or restacking. If the user removes a closing Collector-wrapper teaser, keep it removed; a text cue can announce the next part without restoring that shot.

Render and inspect a representative short sample before the full export: include an opening, a flip, a clear card, a price, and the active sound profile (all applicable tiers or the selected sparse bulk cues). Do not repeatedly redesign the entire edit while addressing a small revision.

## 5. Correct exposure and color

Inspect source color metadata. Convert HDR to SDR deliberately; relabeling HDR as BT.709 is not a conversion. Compare representative source and rendered frames for skin tones, neutral card text boxes, black borders, and foil reflections.

An illustrative starting point for iPhone HLG/BT.2020 footage is:

```text
zscale=p=bt709:t=bt709:m=bt709:npl=1000:r=tv,
format=yuv420p,
eq=saturation=0.65:contrast=1.05:brightness=0.015,
colorbalance=rm=-0.015:bm=0.025:rh=-0.015:bh=0.04
```

Darker footage may need a different starting point:

```text
zscale=p=bt709:t=bt709:m=bt709:npl=1000:r=tv,
format=yuv420p,
eq=saturation=0.75:contrast=1.03:brightness=0.035
```

These are illustrative settings, not universal presets or guaranteed tone-mapping solutions. Tune each source after visual comparison. Avoid washed-out colors, excessive saturation, aggressive sharpening, and claims that motion blur or covered text were recovered.

## 6. Add values and sound cues

Display values such as `€0.07` with consistent typography, strong contrast, and mobile-safe placement away from card text. Show each value when that card is visibly revealed; clear it during unrelated footage. No other commentary text by default. For requested bulk layouts, keep individual flashes and a distinct cumulative total rather than silently replacing one with the other; see the optional bulk reference.

Calculate output timestamps from the final cuts and speed changes. For a constant-speed segment, elapsed output time is elapsed source time divided by its playback-speed factor. Rebuild cue times after every timing revision. Overlays and effects should share the same reveal event.

This public skill does not bundle sound recordings. Use effects supplied by the user or obtained under a license appropriate to the intended use. Store their actual paths and any applicable source/license details in the project manifest; do not assume a personal SFX directory or fabricate an asset path.

A configurable ordinary booster profile is:

| Value | Sound role |
|---|---|
| Greater than €1.00, individual card hit | Celebratory hit/cheer |
| Greater than €0.10 up to and including €1.00 | Higher-value cash cue |
| €0.10 or less | Subtle low-value cue |

Map each role to an existing supplied effect before rendering it. If no sound is available, preserve original handling audio and report that the effect is omitted rather than blocking the picture edit. Do not download an arbitrary recording or include third-party audio in a distributed skill without suitable permission.

For replacements, inspect/audition and, when the user permits trimming, trim silence or spoken introductions and fade the tail to fit. A request for the original full sound at normal speed overrides trimming or acceleration; use fewer cues instead. Reuse an existing approved effect if a replacement has not yet been selected.

Use the ordinary high-price sound for aggregate land summaries, even when the packet total exceeds €1; the cheer tier celebrates individual hits.

Under the standard booster profile, use one cue per new priced reveal; threshold-based bulk profiles can suppress cues. Do not guess a sound tier for an unknown price. Audition replacement sounds rather than choosing from filenames; trim silence or spoken introductions only when permitted by the selected profile.

Mix at comparable perceived loudness; tune to the actual recordings rather than reusing a fixed peak setting. Keep original handling audio comfortable underneath. Adjust a quiet cheer relative to the rest of the mix and let it run longer when the scene has room. Fade or shorten effects only when allowed by the chosen sound profile; for full-original effects, suppress colliding cues rather than chopping their tails. Test the result on a representative dense sequence as well as an isolated reveal.

A deterministic approach is to decode effects to stereo 48 kHz float audio, place them into a finite timeline buffer, mix with original audio, prevent clipping, and encode AAC. Explicitly bound duration; unbounded audio padding caused problems in earlier renders. Listen to the resulting mix.

Do not embed background music by default. Add it later in the publishing app when requested.

## Series identity and engagement

Continue the user's existing chase series across new purchases; do not restart numbering simply because a new bundle is opened. Keep internal source-part numbering separate from public episode numbering. Consult the current project/publishing records and verify the latest episode before assigning a number; later regrouping can invalidate historical mappings. Preserve the chase premise without implying the target card was pulled.

Use brief approved hooks over moving footage near the opening. Preserve a useful motion intro from its beginning, and avoid a separate title card unless requested. Keep text within the mobile safe area, away from prices and readable product details. A next-part promise is optional: remove it when requested, and do not restore an unwanted ending just because it appeared in a previous version. Render and visually verify emoji support; a transparent rendered glyph is a fallback when the video renderer cannot load a color-emoji font.

For requested descriptions, use the spoiler-free title / blank line / pack-count line / blank line / hashtags pattern in [the handoff reference](references/tiktok-handoff.md). Do not reveal card names, totals or reactions in the caption unless requested. Editing a video does not authorize uploading, scheduling or publishing it.

When asked for engagement advice, consult current primary TikTok guidance and compare it with the actual edit. Separate advertising research from evidence about organic posts. Prefer a clear early premise, purposeful pacing, useful sound and an honest next-part cue; do not add effects or shorten footage merely to meet a supposed universal ideal duration. Suggest checking retention after publishing rather than promising reach. Music remains an in-app publishing step unless requested otherwise.

## Optional: exclude unwanted background details

Apply this only when the footage or user request requires it; it is not the main editing workflow.

Retain hands and useful opening action while excluding unwanted personal or background details. The established preference is cropping or cutting unsuitable moments rather than blur. Keep the specific exclusions in the project notes rather than preserving private scene details in this reusable skill.

Prefer a tighter ordinary crop or removal of an unsuitable shot. Inspect flips and camera movements for brief background leaks. Avoid automatically introducing blur, masks, synthetic backgrounds, or blurred portrait filler. If the requested framing and exclusions cannot both be achieved, explain the specific trade-off.

## 7. Export and verify

Typical delivery is vertical 1080×1920 H.264, yuv420p, square pixels, correctly converted/tagged SDR BT.709, stereo AAC at 48 kHz, and fast-start metadata. Respect a different requested format. Do not force a portrait layout with blurred filler without approval.

Verify the final artifact:

- Review every booster/card sequence, the opening, transitions, final frame, crop stability, and readable card bounds.
- Check the card log against the video: no missed pulls, accidental duplicates, wrong finish prices, or stale overlays.
- Check reveal/price/sound synchronization after the final edit, including accelerated sections and joins.
- Listen for clipping, overlapping cues, abrupt cuts, unintended silence, and unwanted music.
- Check any requested background exclusions across transitions, not only midpoint stills.
- Fully decode the exported file and confirm duration, dimensions, codecs, and audio/video alignment.

For a ≤60-second request, verify the actual encoded duration including the ending. Confirm that a final action or summary has not been clipped while meeting the limit.

Save versioned deliverables, the manifest, price provenance, needed assets, and reproducible edit settings in a durable folder. Temporary folders can disappear between turns. Do not package experimental one-off scripts as validated reusable tools.

Deliver the actual video inline using an absolute local path, with a concise duration and description of the change. For multiple parts, clearly label each output and report verified booster counts when useful. Do not claim checks not performed, or publish/upload without a user request. If a TikTok handoff is requested, follow the handoff reference and report the verified persisted status rather than treating successful upload as successful draft creation.
