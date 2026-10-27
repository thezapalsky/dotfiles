# Reuse scan evidence for collection checks

Read when combining opening reports, counting owned copies or checking whether a card was opened. This supports scan records; deck construction and format/metagame research are separate tasks.

- Assign one stable `pull_id` per physical card/copy and one or more `reveal_id` events to its appearances. Preserve source file, source timestamp and identification confidence. A later edit or recap of the same source is not another opening.
- Maintain separate data for physical pulls, reference catalogs, price snapshots and edit events. A card present in a downloaded Scryfall catalog is not evidence of ownership. An opponent's deck or proposed upgrade list is not the user's collection.
- Merge independent opening reports by source and stable pull identifiers, not by every named timeline row. Foil, alternate-art and ordinary printings of the same game card are separate physical copies but share the same gameplay identity when counting a playset.
- Store Scryfall ID, Oracle ID and full face names where available. Resolve double-faced cards by either face and canonical full name; match exact game identity, not a substring such as `Peter Parker` inside `Peter Parker's Camera` or `Green Goblin` inside a different Goblin card name. Search variants beyond the base collector number, constrain the set, and flag possible OCR aliases for visual review.
- Log quantity and identification/finish confidence separately. Keep basic land packets, tokens, promos and accessories distinct; inferred bundle contents are not individually observed cards.
- Report `confirmed in these opening reports`, `not recorded in the checked reports`, and `unresolved` separately. A negative report search does not prove a card was never opened or is not physically owned, and a past pull does not prove it is still in the collection.
- For disputed or uncertain identifications, inspect adjacent full-resolution frames at the recorded source time. State whether verification used reports, new video inspection, or a physical inventory, and identify the covered recordings.

Keep report provenance and useful evidence frames beside the project. Do not bundle collection inventories, prices, photos or source footage into the reusable skill.
