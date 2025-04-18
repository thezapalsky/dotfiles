### overal rules

- clean python, prefer functional approach over OOP
- use type hints
- *don't add comments to the code*, explain things only in the chat interface

### project

don't use `pip install` use `uv pip install` instead

### style

prefer to use `str | None` instead of `Optional[str]` type hints
don't use 'Any' type hint
don't use walrus

### file structure

main functions first, helper functions later, constants and helpers last

### docs

when generating documentation, do it very briefly - one line
leave new line between function docstring and code

