<%@ Page Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title></title>


	<style type="text/css">
		.cacheTable {
			display: table;
		}

		.cacheTitle {
			display: table-caption;
			text-align: center;
			font-weight: bold;
			font-size: larger;
		}

		.cacheHeading {
			display: table-row;
			font-weight: bold;
			text-align: center;
		}

		.cacheRow {
			display: table-row;
		}

		.cacheCell {
			display: table-cell;
			border: solid;
			border-width: thin;
			padding-left: 5px;
			padding-right: 5px;
			
		}
		.cacheCellKey {
			width:40%;
		}
		.cacheCellValue {
			width:60%;
		}
	</style>
</head>
<body>
	<form id="form1" runat="server">
		<div class="cacheTable">
			<div class="cacheTitle">
				<p>Cache table</p>
				<p><a href="cacheviewer.aspx?reset=1">Reset All Cache</a></p>
			</div>
			<div class="cacheHeading">
				<div class="cacheCell">
					<p>Keys</p>
				</div>
				<div class="cacheCell">
					<p>Values</p>
				</div>
					<div class="cacheCell">
					<p></p>
				</div>
			</div>
			<%int index = 0;
			foreach (DictionaryEntry de in HttpRuntime.Cache)
			{%>
			<div class="cacheRow">
				<div class="cacheCell cacheCellKey"><%=de.Key %></div>
				<div class="cacheCell cacheCellValue"><%=de.Value %></div>
				<div class="cacheCell"><a href="cacheviewer.aspx?reset=1&key=<%=de.Key%>">Remove from Cache</a></div>
				
			</div>
			<%index++;
			}%>
		</div>
	</form>
</body>
</html>


	<script language="c#" runat="server">
	protected void Page_Load(object sender, EventArgs e)
    {
		if (!string.IsNullOrEmpty(Request["reset"]))
		{
			string key = Request["key"];
			if (!string.IsNullOrEmpty(key))
			{
				HttpRuntime.Cache.Remove(key);
			}
			else
			{
				{
					foreach (DictionaryEntry de in HttpRuntime.Cache)
					{
						HttpRuntime.Cache.Remove((String)de.Key);
					}
				}
			}
		}
		
    }
	</script>