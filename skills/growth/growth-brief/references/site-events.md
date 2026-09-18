# qblab.co analytics events

Mixpanel only, no GA4. The dictionary below mirrors the site repository's README; if the
two differ, the README wins. UTM parameters are registered once per session, so bookings
attribute to the landing source.

| Event | Properties | When |
| --- | --- | --- |
| `Page View` | `path`, `url` | every route change |
| `Section Reached` | `section` | once per landing section per session (30% visible) |
| `Book Call Clicked` | `location`: `navbar` · `hero` · `plans` · `final` · `mobile_bar` · `case_study` | any CTA |
| `Calendar Opened` | — | booking modal opened |
| `Calendar Booked` | `booking_uid`, `event_type`, `$insert_id` | Cal embed success (browser, funnel step) |
| `Booking Confirmed` | `booking_uid`, `event_type`, `start_time`, `attendee_timezone`, `source: webhook`, `$insert_id` | Cal webhook (server, **canonical count**) |
| `WhatsApp Clicked` | `location`: `final` · `footer` | WhatsApp text link |
| `Theme Toggled` | `to` | navbar toggle |
| `Case Study Viewed` | `slug` | `/work/[slug]` mount |

Funnel: `Page View` → `Book Call Clicked` → `Calendar Opened` → `Calendar Booked`, with
`Booking Confirmed` as the true count of calls booked (it also covers bookings made outside
the site's modal).

Read the funnel as unique users per step. `Section Reached` by `section` tells you where
people stop scrolling; the landing sections in order are hero, numbers, what-we-build,
work, how-it-works, plans, fit, people, faq, final.
