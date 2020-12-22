--
-- (C) 2019-20 - ntop.org
--

-- ##############################################

local alert_keys = require "alert_keys"
-- Import the classes library.
local classes = require "classes"
-- Make sure to import the Superclass!
local alert = require "alert"

-- ##############################################

local alert_snmp_device_reset = classes.class(alert)

-- ##############################################

alert_snmp_device_reset.meta = {
   alert_key = alert_keys.ntopng.alert_snmp_device_reset,
   i18n_title = "alerts_dashboard.alert_snmp_device_reset_title",
   icon = "fas fa-power-off",
}

-- ##############################################

-- @brief Prepare an alert table used to generate the alert
-- @param device_ip A string with the ip address of the snmp device
-- @return A table with the alert built
function alert_snmp_device_reset:init(device_ip)
   -- Call the paren constructor
   self.super:init()

   self.alert_type_params = {
      device = device_ip
   }
end

-- #######################################################

-- @brief Format an alert into a human-readable string
-- @param ifid The integer interface id of the generated alert
-- @param alert The alert description table, including alert data such as the generating entity, timestamp, granularity, type
-- @param alert_type_params Table `alert_type_params` as built in the `:init` method
-- @return A human-readable string
function alert_snmp_device_reset.format(ifid, alert, alert_type_params)
   return(i18n("alerts_dashboard.alert_snmp_device_reset_description",
	       {device = alert_type_params.device,
		url = snmpDeviceUrl(alert_type_params.device)}))
end

-- #######################################################

return alert_snmp_device_reset
