<!--- Create the application --->
   <cfapplication name="MyApp"
   	clientmanagement="Yes"
       sessionmanagement="Yes"
       sessiontimeout="#CreateTimeSpan(0,0,15,0)#"
       applicationtimeout="#CreateTimeSpan(0,2,0,0)#" />
   
   <!--- Now define that this user is logged out by default --->
   <CFPARAM NAME="session.allowin" DEFAULT="false" />
   
   <!--- Now define this user id to zero by default, this will be used later on to access specific information about this user. --->
   <CFPARAM NAME="session.user_id" DEFAULT="0" />
   
   <!--- Now if the variable "session.allowin" does not equal true, send user to the login page --->
   <!--- the other thing you must check for is if the page calling this application.cfm is the "login.cfm" page and the "Login_process.cfm" page since the Application.cfm is always called, if this is not checked the application will simply Loop over and over. To check that, you do the following call --->
   
   <cfif session.allowin neq "true">
   	<cfif  ListLast(CGI.SCRIPT_NAME, "/") EQ "login.cfm">
       <cfelseif ListLast(CGI.SCRIPT_NAME, "/") EQ "login_process.cfm">
       <cfelse>
       	<!--- this user is not logged in, alert user and redirect to the login.cfm page --->
           <script>
           	alert("You must login to access this area!");
               self.location="../resources/components/login.cfm";
           </script>
       </cfif>
   </cfif>