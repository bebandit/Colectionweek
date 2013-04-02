<%@ Page Title="Blue and Brown?" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CollectionWeek._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <script>

        $(function () {

            $("#tabs").tabs();



        });

        $(document).ready(function () {



            $('#blueToter').hide();
            $('#brownToter').hide();
            if (readCookie("weekNum") != null) {
             

                if (readCookie("weekDay") != null) {

                GetToterInfo(readCookie("weekDay"),readCookie("weekNum"));
                }
               

            }
           


        });


        function AddZone(zone2Use) {
            //     alert("Updated")
            $.ajax({
                type: "POST", url: "ZonesInfo.asmx/AddZone", // the function inside the handler
                data: "{zone2Use: '" + zone2Use + "'}"
                 , contentType: 'application/json; charset=utf-8', dataType: 'json', success: function (response) { if (response.d != '1') { alert('Not Saved!'); } }, error: function (response) { alert(response.responseText); }
            });
        }


        function BrownAndBlue(numtoters) {

            if (numtoters == 1) {
                $('#toters').html("<img src='images/browntoter.gif' height='200px'>");
                $('#brownToter').show();
                $('#blueToter').hide();
            }
            else {
                $('#toters').html("<img src='images/browntoter.gif' height='200px'><img src='images/bluetoter.gif' height='200px'>");
                $('#blueToter').show();
                $('#brownToter').show();
            }
        }


        function weekNo() {
            var totalDays = 0;
            now = new Date();
            years = now.getYear()
            if (years < 1000)
                years += 1900
            var days = new Array(12); // Array to hold the total days in a month
            days[0] = 31;
            days[2] = 31;
            days[3] = 30;
            days[4] = 31;
            days[5] = 30;
            days[6] = 31;
            days[7] = 31;
            days[8] = 30;
            days[9] = 31;
            days[10] = 30;
            days[11] = 31;

            //  Check to see if this is a leap year

            if (Math.round(now.getYear() / 4) == now.getYear() / 4) {
                days[1] = 29
            } else {
                days[1] = 28
            }

            //  If this is January no need for any fancy calculation otherwise figure out the
            //  total number of days to date and then determine what week

            if (now.getMonth() == 0) {
                totalDays = totalDays + now.getDate();
            } else {
                var curMonth = now.getMonth();
                for (var count = 1; count <= curMonth; count++) {
                    totalDays = totalDays + days[count - 1];
                }
                totalDays = totalDays + now.getDate();
            }
            var week = Math.round(totalDays / 7);
            return week;
        }



        function GetToterInfo(weekday, weeknum) {

            //add to db

            AddZone(weekday + weeknum);

            numTotersToReturn = 1;

            var d = new Date();
            d = GetTodaysDate();

            numOfWeek = weekNo();

            if (weeknum == 1) {
                if (numOfWeek % 2 == 1) {
                    numTotersToReturn = 1;
                }
                else {
                    numTotersToReturn = 2
                }
            }

            if (weeknum == 2) {
                if (numOfWeek % 2 == 1) {
                    numTotersToReturn = 2;
                }
                else {
                    numTotersToReturn = 1
                }
            }

            //Hide Modal Popup
            $('#myModal').trigger('reveal:close');


            //Set day in text
            $('#dayOfWeek').text(weekday);
            $('#according').show();


            //set cookie
            createCookie("weekNum",weeknum, 1000);
            createCookie("weekDay", weekday, 1000);

            BrownAndBlue(numTotersToReturn);
        }


        function GetTodaysDate() {
            var tdate = new Date();
            var dd = tdate.getDate(); //yeilds day
            var MM = tdate.getMonth(); //yeilds month
            var yyyy = tdate.getFullYear(); //yeilds year
            var xxx = dd + "-" + (MM + 1) + "-" + yyyy;

            return xxx;

        }

    </script>

    <div class="main-content">
        <section class="featured,main-content ">
            <div class="content-wrapper">
                <hgroup class="title">
                    <h1>Brown and Blue?</h1>
                    <h2>Let us help. </h2>
                </hgroup>
                <p style="color: white;">
                    To know if you need to set out your blue toter or just your brown toter, just select your neighborhood below and it will display which toter needs to be put on the curb.
           <a href='#' data-reveal-id='myModal' title="" style="color: #6b3119">Click here to choose your neighborhood.</a>
                </p>
            </div>
        </section>
    </div>

