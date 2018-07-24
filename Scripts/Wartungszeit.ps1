 #1st get a content database
 get-SPContentDatabase  #this will list them all
                        #copy and paste a database ID and use it to assign a specific DB to a variable
 $ContentDB = Get-SPContentDatabase -Identity f73f5ed8-c596-4174-a5a6-2cf4ead4bec1
 
 #now we're going to add a maintenance window to the SPContentDatabase with $ContentDB.MaintenanceWindows.Add()
 #before we can do that we need to create a Maintenance window object and populate it.
 
 #                         Parameter List             "MaintanceWarning or MaintanencePlanned",  Mt Start   ,  Mt End   , Notify Start, Notify End, duration , urlforinfo-Duration
 $MaintWindow = New-Object Microsoft.SharePoint.Administration.SPMaintenanceWindow "MaintenancePlanned", "3/6/2013 03:00:00 PM", "3/6/2013 03:00:05 PM", "3/6/2013 02:55:00 PM" ,"3/6/2013 03:00:00 PM",  "00:01:00", "http://sp2013/outageinfo.html"
    #Parameter List for above:
      #1: MaintanceWarning or MaintanencePlanned,
      #2: Maintenance Start Date
      #3: Maintenance End Date
      #4: Notification Start Date
      #5: Notification End Date
      #6: Duration in the format of DD:HH:mm:ss - "1:00:00" = 1 hour, "1:00:00:00" = 1 day
      #7: URL for info
      # Parameters 2-5 all take a date time in this format: "1/20/2012" or "1/20/2012 5:00:00 PM"  
 
  #Now we can see the properties of a single MaintenanceWindow by just typing in $MW and hitting enter:
  $MaintWindow
 
  #for me this looked like this:
  # MaintenanceStartDate        : 1/1/2013 6:00:00 AM
  # MaintenanceEndDate          : 1/2/2013 6:00:00 AM
  # Duration                    : 01:00:00
  # NotificationStartDate       : 11/16/2012 6:00:00 AM
  # NotificationEndDate         : 1/3/2013 6:00:00 AM
  # MaintenanceType             : MaintenancePlanned
  # MaintenanceLink             : http://www.mydomain.com/outageinfo.html
  # UpgradedPersistedProperties :
 
  #ok with that out of the way, we just need to add it to he content database
  $ContentDB.MaintenanceWindows.add($MaintWindow)
  $ContentDB.Update()