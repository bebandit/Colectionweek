using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for ZonesInfo
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class ZonesInfo : System.Web.Services.WebService {

    public ZonesInfo () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public int AddZone(string zone2Use) {

        collectionWeekDBMLDataContext cw = new collectionWeekDBMLDataContext();
        Zone z = new Zone();
        z.Zone1 = zone2Use;
        cw.Zones.InsertOnSubmit(z);
        cw.SubmitChanges();
        return 1;
    }
    
}
