# Weazel News Display
A Simple Weazel News display functions like a notification system, utilizing the native GTA V Weazel News announcements.

# Sample Usage:

```lua
TriggerServerEvent("cfx-tcd-newsDisplay:Server:Broadcast", "Breaking News", "This is a test message", "This is a test bottom message", 10000)

or

exports['cfx-tcd-newsDisplay']:displayNews("Breaking News", "This is a test message", "This is a test bottom message", 10000)
```