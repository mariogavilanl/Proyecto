package cl.proyecto.proyecto.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import cl.proyecto.proyecto.Repository.BscRSituacionDepartamentoRepository;
import cl.proyecto.proyecto.Service.IHomeService;

import org.springframework.ui.Model;



@Controller
public class HomeController {

    private final IHomeService homeService;
    private final BscRSituacionDepartamentoRepository repo;
    
    @Autowired
    public HomeController(IHomeService homeService, BscRSituacionDepartamentoRepository repo) {
        this.repo = repo;
        this.homeService = homeService;
    }


    @GetMapping("/")
    public String home1(Model mode) {

        var asdasdas = this.repo.findDepartamentoSituacionWithVotes();
        System.out.println(asdasdas);
        
        return "votos";
    }
   
}