<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Avaya - Register Form</title>
    <link href="css/general.css" rel="stylesheet" type="text/css" />
    <link href="css/messi.css" rel="stylesheet" type="text/css" />
    <link href="css/prettyLoader.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.js"></script>
    <script src="js/messi.js"></script>
    <script src="js/json2.js"></script>
    <script src="js/prettyLoader.js"></script>
    <script src="js/register.js"></script>
    <meta name="developer" content="William Ballesteros Blanco (wballesteros@avaya.com)  Avaya Inc. 2014" />
    <meta name="WT.si_n" content="Responder" />
    <meta name="WT.si_x" content="1" />
    <meta name="WT.si_n" content="Responder" />

    <meta name="WT.si_x" content="1" />

</head>

<body>
    <script src='//tealium.hs.llnwd.net/o43/utag/avaya/main/prod/utag.js'></script>
    <center>
        <h2>Your feedback is appreciated!</h2>
        <p>Thank you for taking a few minutes to complete this brief survey about Avaya Innovations. <br/>
            Your answers will help us better understand how to improve the magazine and bring you more relevant,<br /> timely, useful information to help your business succeed.</p>
<table width="650" border="0" cellspacing="0" cellpadding="0">
  
  <tr>
    <td align="left" style="font-family:Arial, Helvetica, sans-serif; font-size: 13px; text-align:left; padding: 20px"><table width="610" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr>
        <td width="100%" align="left" style="font-family:Arial, Helvetica, sans-serif; font-size: 13px; text-align: justify; color:#444">
          
  </td>
        </tr>
      
      <tr>
        <td align="left" style="font-family:Arial, Helvetica, sans-serif; font-size: 13px; text-align:left; padding-top: 12px; color:#444">
          <div id="form1">
            <table align="center">
              <tr valign="baseline">
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td align="left"><font color="#CC0000">*</font> <font color="#999999">Campo Obligatorio</font></td>
                </tr>
              <tr valign="baseline">
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td>&nbsp;</td>
                </tr>
              
              <tr valign="baseline">
                <td nowrap="nowrap" align="left"><font color="#CC0000">*</font></td>
                <td colspan="2" align="left" nowrap="nowrap">1.  How many issues of Avaya Innovations have you read? </td>
              </tr>
              <tr valign="baseline">
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td><select name="q1" id="q1">
                  <option value="------------" selected="selected">------------</option>
                  <option value="This is the first and only issue I have read">This is the first and only issue I have read</option>
                  <option value="Two">Two</option>
                  <option value="More than two">More than two</option>
                  </select></td>
              </tr>
             
              
              <tr valign="baseline">
                <td nowrap="nowrap" align="left"><font color="#CC0000">*</font></td>
                                                             
                <td colspan="2" align="left" nowrap="nowrap">2.  How would you prefer to read Avaya Innovations? [Please select up to two choices only.] </td>
                </tr>
              <tr valign="baseline">
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td><div id="q2">
                        <input type="checkbox" name="question2" value="Print magazine" /><label>Print magazine</label><br />
                        <input type="checkbox" name="question2" value="Online (desktop or laptop computer)"/><label>Online (desktop or laptop computer)</label><br />
                        <input type="checkbox" name="question2" value="Smartphone"/><label>Smartphone </label><br />
                        <input type="checkbox" name="question2" value="Other mobile device (e.g., tablet)"/><label>Other mobile device (e.g., tablet)</label><br />
                     </div>
                </td>
               </tr>
             
              
              <tr valign="baseline">
                <td nowrap="nowrap" align="left"><font color="#CC0000">*</font></td>
                                                             
                <td colspan="2" align="left" nowrap="nowrap">What types of articles do you find most relevant? [Please use the rating scale below; choose one rating for each article type.]   </td>
                </tr>
              <tr valign="baseline">
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td nowrap="nowrap" align="left">&nbsp;</td>
                  <td>
                <table>
                    <thead><tr><th>Article Type</th><th>1. Not relevant to me at all</th><th>2. Somewhat relevant to me </th><th>3. Relevant to me  </th><th>4. Very relevant to me </th><th>5. Extremely relevant to me</th></thead>
                    <tbody>
                        <tr id="q3"><td>Feature articles on trends in business and telecommunications </td><td><input type="radio" name="radio1" value="Not relevant to me at all" /></td><td><input type="radio" name="radio1" value="Somewhat relevant to me" /></td><td><input type="radio" name="radio1" value="Relevant to me" /></td><td><input type="radio" name="radio1" value="Very relevant to me" /></td><td><input type="radio" name="radio1" value="Extremely relevant to me" /></td></tr>
                        <tr id="q4"><td>Feature articles on Avaya staff, solutions, and projects</td><td><input type="radio" name="radio2" value="Not relevant to me at all" /></td><td><input type="radio" name="radio2" value="Somewhat relevant to me" /></td><td><input type="radio" name="radio2" value="Relevant to me" /></td><td><input type="radio" name="radio2" value="Very relevant to me" /></td><td><input type="radio" name="radio2" value="Extremely relevant to me" /></td></tr>
                        <tr id="q5"><td>Interviews with thought leaders and Avaya partners</td><td><input type="radio" name="radio3" value="Not relevant to me at all" /></td><td><input type="radio" name="radio3" value="Somewhat relevant to me" /></td><td><input type="radio" name="radio3" value="Relevant to me" /></td><td><input type="radio" name="radio3" value="Very relevant to me" /></td><td><input type="radio" name="radio3" value="Extremely relevant to me" /></td></tr>
                        <tr id="q6"><td>Reviews and descriptions of new products and technologies </td><td><input type="radio" name="radio4" value="Not relevant to me at all" /></td><td><input type="radio" name="radio4" value="Somewhat relevant to me" /></td><td><input type="radio" name="radio4" value="Relevant to me" /></td><td><input type="radio" name="radio4" value="Very relevant to me" /></td><td><input type="radio" name="radio4" value="Extremely relevant to me" /></td></tr>
                        <tr id="q7"><td>Case studies</td><td><input type="radio" name="radio5" value="Not relevant to me at all" /></td><td><input type="radio" name="radio5" value="Somewhat relevant to me" /></td><td><input type="radio" name="radio5" value="Relevant to me" /></td><td><input type="radio" name="radio5" value="Very relevant to me" /></td><td><input type="radio" name="radio5" value="Extremely relevant to me" /></td></tr>
                        <tr id="q8"><td>Avaya news</td><td><input type="radio" name="radio6" value="Not relevant to me at all" /></td><td><input type="radio" name="radio6" value="Somewhat relevant to me" /></td><td><input type="radio" name="radio6" value="Relevant to me" /></td><td><input type="radio" name="radio6" value="Very relevant to me" /></td><td><input type="radio" name="radio6" value="Extremely relevant to me" /></td></tr>
                        <tr id="q9"><td>Event descriptions and calendars</td><td><input type="radio" name="radio7" value="Not relevant to me at all" /></td><td><input type="radio" name="radio7" value="Somewhat relevant to me" /></td><td><input type="radio" name="radio7" value="Relevant to me" /></td><td><input type="radio" name="radio7" value="Very relevant to me" /></td><td><input type="radio" name="radio7" value="Extremely relevant to me" /></td></tr>
                    </tbody>

                    </table></td>
                </tr>
              
              <tr valign="baseline">
                <td nowrap="nowrap" align="left"><font color="#CC0000">*</font></td>
                <td colspan="2" align="left" nowrap="nowrap">4.  How valuable do you think the content of this issue of Avaya Innovations is? [Please use the rating scale below; choose one rating for each article type.] </td>
              </tr>
              <tr valign="baseline">
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td>
                    <table>
                        <thead><tr><th>Issue 1, 2014</th><th>1. Not valuable at all</th><th>2. Somewhat valuable  </th><th>3. Valuable   </th><th>4. Very valuable  </th><th>5. Extremely valuable</th></thead>
                        <tbody>
                            <tr id="q10"><td>Avaya Innovations content </td><td><input type="radio" name="radio8" value="1" /></td><td><input type="radio" name="radio8" value="2" /></td><td><input type="radio" name="radio8" value="3" /></td><td><input type="radio" name="radio8" value="4" /></td><td><input type="radio" name="radio8" value="5" /></td></tr>
                        </tbody>
                    </table>
                </td>
                </tr>
              
              <tr valign="baseline">
                <td nowrap="nowrap" align="left"><font color="#CC0000"></font></td>
                                                            
                <td colspan="2" align="left" nowrap="nowrap"> 5.  What articles, topics, and information would you be interested in seeing in future issues? </td>
                </tr>
              <tr valign="baseline">
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td><textarea id="q11" rows="3"></textarea></td>
              </tr>
              
              <tr valign="baseline">
                <td nowrap="nowrap" align="left"><font color="#CC0000">*</font></td>
                                                             
                <td colspan="2" align="left" nowrap="nowrap">6. Which of the following categories best describes you and your relationship to Avaya?</td>
              </tr>
              <tr valign="baseline">
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td><select name="datos" id="q12">
                      <option value="------------" selected="selected">------------</option>
                      <option value="Avaya employee">Avaya employee</option>
                      <option value="Avaya partner">Avaya partner</option>
                      <option value="Customer of Avaya or an Avaya partner">Customer of Avaya or an Avaya partner</option>
                    </select>
                </td>
              </tr>
              
              <tr valign="baseline">
                <td nowrap="nowrap" align="left"><font color="#CC0000">*</font></td>
                <td colspan="2" align="left" nowrap="nowrap">If you do not have a current relationship with Avaya or an Avaya partner(s), select the option that best describes your business:</td>
              </tr>
              <tr valign="baseline">
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td>
                    <select name="datos" id="q13">
                          <option value="------------" selected="selected">------------</option>
                          <option value="Small business (up to 250 employees)">Small business (up to 250 employees)</option>
                          <option value="Midsize business (251–999 employees)">Midsize business (251–999 employees)</option>
                          <option value="Large enterprise (1,000 or more employees)">Large enterprise (1,000 or more employees)</option>
                          <option value="Other">Other</option>
                    </select>
                </td>
                </tr>
              
              <tr valign="baseline">
                  <td nowrap="nowrap" align="left"><font color="#CC0000"></font></td>
                  <td colspan="2" align="left" nowrap="nowrap">if Other please describe: </td>
              </tr>

              <tr valign="baseline">
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td>
                    <textarea id="q14" rows="3"></textarea>
                </td>
              </tr>
              
              <tr valign="baseline">
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td nowrap="nowrap" align="left">&nbsp;</td>
                <td align="right"><input type="image" src="images/submit.jpg" id="accept"/></td>
                </tr>
              </table>
            
            </div>
          </td>
        </tr>
      </table></td>
  </tr>
  </table>

</center>
</body>
</html>
