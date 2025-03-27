# Get all services that are running
$Services = Get-Service | Where-Object {$_.Status -eq "Running"}

#Display the services
$Services

#Display the type of the $services object
$Services.GetType()

#what is array?
#An array is a data structure that stores a collection of elements, each identified by at least one array index or key. It is used to store a collection of data, and it is one of the simplest data structures in programming.

#how can I create an array?
#You can create an array in PowerShell by using the @() syntax. For example:
$myArray = @("apple", "banana", "cherry")

#More on this later 
$myArray.GetType()

$services | get-member
# members has methods and properties
# methods are actions you can perform on the object
# properties are attributes of the object

<#

   TypeName: System.ServiceProcess.ServiceController

Name                      MemberType    Definition
----                      ----------    ----------
Name                      AliasProperty Name = ServiceName
RequiredServices          AliasProperty RequiredServices = ServicesDependedOn
Disposed                  Event         System.EventHandler Disposed(System.Object, System.EventArgs)
Close                     Method        void Close()
Continue                  Method        void Continue()
CreateObjRef              Method        System.Runtime.Remoting.ObjRef CreateObjRef(type requestedType)
Dispose                   Method        void Dispose(), void IDisposable.Dispose()
Equals                    Method        bool Equals(System.Object obj)
ExecuteCommand            Method        void ExecuteCommand(int command)
GetHashCode               Method        int GetHashCode()
GetLifetimeService        Method        System.Object GetLifetimeService()
GetType                   Method        type GetType()
InitializeLifetimeService Method        System.Object InitializeLifetimeService()
Pause                     Method        void Pause()
Refresh                   Method        void Refresh()
Start                     Method        void Start(), void Start(string[] args)
Stop                      Method        void Stop()
WaitForStatus             Method        void WaitForStatus(System.ServiceProcess.ServiceControllerStatus desiredStatus), void WaitForStatus(System.ServiceProcess.ServiceControllerStatus desiredStatus, timespan timeout)
CanPauseAndContinue       Property      bool CanPauseAndContinue {get;}
CanShutdown               Property      bool CanShutdown {get;}
CanStop                   Property      bool CanStop {get;}
Container                 Property      System.ComponentModel.IContainer Container {get;}
DependentServices         Property      System.ServiceProcess.ServiceController[] DependentServices {get;}
DisplayName               Property      string DisplayName {get;set;}
MachineName               Property      string MachineName {get;set;}
ServiceHandle             Property      System.Runtime.InteropServices.SafeHandle ServiceHandle {get;}
ServiceName               Property      string ServiceName {get;set;}
ServicesDependedOn        Property      System.ServiceProcess.ServiceController[] ServicesDependedOn {get;}
ServiceType               Property      System.ServiceProcess.ServiceType ServiceType {get;}
Site                      Property      System.ComponentModel.ISite Site {get;set;}
StartType                 Property      System.ServiceProcess.ServiceStartMode StartType {get;}
Status                    Property      System.ServiceProcess.ServiceControllerStatus Status {get;}
ToString                  ScriptMethod  System.Object ToString();
#>

# Display the name and required services of the services that has windows in their display name
$Services | Where-Object {$_.DisplayName -like "*windows*"} | select name, RequiredServices, ServiceHandle

#disable and stop the service
$Services | Where-Object {$_.Name -like "*Citrix*"} | Stop-Service -PassThru | Set-Service -StartupType Disabled

#date variable
$date = Get-Date

#Display the type of the $date object
$date.GetType()

#Display the members of the $date object
$date | Get-Member

# some really cool methods
<#
TypeName: System.DateTime