</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div id="according" style="display:none"><h3>According to your selection, you should put the following toters on your curb on <div style="display:inline" id="dayOfWeek"></div>*:</h3></div> 
    <br />
    <table>
        <tr>
            <td style="width: 40%">

                <ol class="round">
                    <div id="brownToter">
                        <li class="one">
                            <h5>Brown Toter</h5>
                            Put the brown toter out for this week. Learn what can and can't go into the brown toters by 
            <a href="pdfs/Eagle Mountain trash letter.pdf">clicking here</a>
                        </li>
                    </div>
                    <div id="blueToter">
                        <li class="two">
                            <h5>Blue Toter</h5>
                            Put the blue toter out for this week. Learn what can and can't go into the blue toters by 
            <a href="pdfs/Recycle Acceptable Items.pdf">clicking here.</a>

                        </li>
                    </div>

                </ol>
            </td>
            <td style="width: 60%; text-align: center">
                <div id="toters">
                    <a href="#" data-reveal-id="myModal">Click here to choose your neighborhood...</a>

                </div>

            </td>
        </tr>
    </table>


    <div id="myModal" class="reveal-modal">
        <h1>Choose your neighborhoood...</h1>

        <div id="tabs">

            <ul>

                <li><a href="#tabs-1">The Ranches</a></li>

                <li><a href="#tabs-2">City Center</a></li>


            </ul>

            <div id="tabs-1">



                <div style="text-align: center; width: 733px; margin-left: auto; margin-right: auto;">
                    <img id="Image-Maps_8201303221629341" src="images/Ranches_Map.jpg" usemap="#Image-Maps_8201303221629341" border="0" width="733" height="718" alt="" />
                    <map id="_Image-Maps_8201303221629341" name="Image-Maps_8201303221629341">
                        <area shape="poly" coords="238,501,253,507,277,492,340,516,346,714,403,715,401,540,415,543,458,487,460,434,269,431,259,439,253,452," href="javascript:GetToterInfo('Thursday',2)" alt="ThursdayWeek2" title="ThursdayWeek2" />
                        <area shape="poly" coords="459,434,462,486,416,541,399,537,404,715,503,714,500,432," href="javascript:GetToterInfo('Thursday',1)" alt="ThursdayWeek1" title="ThursdayWeek1" />
                        <area shape="poly" coords="502,434,356,428,356,348,359,333,370,333,382,333,385,346,397,344,426,366,569,365,571,431,725,434,729,660,505,659," href="javascript:GetToterInfo('Friday',1)" alt="FridayWeek1" title="FridayWeek1" />
                        <area shape="poly" coords="355,353,269,334,269,425,356,426," href="javascript:GetToterInfo('Wednesday',2)" alt="WednesdayWeek2" title="WednesdayWeek2" />
                        <area shape="poly" coords="273,427,253,435,63,436,61,419,-2,416,0,145,58,144,61,10,330,11,328,254,269,252," href="javascript:GetToterInfo('Wednesday',1)" alt="WednesdayWeek1" title="WednesdayWeek1" />
                        <area shape="poly" coords="332,19,329,252,268,253,268,335,353,351,363,334,380,334,382,343,393,341,427,363,569,361,572,108,387,146,383,21," href="javascript:GetToterInfo('Friday',2)" alt="FridayWeek2" title="FridayWeek2" />
                        <area shape="poly" coords="343,516,280,491,260,501,254,506,241,502,244,480,257,438,95,437,98,533,77,560,45,602,37,627,26,681,17,712,345,712," href="javascript:GetToterInfo('Wednesday',2)" alt="ThursdayWeek2" title="ThursdayWeek2" />
                        <area shape="poly" coords="-2,416,60,415,62,437,93,438,99,535,78,556,56,584,39,613,17,713,-2,713," href="javascript:GetToterInfo('Wednesday',1)" alt="WednesdayWeek1" title="WednesdayWeek1" />
                        <area shape="rect" coords="729,714,731,716" href="http://www.image-maps.com/index.php?aff=mapped_users_8201303221629341" alt="Image Map" title="Image Map" />
                    </map>
                   
                    <!-- Image map text links - End - -->
                </div>
            </div>
            <div id="tabs-2">

                <div style="text-align: center; width: 788px; margin-left: auto; margin-right: auto;">
                    <img id="Img1" src="images/EM_City_Center.jpg" usemap="#Image-Maps_7201303221753007" border="0" width="788" height="580" alt="" />
                    <map id="Map1" name="Image-Maps_7201303221753007">
                        <area shape="poly" coords="385,-1,386,188,382,229,356,303,264,267,178,223,105,171,56,107,32,56,22,-1," href="javascript:GetToterInfo('Tuesday',1)" alt="TuesdayWeek1" title="TuesdayWeek1" />
                        <area shape="poly" coords="389,22,785,19,784,132,586,133,587,233,385,230," href="javascript:GetToterInfo('Monday',1)" alt="MondayWeek1" title="MondayWeek1" />
                        <area shape="poly" coords="785,133,591,135,589,235,382,229,357,296,363,311,342,494,543,493,546,453,765,452,764,570,783,573," href="javascript:GetToterInfo('Monday',2)" alt="MondayWeek2" title="MondayWeek2" />
                        <area shape="poly" coords="767,575,764,452,546,452,545,493,347,490,365,308,205,237,103,166,64,121,35,60,26,2,1,0,-1,576," href="javascript:GetToterInfo('Tuesday',2)" alt="TuesdayWeek2" title="TuesdayWeek2" />
                        <area shape="rect" coords="784,576,786,578" href="http://www.image-maps.com/index.php?aff=mapped_users_7201303221753007" alt="Image Map" title="Image Map" />
                    </map>
                   
                    <!-- Image map text links - End - -->

                </div>
            </div>



        </div>


        <div>
            <a class="close-reveal-modal">&#215;</a>
        </div>



    </div>



</asp:Content>
