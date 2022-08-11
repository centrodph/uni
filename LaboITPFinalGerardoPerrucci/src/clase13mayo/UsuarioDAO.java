package clase13mayo;

import java.util.List;

public interface UsuarioDAO {

	void crearUsuario(Usuario unUsuario) throws ClaveDuplicadaException;

	void borraUsuario(String username) throws DAOExceptiom;

	void actualizaUsuario(Usuario unUsuario);

	Usuario muestraUsuario(String username);

	List<Usuario> listaTodosLosUsuarios() throws DAOExceptiom;

}