Name                 MemberType     Definition
----                 ----------     ----------
Add                  Method         datetime Add(timespan value)
AddDays              Method         datetime AddDays(double value)
AddHours             Method         datetime AddHours(double value)
AddMilliseconds      Method         datetime AddMilliseconds(double value)
AddMinutes           Method         datetime AddMinutes(double value)
AddMonths            Method         datetime AddMonths(int months)
AddSeconds           Method         datetime AddSeconds(double value)
AddTicks             Method         datetime AddTicks(long value)
AddYears             Method         datetime AddYears(int value)
CompareTo            Method         int CompareTo(System.Object value), int CompareTo(datetime value), int IComparable.CompareTo(System.Object obj), int IComparable[datetime].CompareTo(datetime other)
Equals               Method         bool Equals(System.Object value), bool Equals(datetime value), bool IEquatable[datetime].Equals(datetime other)
GetDateTimeFormats   Method         string[] GetDateTimeFormats(), string[] GetDateTimeFormats(System.IFormatProvider provider), string[] GetDateTimeFormats(char format), string[] GetDateTimeFormats(char format, System.IFormatProvider provider)
GetHashCode          Method         int GetHashCode()
GetObjectData        Method         void ISerializable.GetObjectData(System.Runtime.Serialization.SerializationInfo info, System.Runtime.Serialization.StreamingContext context)
GetType              Method         type GetType()
GetTypeCode          Method         System.TypeCode GetTypeCode(), System.TypeCode IConvertible.GetTypeCode()
IsDaylightSavingTime Method         bool IsDaylightSavingTime()
Subtract             Method         timespan Subtract(datetime value), datetime Subtract(timespan value)
ToBinary             Method         long ToBinary()
ToBoolean            Method         bool IConvertible.ToBoolean(System.IFormatProvider provider)
ToByte               Method         byte IConvertible.ToByte(System.IFormatProvider provider)
ToChar               Method         char IConvertible.ToChar(System.IFormatProvider provider)
ToDateTime           Method         datetime IConvertible.ToDateTime(System.IFormatProvider provider)
ToDecimal            Method         decimal IConvertible.ToDecimal(System.IFormatProvider provider)
ToDouble             Method         double IConvertible.ToDouble(System.IFormatProvider provider)
ToFileTime           Method         long ToFileTime()
ToFileTimeUtc        Method         long ToFileTimeUtc()
ToInt16              Method         int16 IConvertible.ToInt16(System.IFormatProvider provider)
ToInt32              Method         int IConvertible.ToInt32(System.IFormatProvider provider)
ToInt64              Method         long IConvertible.ToInt64(System.IFormatProvider provider)
ToLocalTime          Method         datetime ToLocalTime()
ToLongDateString     Method         string ToLongDateString()
ToLongTimeString     Method         string ToLongTimeString()
ToOADate             Method         double ToOADate()
ToSByte              Method         sbyte IConvertible.ToSByte(System.IFormatProvider provider)
ToShortDateString    Method         string ToShortDateString()
ToShortTimeString    Method         string ToShortTimeString()
ToSingle             Method         float IConvertible.ToSingle(System.IFormatProvider provider)
ToString             Method         string ToString(), string ToString(string format), string ToString(System.IFormatProvider provider), string ToString(string format, System.IFormatProvider provider), string IFormattable.ToString(string format, System.IFormatProvider formatProvider), string IConvertible.ToString(System.IFormatProvider provider)
ToType               Method         System.Object IConvertible.ToType(type conversionType, System.IFormatProvider provider)
ToUInt16             Method         uint16 IConvertible.ToUInt16(System.IFormatProvider provider)
ToUInt32             Method         uint32 IConvertible.ToUInt32(System.IFormatProvider provider)
ToUInt64             Method         uint64 IConvertible.ToUInt64(System.IFormatProvider provider)
ToUniversalTime      Method         datetime ToUniversalTime()
DisplayHint          NoteProperty   DisplayHintType DisplayHint=DateTime
Date                 Property       datetime Date {get;}
Day                  Property       int Day {get;}
DayOfWeek            Property       System.DayOfWeek DayOfWeek {get;}
DayOfYear            Property       int DayOfYear {get;}
Hour                 Property       int Hour {get;}
Kind                 Property       System.DateTimeKind Kind {get;}
Millisecond          Property       int Millisecond {get;}
Minute               Property       int Minute {get;}
Month                Property       int Month {get;}
Second               Property       int Second {get;}
Ticks                Property       long Ticks {get;}
TimeOfDay            Property       timespan TimeOfDay {get;}
Year                 Property       int Year {get;}
DateTime             ScriptProperty System.Object DateTime {get=if ((& { Set-StrictMode -Version 1; $this.DisplayHint }) -ieq  "Date")...

#>

#Display the current date
$date.DayOfWeek

#Display the current day of the year
$date.DayOfYear

#format $date
$StringDate = $date.ToString("yyyy-MM-dd HH:mm:ss")
#Display the formatted date
$StringDate.GetType()

#Display the formatted date
$Formattedate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
# let check the type of the formatted date
$Formattedate.GetType()

#it's string - too late to add days
$Formattedate.AddDays(5)

# we should add days before formatting
Get-date.AddDays(5).ToString("yyyy-MM-dd HH:mm:ss")

#above we are calling 2 methods on the same object 
# we can store the object in a variable and then call the methods
$Formattedate = Get-Date
$Formattedate
$Formattedate.AddDays(5)

#adding days does not change the original object. it just returns a new object
$Formattedate


#let's create a ps string object
$myString = "Hello, World!"

#Display the type of the $myString object
$myString.GetType()

#Display the members of the $myString object
$myString | Get-Member

#Display the length of the $myString object
$myString.Length

#truncate text to 10 characters
$myString.Substring(0, 10)

# methods don't change the original object

#let's replace ! in the string with ?
$myString.Replace("!", "?")

#let's convert the string to uppercase
$myString.ToUpper()

#let's convert the string to lowercase
$myString.ToLower()

#let's split the string by ,
$myString.Split(",")

# let's pick up each split separately
$myString.Split(",")[0]
$myString.Split(",")[1]


# more variable typing
# let's create a variable and assign a string to it
$Val = "5"
# let's check the type of the variable
$val.GetType()

# let's add 10 to the variable
[int]$Val + 10

# let's check the type of the variable. it's still a string!
$val.GetType()

# let's convert the variable to an integer
$int = [int]$Val

$int.GetType()

#can we add text to an integer?
$int + "Hello"

# how can I then add text to an integer?
[string]$int + "Hello"

#force a float and round it
$float = [float]5.548754

$float.GetType()

#round the float
$float = [math]::Round($float, 2)

$float

<#
Challenge 1: Write a PowerShell script that formats the current date and time in the "yyyy-MM-dd HH:mm:ss" format and displays the formatted date.

Challenge 2: Create a PowerShell script that adds 5 days to the current date and time, and then formats the result in the "yyyy-MM-dd HH:mm:ss" format.

Challenge 3: Write a PowerShell script that creates a string variable with the value "Hello, World!" and displays the length of the string.

Challenge 4: Create a PowerShell script that replaces the exclamation mark (!) in the string "Hello, World!" with a question mark (?) and displays the modified string.

#>



