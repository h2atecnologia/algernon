--
-- Stream Server-Sent Events (SSE)
--

content("text/event-stream;charset=utf-8")
setheader("Cache-Control", "no-cache")
setheader("Connection", "keep-alive")
setheader("Access-Control-Allow-Origin", "*")

function event(message)
  log("EVENT: " .. message)
  print("data: " .. message .. "\n")
  flush()
end

function finish()
  log("Done streaming events")
  print("\n")
  flush()
end

function main()
  log("Steaming events")
  log("Turn off buffering for this to work properly (turn off debug mode)")

  -- The following must take < 10 seconds, before the request times out
  event("one event")
  sleep(2)
  event("a second event")
  sleep(1)
  event("a third event")
  sleep(0.2)
  event("yet another event")
  sleep(1)
  event("eventorama!")
  sleep(3)
  event("done")
  finish()
end

main()