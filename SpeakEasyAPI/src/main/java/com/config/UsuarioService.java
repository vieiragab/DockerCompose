package com.config;

import org.springframework.stereotype.Service;

import com.models.Usuario;
import com.repository.UsuarioRepository;

@Service
public class UsuarioService {
    private UsuarioRepository usuarioRepository;

    public boolean login(String email, String password) {
        Usuario usuario = usuarioRepository.findByEmail(email) ;
        if (usuario == null) {
            return false;
        }
        else if (usuario.getSenha() == password){
            return true;
        }
        else{
            return false;
        }
    }
}
