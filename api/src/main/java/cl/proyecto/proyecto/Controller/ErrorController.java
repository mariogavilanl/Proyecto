package cl.proyecto.proyecto.Controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController implements org.springframework.boot.web.servlet.error.ErrorController {

    @RequestMapping("/error")
    public String handleError() {
        // Aquí puedes retornar una vista personalizada, como una página HTML o un mensaje
        return "error";  // Nombre de la vista error.html
    }

    public String getErrorPath() {
        return "/error";
    }
}
