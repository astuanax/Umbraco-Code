using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Xml;
using System.Web;

using umbraco;
using umbraco.BusinessLogic;
using umbraco.presentation.umbracobase;

namespace astuanax.uLog4Js
{
    [RestExtension("uLog4Js")]
    public class LogClass
    {
        [RestExtensionMethod( returnXml=false)]
        public static string javascriptError(string javascriptError, string pageid, string url, int linenumber, string browser, string timeoferror)
        {
            bool logEnabled = logenabled();
            if ( !logEnabled)
            {
                umbraco.BusinessLogic.Log.Add(umbraco.BusinessLogic.LogTypes.Notify, umbraco.BusinessLogic.User.GetCurrent(), -1, "uLog4Js is not enabled, please change the configuration");
                return "astuanax.uLog4Js is not enabled, please change the configuration";
            }

            if (javascriptError != null && browser != null && timeoferror != null)
            {
                string logMessage = String.Format(logformat(), url.Replace("_", "/").Replace("-", "."), pageid, javascriptError, linenumber, browser, timeoferror.Replace("_", ":"));
//                    "[uLog4Js] http://" +  + " - ID: " + pageid + " - ERROR: " + javascriptError + " - LINE: " + linenumber + " - BR/OS: " + browser + " - " + timeoferror.Replace("_", ":");
                umbraco.BusinessLogic.Log.Add(umbraco.BusinessLogic.LogTypes.Debug, umbraco.BusinessLogic.User.GetCurrent(), -1, "[astuanax.uLog4Js] " + logMessage);
                return null;
            }
            else
            {
                umbraco.BusinessLogic.Log.Add(umbraco.BusinessLogic.LogTypes.Error, umbraco.BusinessLogic.User.GetCurrent(), -1, "astuanax.uLog4Js: Cannot call method without or empty paramater javascriptError/pageid/url/linenumber/browser/timeoferror");
                return null;
            }
        }

        private static XmlDocument getconfig()
        {

            try
            {
                XmlDocument logConfig = new XmlDocument();
                logConfig.Load(HttpContext.Current.Server.MapPath(GlobalSettings.Path + "/../config/astuanax.config"));
                return logConfig;
            }
            catch
            {
                return new XmlDocument();
            }
        }


        private static bool logenabled() {

            try{
                XmlNode logEnabled = getconfig().DocumentElement.SelectSingleNode("/astuanax/uLog4Js/add[@key = 'logEnabled']/@value");
                return Convert.ToBoolean(logEnabled.Value.ToString());
            }
            catch {
                return false;
            }
        }

        private static string logformat()
        {

            try
            {
                XmlNode logFormat = getconfig().DocumentElement.SelectSingleNode("/astuanax/uLog4Js/add[@key = 'logFormat']/@value");
                return logFormat.Value.ToString();
            }
            catch
            {

                // "[uLog4Js] http://" + url.Replace("_","/").Replace("-",".") + " - ID: " + pageid + " - ERROR: " + javascriptError + " - LINE: " + linenumber + " - BR/OS: " + browser + " - " + timeoferror.Replace("_", ":");
                return "http://{0} - ID: {1} - ERROR: {2} - LINE: {3} - BR/OS: {4} - DATE: {5}";
            }
        }

    }
}