ruleset twilio {
   meta {
     configure using
       sid = ""
       authToken = ""
     provides sendMessage, message
   }

   global {
      baseUrl = "https://api.twilio.com/2010-04-01"
      // fromNumber = ""
      // toNumber = ""
      pageSize = 5
      sendMessage = defaction() {
         http:post(<<#{baseUrl}/Accounts/#{sid}/Messages.json>>, form={"To": "+13853849981", "From": "+18305803542", "Body":"this is a test message"}, auth={"username": sid, "password": authToken}) 
         setting (output)
         return output.klog()
      }

      message = function() {
        http:get(<<#{baseUrl}/Accounts/#{sid}/Messages.json?&PageSize=#{pageSize}>>, auth={"username": sid, "password": authToken}).klog() 
      }
   }
 }