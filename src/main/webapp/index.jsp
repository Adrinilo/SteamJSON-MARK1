<%@page import="model.ResultMain"%>
<%@page import="java.util.List"%>
<%@page import="model.App"%>
<%@page import="dao.Main"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<link rel="icon" href="img/ico-steam.svg">
<title>STEAM</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- Bootstrap Personalizado -->
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%
	ResultMain result = Main.getData();
	List<App> apps = result.getApplist().getApps();
	%>
	<div
		class="container-fluid bg-steam-blue d-flex flex-column p-0 m-0 text-white">
		<header class="bg-steam-dark text-center py-3 m-0">
			<img src="img/logo_steam.svg" alt="logo-header"
				style="max-width: 40vw;">
		</header>
		<div class="row container p-0 m-0 my-4 align-self-center">
			<%
			for (App app : apps) {
			%>
			<div class="col-sm-6 col-md-4 col-lg-3 p-2 m-0 d-flex">
				<div class="card bg-steam-blue shadow-lg flex-fill">
					<div class="card-body d-flex flex-column">
						<h4 class="card-title p-0 m-0 mb-5"><%=app.getName()%></h4>
						<a
							href="detail.jsp?appid=<%=app.getAppid()%>&name=<%=app.getName()%>"
							target="_blank"
							class="btn btn-dark bg-steam-dark text-white-50 align-self-end w-50 mt-auto">Más</a>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<footer
			class="d-flex justify-content-center align-items-center bg-steam-dark text-center text-light m-0 py-3 px-5">
			<img src="img/logo_valve.png" alt="logo-footer" class="pr-5">
			<h3 class="pl-5">&copy;ADRINILO</h3>
		</footer>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>