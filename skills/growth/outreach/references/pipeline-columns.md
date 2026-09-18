# pipeline.csv columns

One row per target. Header row exactly:

```
date,company,person,role,channel,observation,status,next_action,next_action_date,source_file,notes
```

- `date`: ISO date the row was created
- `channel`: `email` or `linkedin`
- `observation`: the ten-word version of the specific thing you noticed
- `status`: `drafted` → `sent` → `replied` → `booked` → `won` / `no` / `silent`
- `next_action`: `send m1`, `send m2`, `send m3`, `book`, `none`
- `next_action_date`: ISO date; day 4 and day 10 follow the send date of message 1
- `source_file`: the outreach markdown file holding the full sequence
- `notes`: free text; quote replies briefly

The skill writes rows with status `drafted`. Only the owner changes status. The
`growth-brief` skill reads this file to list follow-ups that are due.
