<%@ Page Title="Blue and Brown?" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CollectionWeek._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <script>

        $(function () {

            $("#tabs").tabs();



        });

        $(document).ready(function () {

            if (readCookie("neighborhood") != null) {
                // alert("cookie found");
                $('#toters').html("<img src='images/browntoter.gif' height='200px'><img src='images/bluetoter.gif' height='200px'>");

            }
            else {
                $('#toters').text = " <a href='#' data-reveal-id='myModal'>Click here to choose your neighborhood...</a>";
                createCookie("neighborhood", "Thurs1", 1000);
                // alert("cookie set");
            }
        });

        Date.prototype.getWeek = function () {
            var onejan = new Date(this.getFullYear(), 0, 1);
            return Math.ceil((((this - onejan) / 86400000) + onejan.getDay() + 1) / 7);
        }


        function GetToterInfo(weekday, weeknum) {

            numTotersToReturn=1;

            numOfWeek = date.getWeek();

            if (weeknum==1) {
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

            return numTotersToReturn;
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
               <a href="http://forums.asp.net/18.aspx" title="" style="color: #6b3119">Click here to choose your neighborhood.</a>
                </p>
            </div>
        </section>
    </div>

</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>According to your selection, you should put the following toters on your curb:</h3>
    <br />
    <table>
        <tr>
            <td style="width: 40%">
                <ol class="round">
                    <li class="one">
                        <h5>Blue Toter</h5>
                        Put the blue toter out for this week. Learn what can and can't go into the blue toters by 
            <a href="http://go.microsoft.com/fwlink/?LinkId=245146">clicking here.</a>
                    </li>
                    <li class="two">
                        <h5>Brown Toter</h5>
                        Put the brown toter out for this week. Learn what can and can't go into the brown toters by 
            <a href="http://go.microsoft.com/fwlink/?LinkId=245147">clicking here</a>
                    </li>

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
                        <area shape="poly" coords="238,501,253,507,277,492,340,516,346,714,403,715,401,540,415,543,458,487,460,434,269,431,259,439,253,452," href="ThursdayWeek2.html" alt="ThursdayWeek2" title="ThursdayWeek2" />
                        <area shape="poly" coords="459,434,462,486,416,541,399,537,404,715,503,714,500,432," href="ThursdayWeek1.Html" alt="ThursdayWeek1" title="ThursdayWeek1" />
                        <area shape="poly" coords="502,434,356,428,356,348,359,333,370,333,382,333,385,346,397,344,426,366,569,365,571,431,725,434,729,660,505,659," href="FridayWeek1.Html" alt="FridayWeek1" title="FridayWeek1" />
                        <area shape="poly" coords="355,353,269,334,269,425,356,426," href="WednesdayWeek2.Html" alt="WednesdayWeek2" title="WednesdayWeek2" />
                        <area shape="poly" coords="273,427,253,435,63,436,61,419,-2,416,0,145,58,144,61,10,330,11,328,254,269,252," href="WednesdayWeek1.Html" alt="WednesdayWeek1" title="WednesdayWeek1" />
                        <area shape="poly" coords="332,19,329,252,268,253,268,335,353,351,363,334,380,334,382,343,393,341,427,363,569,361,572,108,387,146,383,21," href="FridayWeek2.Html" alt="FridayWeek2" title="FridayWeek2" />
                        <area shape="poly" coords="343,516,280,491,260,501,254,506,241,502,244,480,257,438,95,437,98,533,77,560,45,602,37,627,26,681,17,712,345,712," href="WednesdayWeek2.Html" alt="ThursdayWeek2" title="ThursdayWeek2" />
                        <area shape="poly" coords="-2,416,60,415,62,437,93,438,99,535,78,556,56,584,39,613,17,713,-2,713," href="WednesDayWeek1" alt="WednesdayWeek1" title="WednesdayWeek1" />
                        <area shape="rect" coords="729,714,731,716" href="http://www.image-maps.com/index.php?aff=mapped_users_8201303221629341" alt="Image Map" title="Image Map" />
                    </map>
                    <!-- Image map text links - Start - If you do not wish to have text links under your image map, you can move or delete this DIV -->
                    <div style="text-align: center; font-size: 12px; font-family: verdana; margin-left: auto; margin-right: auto; width: 733px;">
                        <a style="text-decoration: none; color: black; font-size: 12px; font-family: verdana;" href="ThursdayWeek2.html" title="ThursdayWeek2">ThursdayWeek2</a>
                        | 	<a style="text-decoration: none; color: black; font-size: 12px; font-family: verdana;" href="WednesdayWeek1.Html" title="ThursdayWeek1">ThursdayWeek1</a>
                        | 	<a style="text-decoration: none; color: black; font-size: 12px; font-family: verdana;" href="FridayWeek1.Html" title="FridayWeek1">FridayWeek1</a>
                        | 	<a style="text-decoration: none; color: black; font-size: 12px; font-family: verdana;" href="WednesdayWeek2.Html" title="WednesdayWeek2">WednesdayWeek2</a>
                        | 	<a style="text-decoration: none; color: black; font-size: 12px; font-family: verdana;" href="WednesdayWeek1.Html" title="WednesdayWeek1">WednesdayWeek1</a>
                        | 	<a style="text-decoration: none; color: black; font-size: 12px; font-family: verdana;" href="FridayWeek2.Html" title="FridayWeek2">FridayWeek2</a>
                        | 	<a style="text-decoration: none; color: black; font-size: 12px; font-family: verdana;" href="WednesdayWeek2.Html" title="ThursdayWeek2">ThursdayWeek2</a>
                        | 	<a style="text-decoration: none; color: black; font-size: 12px; font-family: verdana;" href="WednesDayWeek1" title="WednesdayWeek1">WednesdayWeek1</a>
                        | 	<a style="text-decoration: none; color: black; font-size: 12px; font-family: verdana;" href="http://www.image-maps.com/index.php?aff=mapped_users_8201303221629341" title="Image Map">Image Map</a>
                    </div>
                    <!-- Image map text links - End - -->
                </div>
            </div>
            <div id="tabs-2">

                <div style="text-align: center; width: 788px; margin-left: auto; margin-right: auto;">
                    <img id="Img1" src="images/EM_City_Center.jpg" usemap="#Image-Maps_7201303221753007" border="0" width="788" height="580" alt="" />
                    <map id="Map1" name="Image-Maps_7201303221753007">
                        <area shape="poly" coords="385,-1,386,188,382,229,356,303,264,267,178,223,105,171,56,107,32,56,22,-1," href="TuesdayWeek1.html" alt="TuesdayWeek1" title="TuesdayWeek1" />
                        <area shape="poly" coords="389,22,785,19,784,132,586,133,587,233,385,230," href="MondayWeek1.Html" alt="MondayWeek1" title="MondayWeek1" />
                        <area shape="poly" coords="785,133,591,135,589,235,382,229,357,296,363,311,342,494,543,493,546,453,765,452,764,570,783,573," href="MondayWeek2.Html" alt="MondayWeek2" title="MondayWeek2" />
                        <area shape="poly" coords="767,575,764,452,546,452,545,493,347,490,365,308,205,237,103,166,64,121,35,60,26,2,1,0,-1,576," href="TuesdayWeek2.Html" alt="TuesdayWeek2" title="TuesdayWeek2" />
                        <area shape="rect" coords="784,576,786,578" href="http://www.image-maps.com/index.php?aff=mapped_users_7201303221753007" alt="Image Map" title="Image Map" />
                    </map>
                    <!-- Image map text links - Start - If you do not wish to have text links under your image map, you can move or delete this DIV -->
                    <div style="text-align: center; font-size: 12px; font-family: verdana; margin-left: auto; margin-right: auto; width: 788px;">
                        <a style="text-decoration: none; color: black; font-size: 12px; font-family: verdana;" href="TuesdayWeek1.html" title="TuesdayWeek1">TuesdayWeek1</a>
                        | 	<a style="text-decoration: none; color: black; font-size: 12px; font-family: verdana;" href="MondayWeek1.Html" title="MondayWeek1">MondayWeek1</a>
                        | 	<a style="text-decoration: none; color: black; font-size: 12px; font-family: verdana;" href="MondayWeek2.Html" title="MondayWeek2">MondayWeek2</a>
                        | 	<a style="text-decoration: none; color: black; font-size: 12px; font-family: verdana;" href="TuesdayWeek2.Html" title="TuesdayWeek2">TuesdayWeek2</a>
                        | 	<a style="text-decoration: none; color: black; font-size: 12px; font-family: verdana;" href="http://www.image-maps.com/index.php?aff=mapped_users_7201303221753007" title="Image Map">Image Map</a>
                    </div>
                    <!-- Image map text links - End - -->

                </div>
            </div>



        </div>


        <div>
            <a class="close-reveal-modal">&#215;</a>
        </div>



    </div>



</asp:Content>
