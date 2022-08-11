package clase13mayo;

import java.sql.SQLException;
import java.util.List;

public class Main {

	public static void main(String [] args) throws SQLException {

		TableManager tm = new TableManager();
		tm.createUserTable();
		
		
		UsuarioDAO dao = new UsuarioDAOH2Impl();
		
		String user = "user1";
		String email = "email1";
		String pass = "pass1";
		Usuario aInsertar = new Usuario();
		aInsertar.setUser(user);
		aInsertar.setEmail(email);
		aInsertar.setPass(pass);
		try {
			dao.crearUsuario(aInsertar);
		} catch (ClaveDuplicadaException e) {
			System.out.println("EL USUARIO "+user+"YA EXISTE");
		}

		String userOtro = "userOtro";
		String emailOtro = "emailOtro";
		String passOtro = "passOtro";
		Usuario aInsertarOtro = new Usuario();
		aInsertarOtro.setUser(userOtro);
		aInsertarOtro.setEmail(emailOtro);
		aInsertarOtro.setPass(passOtro);
		try {
			dao.crearUsuario(aInsertarOtro);
		} catch (ClaveDuplicadaException e) {
			System.out.println("EL USUARIO "+user+"YA EXISTE");
		}

		System.out.println("Voy a modificar el usuario usuario: userOtro");
		String user2 = "userOtro";
		String email2 = "email@mail.com";
		String pass2 = "password";
		Usuario aEditar = new Usuario(user2, email2, pass2);
		dao.actualizaUsuario(aEditar);
		System.out.println("Voy a modificar el usuario usuario: user1");
		String userx = "user1";
		String emailx = "emailx";
		String passx = "passx";
		Usuario paraEditar = new Usuario(userx, emailx, passx);
		dao.actualizaUsuario(paraEditar);

		System.out.println("Ahora voy a mostrar el usuario user1");
		String unUser = "user1";
		Usuario usuarioBase = dao.muestraUsuario(unUser);
		System.out.println(usuarioBase);
		System.out.println("---------");

		System.out.println("Tengo estos usuarios:");
		List<Usuario> listaTodosLosUsuarios = null;
		try {
			listaTodosLosUsuarios = dao.listaTodosLosUsuarios();
		} catch (DAOExceptiom daoExceptiom) {
			daoExceptiom.printStackTrace();
		}
		for (Usuario usuario : listaTodosLosUsuarios) {
			System.out.println(usuario);
		}
		System.out.println("------");
		
		
		System.out.println("Voy a borrar un usuario segun su username");
		try {
			dao.borraUsuario("user1");
		} catch (DAOExceptiom daoExceptiom) {
			daoExceptiom.printStackTrace();
		}

		System.out.println("Entonces, ahora Tengo estos usuarios:");
		List<Usuario> otraListaUsuarios = null;
		try {
			otraListaUsuarios = dao.listaTodosLosUsuarios();
		} catch (DAOExceptiom daoExceptiom) {
			daoExceptiom.printStackTrace();
		}
		for (Usuario u : otraListaUsuarios ) {
			System.out.println(u);
		}
		System.out.println("------");

		System.out.println("Opcional - Borro la tabla de usuarios. ");
		//tm.dropUserTable();


	}
	
}
