package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.models.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long>{
 
    Usuario findByEmail(String busca);

}
