ruleset app {
   meta {
      use module twilio
         with
            sid = meta:rulesetConfig{"sid"}
            authToken = meta:rulesetConfig{"authToken"}
      shares message
   }
   global {
      message = function() {
         twilio:message()
      }
   }

   rule sendMessage {
      select when app sendMessage
      twilio:sendMessage()
   }
 }