<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Calendário de Eventos</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="<c:url value='/css/event.css'/>">
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
      <a class="navbar-brand fw-bold" href="<c:url value='/home.jsp'/>">TDK Academy</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav me-auto">
          <li class="nav-item">
            <a class="nav-link active" href="<c:url value='/home.jsp'/>">Início</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<c:url value='/event.jsp'/>">Eventos</a>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navComp" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Treinos
            </a>
            <ul class="dropdown-menu" aria-labelledby="navComp">
              <li><a class="dropdown-item" href="<c:url value='/myTraining'/>">Meus Treinos</a></li>
					<li><a class="dropdown-item" href="<c:url value='/training'/>">Cadastrar Treino</a></li>
            </ul>
          </li>
          <li class="nav-item">
			<a class="nav-link" href="<c:url value='/statistics.jsp'/>">Estatísticas</a>
		  </li>
			          
        </ul>
        <div class="d-flex align-items-center text-white">
          <span class="me-3">Olá, <strong>${not empty student ? student.name : name}</strong></span>
          <a href="<c:url value='/logout'/>" class="btn btn-outline-light btn-sm">Sair</a>
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
	
		  <!-- JULHO -->
		  <section class="month-column">
		    <header class="month-header">
		      <h5>JULHO 2025</h5>
		      <table class="mini-calendar">
		        <thead>
		        <tr>
		          <th>Dom</th><th>Seg</th><th>Ter</th><th>Qua</th><th>Qui</th><th>Sex</th><th>Sab</th>
		        </tr>
		        </thead>
		        <tbody>
		        <tr>
		          <td></td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td>
		        </tr>
		        <tr>
		          <td>7</td><td>8</td><td>9</td><td>10</td><td>11</td><td>12</td><td>13</td>
		        </tr>
		        <tr>
		          <td>14</td><td>15</td><td>16</td><td>17</td><td>18</td><td>19</td><td>20</td>
		        </tr>
		        <tr>
		          <td>21</td><td>22</td><td>23</td><td>24</td><td>25</td><td>26</td><td>27</td>
		        </tr>
		        <tr>
		          <td>28</td><td>29</td><td>30</td><td>31</td><td></td><td></td><td></td>
		        </tr>
		        </tbody>
		      </table>
		    </header>
		
		    <!-- linha clicável "Julho 2025" -->
		    <div class="month-toggle" data-target="julho">
		      Julho 2025
		    </div>
		
		    <!-- detalhes de JULHO -->
		    <div class="month-details" id="details-julho">

			  <p class="month-detail-title">
			    <span class="event-title-tag legend-event">
			      05/07 – Treino especial de Poomsae
			    </span><br>
			    Aulas focadas na execução dos poomsaes Taeguk 1 a 6.
			  </p>
			
			  <p class="month-detail-title">
			    <span class="event-title-tag legend-exam">
			      13/07 – Exame de Faixa – 1º semestre
			    </span><br>
			    Avaliação de Kibon-Dongjak, Chute básico e Sparring controlado.
			  </p>
			
			  <p class="month-detail-title">
			    <span class="event-title-tag legend-campeonato">
			      20/07 – Campeonato Paulista de Taekwondo
			    </span><br>
			    Competição oficial – categorias infantil, juvenil e adulto.
			  </p>
			
			  <p class="month-detail-title">
			    <span class="event-title-tag legend-festival">
			      27/07 – Festival Interno da Academia
			    </span><br>
			    Apresentação dos alunos iniciantes, demonstrações de formas e chutes.
			  </p>
			
			</div>

		  </section>
		
		  <!-- AGOSTO -->
		  <section class="month-column">
		    <header class="month-header">
		      <h5>AGOSTO 2025</h5>
		      <table class="mini-calendar">
		        <thead>
		        <tr>
		          <th>Dom</th><th>Seg</th><th>Ter</th><th>Qua</th><th>Qui</th><th>Sex</th><th>Sab</th>
		        </tr>
		        </thead>
		        <tbody>
		        <tr>
		          <td></td><td></td><td></td><td></td><td>1</td><td>2</td><td>3</td>
		        </tr>
		        <tr>
		          <td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td>
		        </tr>
		        <tr>
		          <td>11</td><td>12</td><td>13</td><td>14</td><td>15</td><td>16</td><td>17</td>
		        </tr>
		        <tr>
		          <td>18</td><td>19</td><td>20</td><td>21</td><td>22</td><td>23</td><td>24</td>
		        </tr>
		        <tr>
		          <td>25</td><td>26</td><td>27</td><td>28</td><td>29</td><td>30</td><td>31</td>
		        </tr>
		        </tbody>
		      </table>
		    </header>
		
		    <!-- texto do mês (fecha/abre os detalhes de AGOSTO) -->
		    <div class="month-toggle" data-target="agosto">
		      Agosto 2025
		    </div>
		
		    <!-- detalhes de AGOSTO -->
			<div class="month-details" id="details-agosto">
			
			  <p class="month-detail-title">
			    <span class="event-title-tag legend-event">
			      03/08 – Treino técnico: Defesa pessoal
			    </span><br>
			    Ênfase em liberações de pegada e quedas de segurança.
			  </p>
			
			  <p class="month-detail-title">
			    <span class="event-title-tag legend-campeonato">
			      11/08 – Open Taekwondo Championships
			    </span><br>
			    Torneio aberto de lutas e poomsae.
			  </p>
			
			  <p class="month-detail-title">
			    <span class="event-title-tag legend-exam">
			      17/08 – Pré-avaliação para Exame de Faixa
			    </span><br>
			    Revisão de técnicas e requisitos obrigatórios.
			  </p>
			
			  <p class="month-detail-title">
			    <span class="event-title-tag legend-festival">
			      25/08 – Festival Infantil de Chutes
			    </span><br>
			    Atividade lúdica para turmas kids (4–10 anos).
			  </p>
			
			  <p class="month-detail-title">
			    <span class="event-title-tag legend-close">
			      30/08 – Fechamento do Período de Inscrições
			    </span><br>
			    Último dia para inscrição no Exame de Faixa de Setembro.
			  </p>
			
			</div>
		  </section>
	
		</div>
	
	
	    <!-- ACORDEON COM DETALHES -->
	    <div class="container mt-4">
	      <div class="accordion" id="eventsAccordion">
	      </div>
	    </div>
	
	  </div>
	<script>
	  // pega todas as linhas clicáveis de mês
	  const monthToggles = document.querySelectorAll('.month-toggle');
	
	  monthToggles.forEach(function (toggle) {
	    toggle.addEventListener('click', function () {
	      const target = toggle.dataset.target;           // ex: "julho"
	      const details = document.getElementById('details-' + target);
	
	      if (!details) return;
	
	      // alterna só esse mês (abre/fecha)
	      details.classList.toggle('show');
	    });
	  });
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
