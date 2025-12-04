<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<title>TDK Academy - Calendário de Eventos</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/css/event.css'/>">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand fw-bold" href="<c:url value='/home.jsp'/>">TDK
				Academy</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/home.jsp'/>">Início</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="<c:url value='/event.jsp'/>">Eventos</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navComp"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Treinos </a>
						<ul class="dropdown-menu" aria-labelledby="navComp">
							<li><a class="dropdown-item"
								href="<c:url value='/myTraining'/>">Meus Treinos</a></li>
							<li><a class="dropdown-item"
								href="<c:url value='/training-register.jsp'/>">Cadastrar
									Treino</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/statistics.jsp'/>">Estatísticas</a></li>

				</ul>
				<div class="d-flex align-items-center text-white">
					<span class="me-3">Olá, <strong>${not empty student ? student.name : name}</strong></span>
					<a href="<c:url value='/logout'/>"
						class="btn btn-outline-light btn-sm">Sair</a>
				</div>
			</div>
		</div>
	</nav>

	<div class="container-fluid py-4 events-page">
		<h2 class="text-center text-white mb-4">Calendário de Eventos</h2>

		<div class="events-legend">
			<span class="events-legend-label">Legenda:</span>
			<span class="legend-badge legend-today">Hoje</span>
			<span class="legend-badge legend-event">Seminário</span>
			<span class="legend-badge legend-exam">Exame de Faixa</span>
			<span class="legend-badge legend-campeonato">Campeonato</span>
			<span class="legend-badge legend-festival">Festival</span>
			<span class="legend-badge legend-close">Fechamento do Período</span>
		</div>

		<div class="calendar-grid">

			<c:forEach var="month" items="${months}">
				<c:set var="slug"
					value="${fn:replace(fn:toLowerCase(month.label), ' ', '-')}" />

				<section class="month-column">
					<header class="month-header">
						<h5>${month.label}</h5>

						<c:choose>
							<c:when test="${month.label == 'JANEIRO 2025'}">
								<table class="mini-calendar">
									<thead>
										<tr>
											<th>Dom</th>
											<th>Seg</th>
											<th>Ter</th>
											<th>Qua</th>
											<th>Qui</th>
											<th>Sex</th>
											<th>Sab</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td>1</td>
											<td>2</td>
											<td>3</td>
											<td>4</td>
										</tr>
										<tr>
											<td>5</td>
											<td>6</td>
											<td>7</td>
											<td>8</td>
											<td>9</td>
											<td>10</td>
											<td>11</td>
										</tr>
										<tr>
											<td>12</td>
											<td><span class="calendar-day calendar-day-festival">13</span></td>
											<td>14</td>
											<td>15</td>
											<td>16</td>
											<td>17</td>
											<td><span class="calendar-day calendar-day-seminario">18</span></td>
										</tr>
										<tr>
											<td>19</td>
											<td>20</td>
											<td>21</td>
											<td>22</td>
											<td>23</td>
											<td>24</td>
											<td><span class="calendar-day calendar-day-seminario">25</span></td>
										</tr>
										<tr>
											<td>26</td>
											<td>27</td>
											<td>28</td>
											<td>29</td>
											<td><span class="calendar-day calendar-day-exame">30</span></td>
											<td>31</td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</c:when>

							<c:when test="${month.label == 'FEVEREIRO 2025'}">
								<table class="mini-calendar">
									<thead>
										<tr>
											<th>Dom</th>
											<th>Seg</th>
											<th>Ter</th>
											<th>Qua</th>
											<th>Qui</th>
											<th>Sex</th>
											<th>Sab</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>1</td>
										</tr>
										<tr>
											<td>2</td>
											<td>3</td>
											<td>4</td>
											<td>5</td>
											<td>6</td>
											<td>7</td>
											<td><span class="calendar-day calendar-day-seminario">8</span></td>
										</tr>
										<tr>
											<td>9</td>
											<td>10</td>
											<td>11</td>
											<td>12</td>
											<td>13</td>
											<td>14</td>
											<td><span class="calendar-day calendar-day-festival">15</span></td>
										</tr>
										<tr>
											<td>16</td>
											<td>17</td>
											<td>18</td>
											<td>19</td>
											<td>20</td>
											<td>21</td>
											<td><span class="calendar-day calendar-day-exame">22</span></td>
										</tr>
										<tr>
											<td>23</td>
											<td>24</td>
											<td>25</td>
											<td>26</td>
											<td>27</td>
											<td><span class="calendar-day calendar-day-fechamento">28</span></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</c:when>

							<c:when test="${month.label == 'MARÇO 2025'}">
								<table class="mini-calendar">
									<thead>
										<tr>
											<th>Dom</th>
											<th>Seg</th>
											<th>Ter</th>
											<th>Qua</th>
											<th>Qui</th>
											<th>Sex</th>
											<th>Sab</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>1</td>
										</tr>
										<tr>
											<td>2</td>
											<td>3</td>
											<td>4</td>
											<td>5</td>
											<td>6</td>
											<td>7</td>
											<td>8</td>
										</tr>
										<tr>
											<td>
												<span class="calendar-day-multi calendar-day-campeonato-festival">9</span>
											</td>
											<td>10</td>
											<td>11</td>
											<td>12</td>
											<td>13</td>
											<td>14</td>
											<td><span class="calendar-day calendar-day-seminario">15</span></td>
										</tr>
										<tr>
											<td>16</td>
											<td>17</td>
											<td>18</td>
											<td>19</td>
											<td>20</td>
											<td>21</td>
											<td><span class="calendar-day calendar-day-seminario">22</span></td>
										</tr>
										<tr>
											<td>23</td>
											<td>24</td>
											<td>25</td>
											<td>26</td>
											<td>27</td>
											<td>28</td>
											<td><span class="calendar-day calendar-day-festival">29</span></td>
										</tr>
										<tr>
											<td>30</td>
											<td>31</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</c:when>

							<c:when test="${month.label == 'ABRIL 2025'}">
								<table class="mini-calendar">
									<thead>
										<tr>
											<th>Dom</th>
											<th>Seg</th>
											<th>Ter</th>
											<th>Qua</th>
											<th>Qui</th>
											<th>Sex</th>
											<th>Sab</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td>1</td>
											<td>2</td>
											<td>3</td>
											<td>4</td>
											<td><span class="calendar-day calendar-day-seminario">5</span></td>
										</tr>
										<tr>
											<td>6</td>
											<td>7</td>
											<td>8</td>
											<td>9</td>
											<td>10</td>
											<td>11</td>
											<td><span class="calendar-day calendar-day-campeonato">12</span></td>
										</tr>
										<tr>
											<td>13</td>
											<td>14</td>
											<td>15</td>
											<td>16</td>
											<td>17</td>
											<td>18</td>
											<td>
												<span class="calendar-day-multi calendar-day-exame-seminario">19</span>
											</td>
										</tr>
										<tr>
											<td>20</td>
											<td>21</td>
											<td>22</td>
											<td>23</td>
											<td>24</td>
											<td>25</td>
											<td><span class="calendar-day calendar-day-festival">26</span></td>
										</tr>
										<tr>
											<td>27</td>
											<td>28</td>
											<td>29</td>
											<td>30</td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</c:when>

							<c:when test="${month.label == 'MAIO 2025'}">
								<table class="mini-calendar">
									<thead>
										<tr>
											<th>Dom</th>
											<th>Seg</th>
											<th>Ter</th>
											<th>Qua</th>
											<th>Qui</th>
											<th>Sex</th>
											<th>Sab</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>1</td>
											<td>2</td>
											<td><span class="calendar-day calendar-day-seminario">3</span></td>
										</tr>
										<tr>
											<td>4</td>
											<td>5</td>
											<td>6</td>
											<td>7</td>
											<td>8</td>
											<td>9</td>
											<td><span class="calendar-day calendar-day-seminario">10</span></td>
										</tr>
										<tr>
											<td>11</td>
											<td>12</td>
											<td>13</td>
											<td>14</td>
											<td>15</td>
											<td>16</td>
											<td>17</td>
										</tr>
										<tr>
											<td><span class="calendar-day calendar-day-campeonato">18</span></td>
											<td>19</td>
											<td>20</td>
											<td>21</td>
											<td>22</td>
											<td>23</td>
											<td>24</td>
										</tr>
										<tr>
											<td>25</td>
											<td>26</td>
											<td>27</td>
											<td>28</td>
											<td>29</td>
											<td>30</td>
											<td><span class="calendar-day calendar-day-fechamento">31</span></td>
										</tr>
									</tbody>
								</table>
							</c:when>

							<c:when test="${month.label == 'JUNHO 2025'}">
								<table class="mini-calendar">
									<thead>
										<tr>
											<th>Dom</th>
											<th>Seg</th>
											<th>Ter</th>
											<th>Qua</th>
											<th>Qui</th>
											<th>Sex</th>
											<th>Sab</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>2</td>
											<td>3</td>
											<td>4</td>
											<td>5</td>
											<td>6</td>
											<td><span class="calendar-day calendar-day-seminario">7</span></td>
										</tr>
										<tr>
											<td>8</td>
											<td>9</td>
											<td>10</td>
											<td>11</td>
											<td>12</td>
											<td>13</td>
											<td>
												<span class="calendar-day-multi calendar-day-exame-festival">14</span>
											</td>
										</tr>
										<tr>
											<td>15</td>
											<td>16</td>
											<td>17</td>
											<td>18</td>
											<td>19</td>
											<td>20</td>
											<td><span class="calendar-day calendar-day-festival">21</span></td>
										</tr>
										<tr>
											<td>22</td>
											<td>23</td>
											<td>24</td>
											<td>25</td>
											<td>26</td>
											<td>27</td>
											<td><span class="calendar-day calendar-day-fechamento">28</span></td>
										</tr>
										<tr>
											<td>29</td>
											<td>30</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</c:when>

							<c:when test="${month.label == 'JULHO 2025'}">
								<table class="mini-calendar">
									<thead>
										<tr>
											<th>Dom</th>
											<th>Seg</th>
											<th>Ter</th>
											<th>Qua</th>
											<th>Qui</th>
											<th>Sex</th>
											<th>Sab</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td>1</td>
											<td>2</td>
											<td>3</td>
											<td>4</td>
											<td><span class="calendar-day calendar-day-seminario">5</span></td>
										</tr>
										<tr>
											<td>6</td>
											<td>7</td>
											<td>8</td>
											<td>9</td>
											<td>10</td>
											<td>11</td>
											<td>12</td>
										</tr>
										<tr>
											<td><span class="calendar-day calendar-day-campeonato">13</span></td>
											<td>14</td>
											<td>15</td>
											<td>16</td>
											<td>17</td>
											<td>18</td>
											<td><span class="calendar-day calendar-day-seminario">19</span></td>
										</tr>
										<tr>
											<td>20</td>
											<td>21</td>
											<td>22</td>
											<td>23</td>
											<td>24</td>
											<td>25</td>
											<td>26</td>
										</tr>
										<tr>
											<td>
												<span class="calendar-day-multi calendar-day-campeonato-festival">27</span>
											</td>
											<td>28</td>
											<td>29</td>
											<td>30</td>
											<td>31</td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</c:when>

							<c:when test="${month.label == 'AGOSTO 2025'}">
								<table class="mini-calendar">
									<thead>
										<tr>
											<th>Dom</th>
											<th>Seg</th>
											<th>Ter</th>
											<th>Qua</th>
											<th>Qui</th>
											<th>Sex</th>
											<th>Sab</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>1</td>
											<td><span class="calendar-day calendar-day-seminario">2</span></td>
											<td>3</td>
										</tr>
										<tr>
											<td>4</td>
											<td>5</td>
											<td>6</td>
											<td>7</td>
											<td>8</td>
											<td>9</td>
											<td>
												<span class="calendar-day-multi calendar-day-campeonato-seminario">10</span>
											</td>
										</tr>
										<tr>
											<td>11</td>
											<td>12</td>
											<td>13</td>
											<td>14</td>
											<td>15</td>
											<td>16</td>
											<td><span class="calendar-day calendar-day-exame">17</span></td>
										</tr>
										<tr>
											<td>18</td>
											<td>19</td>
											<td>20</td>
											<td>21</td>
											<td>22</td>
											<td>23</td>
											<td><span class="calendar-day calendar-day-festival">24</span></td>
										</tr>
										<tr>
											<td>25</td>
											<td>26</td>
											<td>27</td>
											<td>28</td>
											<td>29</td>
											<td>30</td>
											<td>31</td>
										</tr>
									</tbody>
								</table>
							</c:when>

							<c:when test="${month.label == 'SETEMBRO 2025'}">
								<table class="mini-calendar">
									<thead>
										<tr>
											<th>Dom</th>
											<th>Seg</th>
											<th>Ter</th>
											<th>Qua</th>
											<th>Qui</th>
											<th>Sex</th>
											<th>Sab</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td>1</td>
											<td>2</td>
											<td>3</td>
											<td>4</td>
											<td>5</td>
											<td><span class="calendar-day calendar-day-exame">6</span></td>
										</tr>
										<tr>
											<td>7</td>
											<td>8</td>
											<td>9</td>
											<td>10</td>
											<td>11</td>
											<td>12</td>
											<td><span class="calendar-day calendar-day-seminario">13</span></td>
										</tr>
										<tr>
											<td>14</td>
											<td>15</td>
											<td>16</td>
											<td>17</td>
											<td>18</td>
											<td>19</td>
											<td>20</td>
										</tr>
										<tr>
											<td><span class="calendar-day calendar-day-campeonato">21</span></td>
											<td>22</td>
											<td>23</td>
											<td>24</td>
											<td>25</td>
											<td>26</td>
											<td>27</td>
										</tr>
										<tr>
											<td>28</td>
											<td>29</td>
											<td><span class="calendar-day calendar-day-fechamento">30</span></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</c:when>

							<c:when test="${month.label == 'OUTUBRO 2025'}">
								<table class="mini-calendar">
									<thead>
										<tr>
											<th>Dom</th>
											<th>Seg</th>
											<th>Ter</th>
											<th>Qua</th>
											<th>Qui</th>
											<th>Sex</th>
											<th>Sab</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td>1</td>
											<td>2</td>
											<td>3</td>
											<td>4</td>
											<td>5</td>
										</tr>
										<tr>
											<td>6</td>
											<td>7</td>
											<td>8</td>
											<td>9</td>
											<td>10</td>
											<td>11</td>
											<td>
												<span class="calendar-day-multi calendar-day-festival-seminario">12</span>
											</td>
										</tr>
										<tr>
											<td>13</td>
											<td>14</td>
											<td>15</td>
											<td>16</td>
											<td>17</td>
											<td><span class="calendar-day calendar-day-seminario">18</span></td>
											<td>19</td>
										</tr>
										<tr>
											<td>20</td>
											<td>21</td>
											<td>22</td>
											<td>23</td>
											<td>24</td>
											<td><span class="calendar-day calendar-day-campeonato">25</span></td>
											<td>26</td>
										</tr>
										<tr>
											<td>27</td>
											<td>28</td>
											<td>29</td>
											<td>30</td>
											<td><span class="calendar-day calendar-day-fechamento">31</span></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</c:when>

							<c:when test="${month.label == 'NOVEMBRO 2025'}">
								<table class="mini-calendar">
									<thead>
										<tr>
											<th>Dom</th>
											<th>Seg</th>
											<th>Ter</th>
											<th>Qua</th>
											<th>Qui</th>
											<th>Sex</th>
											<th>Sab</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>1</td>
										</tr>
										<tr>
											<td>2</td>
											<td>3</td>
											<td>4</td>
											<td>5</td>
											<td>6</td>
											<td>7</td>
											<td><span class="calendar-day calendar-day-seminario">8</span></td>
										</tr>
										<tr>
											<td>9</td>
											<td>10</td>
											<td>11</td>
											<td>12</td>
											<td>13</td>
											<td>14</td>
											<td>
												<span class="calendar-day-multi calendar-day-exame-seminario">15</span>
											</td>
										</tr>
										<tr>
											<td>16</td>
											<td>17</td>
											<td>18</td>
											<td>19</td>
											<td>20</td>
											<td>21</td>
											<td>22</td>
										</tr>
										<tr>
											<td><span class="calendar-day calendar-day-festival">23</span></td>
											<td>24</td>
											<td>25</td>
											<td>26</td>
											<td>27</td>
											<td>28</td>
											<td>29</td>
										</tr>
										<tr>
											<td><span class="calendar-day calendar-day-fechamento">30</span></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</c:when>

							<c:when test="${month.label == 'DEZEMBRO 2025'}">
								<table class="mini-calendar">
									<thead>
										<tr>
											<th>Dom</th>
											<th>Seg</th>
											<th>Ter</th>
											<th>Qua</th>
											<th>Qui</th>
											<th>Sex</th>
											<th>Sab</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td>1</td>
											<td>2</td>
											<td>3</td>
											<td>4</td>
											<td>5</td>
											<td><span class="calendar-day calendar-day-campeonato">6</span></td>
										</tr>
										<tr>
											<td>7</td>
											<td>8</td>
											<td>9</td>
											<td><span class="calendar-day calendar-day-seminario">10</span></td>
											<td>11</td>
											<td>12</td>
											<td><span class="calendar-day-multi calendar-day-festival-fechamento">13</span></td>
										</tr>
										<tr>
											<td>14</td>
											<td>15</td>
											<td>16</td>
											<td>17</td>
											<td>18</td>
											<td>19</td>
											<td>20</td>
										</tr>
										<tr>
											<td>21</td>
											<td>22</td>
											<td>23</td>
											<td>24</td>
											<td>25</td>
											<td>26</td>
											<td>27</td>
										</tr>
										<tr>
											<td>28</td>
											<td>29</td>
											<td>30</td>
											<td>31</td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</c:when>
						</c:choose>

					</header>

					<div class="month-toggle" data-target="${slug}">
						${month.label}
					</div>

					<div class="month-details show" id="details-${slug}">
						<c:forEach var="ev" items="${month.events}">
							<p class="month-detail-title">
								<span
									class="event-title-tag
                            <c:choose>
                                <c:when test="${ev.type == 'SEMINARIO'}"> legend-event</c:when>
                                <c:when test="${ev.type == 'EXAME'}"> legend-exam</c:when>
                                <c:when test="${ev.type == 'CAMPEONATO'}"> legend-campeonato</c:when>
                                <c:when test="${ev.type == 'FESTIVAL'}"> legend-festival</c:when>
                                <c:when test="${ev.type == 'FECHAMENTO'}"> legend-close</c:when>
                            </c:choose>
                        ">
									${ev.date.dayOfMonth} – ${ev.title}
								</span><br>
								${ev.description}
							</p>
						</c:forEach>
					</div>
				</section>
			</c:forEach>

		</div>

	</div>

	<div class="container mt-4">
		<div class="accordion" id="eventsAccordion"></div>
	</div>
	<script>
		const monthToggles = document.querySelectorAll('.month-toggle');

		monthToggles.forEach(function(toggle) {
			toggle.addEventListener('click', function() {
				const target = toggle.dataset.target;
				const details = document.getElementById('details-' + target);

				if (!details)
					return;

				details.classList.toggle('show');
			});
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
