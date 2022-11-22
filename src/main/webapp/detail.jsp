<%@page import="model.Platforms"%>
<%@page import="model.Element"%>
<%@page import="model.Screenshot"%>
<%@page import="model.Data"%>
<%@page import="model.ResultDetail"%>
<%@page import="dao.Detail"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="img/ico-steam.svg">
<title>STEAM/DETAIL</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>

<body>
	<%
	String appid = request.getParameter("appid");
	Data data = null;
	data = Detail.getDetail(appid).getData();
	%>
	<div
		class="container-fluid bg-steam-blue d-flex flex-column flex-fill p-0 m-0 text-white min-vh-100">
		<header class="bg-steam-dark text-center py-3 m-0">
			<img src="img/logo_steam.svg" alt="logo-header"
				style="max-width: 40vw;">
		</header>
		<%
		if (data == null) {
		%>
		<div
			class="d-flex flex-column flex-fill justify-content-center align-items-center p-0">
			<h1 class="display-1">404</h1>
			<p>Page not found</p>
		</div>
		<%
		} else {
		List<Screenshot> imagenes = data.getScreenshots();
		%>
		<div class="row container m-0 p-0 align-self-center">
			<div class="col-12 m-0 p-0 px-2 px-md-0">
				<h1 class="p-0 my-4"><%=data.getName()%></h1>
			</div>
			<div class="col-lg-8 m-0 p-0 px-2 px-md-0 d-flex flex-column">
				<div id="carouselScreenshots"
					class="carousel slide carousel-fade pr-lg-2" data-ride="carousel">
					<ol class="carousel-indicators">
						<%
						for (Screenshot imagen : imagenes) {
							if (imagen.getId() == 0) {
						%>
						<li data-target="#carouselScreenshots" data-slide-to="0"
							class="active"></li>
						<%
						} else {
						%>
						<li data-target="#carouselScreenshots"
							data-slide-to="<%=imagen.getId()%>"></li>
						<%
						}
						}
						%>
					</ol>
					<div class="carousel-inner">
						<%
						for (Screenshot imagen : imagenes) {
							if (imagen.getId() == 0) {
						%>
						<div class="carousel-item active">
							<img src="<%=imagen.getPath_full()%>" class="d-block w-100"
								alt="imagen-<%=imagen.getId()%>">
						</div>
						<%
						} else {
						%>
						<div class="carousel-item">
							<img src="<%=imagen.getPath_full()%>" class="d-block w-100"
								alt="imagen<%=imagen.getId()%>">
						</div>
						<%
						}
						}
						%>
					</div>
				</div>
				<div
					class="p-2 bg-steam-dark-blue text-white-50 d-flex flex-fill align-items-center mr-lg-2">
					<p class="font-weight-bold mb-1 mr-2">ETIQUETAS POPULARES PARA
						ESTE PRODUCTO:</p>
					<div class="p-0 m-0">
						<%
						for (Element element : data.getGenres()) {
						%>
						<a
							class="btn btn-primary bg-steam-light-blue border-0 text-white-50 m-1"
							href="https://store.steampowered.com/tags/es/<%=element.getDescription()%>"
							target="_blank" role="button"><%=element.getDescription()%></a>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<div class="col-lg-4 m-0 p-0 px-2 px-md-0 d-flex">
				<div class="row m-0 p-0 bg-steam-dark-blue">
					<div class="col-6 col-lg-12 p-0 m-0">
						<img src="<%=data.getHeader_image()%>" alt="thumbnail-detail"
							class="img-fluid" />
					</div>
					<div class="col-6 col-lg-12 p-2 m-0">
						<%=data.getShort_description()%>
					</div>
					<div class="col-12 p-2 m-0">
						<div class="mt-2 d-flex">
							<p class="text-white-50 font-weight-bold">FECHA DE
								LANZAMIENTO:</p>
							<p class="text-info pl-2">20 SEP 2016</p>
						</div>
						<%
						String developers = data.getDevelopersString(data.getDevelopers());
						String publishers = data.getPublishersString(data.getPublishers());
						if (developers.equals("") == false) {
						%>
						<div class="p-0 m-0 d-flex">
							<p class="text-white-50 font-weight-bold">DESARROLLADORES:</p>
							<p class="text-info pl-2"><%=developers%></p>
						</div>
						<%
						}
						%>
						<%
						if (!publishers.equals("")) {
						%>
						<div class="p-0 m-0 d-flex">
							<p class="text-white-50 font-weight-bold">EDITORES:</p>
							<p class="text-info pl-2"><%=publishers%></p>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
		<div class="row container m-0 my-4 p-0 px-2 px-md-0 align-self-center">
			<div class="col-md-8 m-0 p-0 pr-md-2">
				<div
					class="row bg-steam-grey p-2 m-0 rounded d-flex justify-content-between align-items-center">

					<div class="col-12 pl-1">
						<h4>
							Comprar
							<%=data.getName()%></h4>
					</div>
					<div class="col-12 d-flex justify-content-end p-1">
						<div
							class="d-flex align-items-center bg-dark text-light rounded p-1">
							<%
							String textbutton = "Añadir al carro";
							if (!data.getIs_free()) {
								String precio = data.getPrice_overview().getFinal_formatted();
							%>
							<p class="m-0 px-2">
								<%=precio.substring(0, precio.length() - 1)%>
								<%=data.getPrice_overview().getCurrency()%>
							</p>
							<%
							} else {
							textbutton = "Jugar";
							%>
							<p class="m-0 px-2">Free to play</p>
							<%
							}
							%>
							<div class="bg-success rounded p-2">
								<a class="m-0 px-1 text-decoration-none text-warning" href=""
									role="button"><%=textbutton%></a>
							</div>
						</div>
					</div>
				</div>
				<div class="my-5">
					<h6>ACERCA DE ESTE JUEGO</h6>
					<hr class="bg-steam-light-blue mt-0 mr-5" />
					<p><%=data.getDetailed_description()%></p>
				</div>
				<div class="row m-0 p-0">
					<div class="col-12 m-0 p-0">
						<h6>REQUISITOS DEL SISTEMA</h6>
						<hr class="bg-steam-light-blue mt-0 mr-5" />
					</div>
					<div class="col-6 m-0 p-0">
						<p>
							<%=data.getPc_requirements().getMinimum()%>
						</p>
					</div>
					<div class="col-6 m-0 p-0 pl-1">
						<p>
							<%=data.getPc_requirements().getRecommended()%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 m-0 p-0">
				<div class="m-0 p-2 bg-steam-dark-blue">
					<%
					for (Element element : data.getCategories()) {
					%>
					<a
						class="btn btn-primary bg-steam-light-blue p-1 my-1 d-block text-left border-0 rounded-0 text-decoration-none text-white-50"
						href="https://store.steampowered.com/search/?category2=<%=element.getId()%>"
						target="_blank" role="button"><%=element.getDescription()%></a>
					<%
					}
					%>
				</div>
				<div class="mt-3 p-2 bg-steam-dark-blue">
					<div
						class="d-flex justify-content-between bg-steam-light-blue p-1 my-1 d-block text-white-50">
						<p class="m-0">Windows</p>
						<p class="m-0">
							<%
							if (data.getPlatforms().isWindows()) {
							%>
							&#10003;
							<%
							} else {
							%>
							&#10007;
							<%
							}
							%>
						</p>
					</div>
					<div
						class="d-flex justify-content-between bg-steam-light-blue p-1 my-1 d-block text-white-50">
						<p class="m-0">Linux</p>
						<p class="m-0">
							<%
							if (data.getPlatforms().isLinux()) {
							%>
							&#10003;
							<%
							} else {
							%>
							&#10007;
							<%
							}
							%>
						</p>
					</div>
					<div
						class="d-flex justify-content-between bg-steam-light-blue p-1 my-1 d-block text-white-50">
						<p class="m-0">Mac</p>
						<p class="m-0">
							<%
							if (data.getPlatforms().isMac()) {
							%>
							&#10003;
							<%
							} else {
							%>
							&#10007;
							<%
							}
							%>
						</p>
					</div>
				</div>
				<div class="mt-3 p-2 bg-steam-dark-blue">
					<a
						class="btn btn-primary bg-steam-light-blue p-1 my-1 d-block text-left border-0 rounded-0 text-decoration-none text-white-50"
						href="<%=data.getWebsite()%>" target="_blank" role="button">Visitar
						el sitio web Oficial <img src="img/external_link.png"
						alt="external_link">
					</a>
				</div>
			</div>
		</div>
		<%
		}
		%>
		<footer
			class="d-flex justify-content-center align-items-center bg-steam-dark text-center text-light m-0 mt-2 py-3">
			<img src="img/logo_valve.png" alt="logo-footer" class="mx-5 my-0">
			<h3 class="mx-5 my-0">&copy;ADRINILO</h3>
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